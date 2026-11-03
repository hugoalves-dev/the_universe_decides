import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:theuniversedecides/controllers/dice_roll_controller.dart';
import 'package:theuniversedecides/l10n/generated/app_localizations.dart';
import 'package:theuniversedecides/screens/dice_roll_screen.dart';
import 'package:theuniversedecides/services/random_org_service.dart';

void main() {
  testWidgets('disables dice controls while fetching and animating', (
    tester,
  ) async {
    final client = _PendingClient();
    final container = _containerFor(client);
    addTearDown(container.dispose);

    await _pumpDiceScreen(tester, container);

    expect(find.byType(Card), findsNothing);

    final roll = container.read(diceRollProvider.notifier).startRoll();
    await tester.pump();

    _expectControlsDisabled(tester);

    client.complete('3');
    await roll;
    await tester.pump();

    _expectControlsDisabled(tester);
  });

  testWidgets('shows the result only after the animation finishes', (
    tester,
  ) async {
    final client = _PendingClient();
    final container = _containerFor(client);
    addTearDown(container.dispose);
    await _pumpDiceScreen(tester, container);
    final controller = container.read(diceRollProvider.notifier);
    final roll = controller.startRoll();
    client.complete('3');
    await roll;
    await tester.pump();
    expect(find.byKey(const Key('dice-total')), findsNothing);
    controller.completeAnimation(
      container.read(diceRollProvider).activeRequestId!,
    );
    await tester.pump();
    expect(find.byKey(const Key('dice-total')), findsOneWidget);
    final result = tester.getRect(find.byKey(const Key('dice-total')));
    final arena = tester.getRect(find.byKey(const Key('dice-arena')));
    expect(result.center.dx, closeTo(arena.center.dx, 1));
  });

  testWidgets('keeps the arena stable while the window changes during a roll', (
    tester,
  ) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(800, 900);
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final client = _PendingClient();
    final container = _containerFor(client);
    addTearDown(container.dispose);
    await _pumpDiceScreen(tester, container);
    final controller = container.read(diceRollProvider.notifier);
    final roll = controller.startRoll();
    client.complete('3');
    await roll;
    await tester.pump();
    final initialSize = tester.getSize(find.byKey(const Key('dice-arena')));
    final initialElement = tester.element(find.byKey(const Key('dice-arena')));
    tester.view.physicalSize = const Size(800, 600);
    await tester.pump();
    expect(tester.getSize(find.byKey(const Key('dice-arena'))), initialSize);
    expect(
      tester.element(find.byKey(const Key('dice-arena'))),
      same(initialElement),
    );
    controller.completeAnimation(
      container.read(diceRollProvider).activeRequestId!,
    );
    await tester.pump();
    expect(
      tester.getSize(find.byKey(const Key('dice-arena'))),
      isNot(initialSize),
    );
  });

  testWidgets('hides fetched result when the dice animation fails', (
    tester,
  ) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(1080, 2400);
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    final client = _PendingClient();
    final container = _containerFor(client);
    addTearDown(container.dispose);

    await _pumpDiceScreen(tester, container);

    final controller = container.read(diceRollProvider.notifier);
    final roll = controller.startRoll();
    client.complete('3');
    await roll;
    await tester.pump();
    controller.failAnimation(
      container.read(diceRollProvider).activeRequestId!,
      'Renderer unavailable',
    );
    await tester.pump();
    await tester.pump();

    expect(container.read(diceRollProvider).total, 3);
    expect(find.byKey(const Key('dice-total')), findsNothing);
    expect(find.text('Renderer unavailable'), findsWidgets);
  });

  testWidgets('timeout reports an error and releases controls', (tester) async {
    final client = _PendingClient();
    final container = _containerFor(client);
    addTearDown(container.dispose);

    await _pumpDiceScreen(tester, container);

    final roll = container.read(diceRollProvider.notifier).startRoll();
    client.complete('3');
    await roll;
    await tester.pump();
    await tester.pump(const Duration(seconds: 12));

    final state = container.read(diceRollProvider);
    expect(state.isRolling, isFalse);
    expect(state.animationError, 'Dice animation timed out.');
    expect(state.results, [3]);
    expect(find.text('Dice animation timed out.'), findsWidgets);
    expect(find.byKey(const Key('dice-total')), findsNothing);
    expect(
      tester
          .widget<InkWell>(
            find.descendant(
              of: find.byKey(const Key('dice-roll-button')),
              matching: find.byType(InkWell),
            ),
          )
          .onTap,
      isNotNull,
    );
  });
}

Future<void> _pumpDiceScreen(WidgetTester tester, ProviderContainer container) {
  return tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: DiceRollScreen(
            diceWebViewBuilder: (_) => const SizedBox.expand(),
          ),
        ),
      ),
    ),
  );
}

void _expectControlsDisabled(WidgetTester tester) {
  for (final key in const [
    Key('dice-count-1'),
    Key('dice-side-20'),
    Key('dice-roll-button'),
  ]) {
    expect(
      tester
          .widget<InkWell>(
            find.descendant(
              of: find.byKey(key),
              matching: find.byType(InkWell),
            ),
          )
          .onTap,
      isNull,
      reason: '$key should be disabled while busy',
    );
  }
}

ProviderContainer _containerFor(_PendingClient client) {
  return ProviderContainer(
    overrides: [
      randomOrgServiceProvider.overrideWithValue(
        RandomOrgService(client: client),
      ),
    ],
  );
}

class _PendingClient extends http.BaseClient {
  final _response = Completer<http.Response>();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final response = await _response.future;
    return http.StreamedResponse(
      Stream.value(response.bodyBytes),
      response.statusCode,
      headers: response.headers,
    );
  }

  void complete(String body) {
    _response.complete(http.Response(body, 200));
  }
}
