import 'dart:async';
import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

const _randomOrgBaseUrl = 'https://www.random.org/integers/';
const _randomOrgTimeout = Duration(seconds: 6);

final randomOrgServiceProvider = Provider<RandomOrgService>((ref) {
  final service = RandomOrgService();
  ref.onDispose(service.dispose);
  return service;
});

class RandomOrgService {
  RandomOrgService({
    http.Client? client,
    math.Random? random,
    math.Random Function()? secureRandomFactory,
  })
    : _client = client ?? http.Client(),
      _random = random,
      _secureRandomFactory = secureRandomFactory ?? math.Random.secure;

  final http.Client _client;
  final math.Random? _random;
  final math.Random Function() _secureRandomFactory;
  final StreamController<RandomOrgFallbackEvent> _fallbackController =
      StreamController<RandomOrgFallbackEvent>.broadcast();

  Stream<RandomOrgFallbackEvent> get fallbackEvents =>
      _fallbackController.stream;

  Future<List<int>> fetchIntegers({
    required int count,
    required int min,
    required int max,
  }) async {
    if (count <= 0 || max < min) {
      return const [];
    }

    final uri = Uri.parse(_randomOrgBaseUrl).replace(
      queryParameters: {
        'num': '$count',
        'min': '$min',
        'max': '$max',
        'col': '1',
        'base': '10',
        'format': 'plain',
        'rnd': 'new',
      },
    );

    final http.Response response;
    try {
      // Keep the wait short so the UI can fall back quickly on slow networks.
      response = await _client.get(uri).timeout(_randomOrgTimeout);
    } on TimeoutException {
      return _fallback(count: count, min: min, max: max);
    } catch (_) {
      return _fallback(count: count, min: min, max: max);
    }

    if (response.statusCode != 200) {
      return _fallback(count: count, min: min, max: max);
    }

    final values = response.body
        .trim()
        .split(RegExp(r'\s+'))
        .where((value) => value.isNotEmpty)
        .map(int.tryParse)
        .whereType<int>()
        .toList();

    // Unexpected payloads should feel the same as offline mode to callers.
    if (values.length != count ||
        values.any((value) => value < min || value > max)) {
      return _fallback(count: count, min: min, max: max);
    }

    return values;
  }

  List<int> _fallback({required int count, required int min, required int max}) {
    final math.Random fallbackRandom;
    try {
      fallbackRandom = _random ?? _secureRandomFactory();
    } on UnsupportedError {
      _reportFallback(secureSourceAvailable: false);
      final ordinaryRandom = math.Random();
      return List<int>.generate(
        count,
        (_) => min + ordinaryRandom.nextInt(max - min + 1),
      );
    }
    _reportFallback();
    return List<int>.generate(
      count,
      (_) => min + fallbackRandom.nextInt(max - min + 1),
    );
  }

  void _reportFallback({bool secureSourceAvailable = true}) {
    if (!_fallbackController.isClosed) {
      _fallbackController.add(
        RandomOrgFallbackEvent(secureSourceAvailable: secureSourceAvailable),
      );
    }
  }

  void dispose() {
    _fallbackController.close();
    _client.close();
  }
}

class RandomOrgFallbackEvent {
  const RandomOrgFallbackEvent({this.secureSourceAvailable = true});

  final bool secureSourceAvailable;
}
