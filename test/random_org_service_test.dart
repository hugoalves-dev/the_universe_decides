import 'dart:math' as math;

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:theuniversedecides/services/random_org_service.dart';

void main() {
  test('fetchIntegers parses Random.org responses', () async {
    final service = RandomOrgService(
      client: MockClient((_) async => http.Response('1\n3\n5\n', 200)),
      random: math.Random(7),
    );

    addTearDown(service.dispose);

    final values = await service.fetchIntegers(count: 3, min: 1, max: 6);

    expect(values, [1, 3, 5]);
  });

  test('fetchIntegers falls back to local randomness on failure', () async {
    final service = RandomOrgService(
      client: MockClient((_) async => http.Response('oops', 500)),
      random: math.Random(7),
    );

    addTearDown(service.dispose);

    final values = await service.fetchIntegers(count: 4, min: 2, max: 4);

    expect(values, hasLength(4));
    expect(values.every((value) => value >= 2 && value <= 4), isTrue);
  });

  test('fetchIntegers emits a fallback event on failure', () async {
    final service = RandomOrgService(
      client: MockClient((_) async => http.Response('oops', 500)),
      random: math.Random(7),
    );

    addTearDown(service.dispose);

    final fallbackEvent = service.fallbackEvents.first.timeout(
      const Duration(seconds: 1),
    );

    await service.fetchIntegers(count: 1, min: 0, max: 1);

    await expectLater(fallbackEvent, completion(isA<RandomOrgFallbackEvent>()));
  });

  test('rejects Random.org values outside the requested bounds', () async {
    final service = RandomOrgService(
      client: MockClient((_) async => http.Response('0\n7\n', 200)),
      random: math.Random(7),
    );
    addTearDown(service.dispose);

    final values = await service.fetchIntegers(count: 2, min: 1, max: 6);

    expect(values, hasLength(2));
    expect(values.every((value) => value >= 1 && value <= 6), isTrue);
  });

  test('the default local fallback is bounded', () async {
    final service = RandomOrgService(
      client: MockClient((_) async => http.Response('unavailable', 503)),
    );
    addTearDown(service.dispose);

    final values = await service.fetchIntegers(count: 100, min: 1, max: 6);

    expect(values, hasLength(100));
    expect(values.every((value) => value >= 1 && value <= 6), isTrue);
  });

  test('labels its non-cryptographic fallback when secure randomness is unsupported', () async {
    final service = RandomOrgService(
      client: MockClient((_) async => http.Response('unavailable', 503)),
      secureRandomFactory: () => throw UnsupportedError('No secure source'),
    );
    addTearDown(service.dispose);
    final event = service.fallbackEvents.first;

    final values = await service.fetchIntegers(count: 20, min: 1, max: 6);
    expect(values, hasLength(20));
    expect(values.every((value) => value >= 1 && value <= 6), isTrue);
    await expectLater(
      event,
      completion(
        isA<RandomOrgFallbackEvent>().having(
          (value) => value.secureSourceAvailable,
          'secureSourceAvailable',
          isFalse,
        ),
      ),
    );
  });
}
