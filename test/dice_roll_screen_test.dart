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
  testWidgets('custom dice count retains focus across keyboard resize', (
    tester,
  ) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(400, 900);
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
      tester.view.resetViewInsets();
    });
    final client = _PendingClient();
    final container = _containerFor(client);
    addTearDown(container.dispose);

    await _pumpDiceScreen(tester, container);

    final field = find.byKey(const Key('dice-count-custom'));
    await tester.tap(field);
    await tester.pump();
    expect(
      tester.widget<EditableText>(find.byType(EditableText)).focusNode.hasFocus,
      isTrue,
    );
    final focusedFieldElement = tester.element(field);

    tester.view.viewInsets = const FakeViewPadding(bottom: 320);
    await tester.pump();

    expect(
      tester.element(field),
      same(focusedFieldElement),
      reason:
          'the keyboard inset must not replace the focused TextField subtree',
    );
    expect(
      tester.widget<EditableText>(find.byType(EditableText)).focusNode.hasFocus,
      isTrue,
    );
    expect(tester.testTextInput.isVisible, isTrue);
    expect(tester.takeException(), isNull);

    await tester.enterText(field, '6');
    await tester.pump();
    expect(container.read(diceRollProvider).diceCount, 6);

    final roll = container.read(diceRollProvider.notifier).startRoll();
    await tester.pump();
    client.complete('1 2 3 4 5 6');
    await roll;

    final request = container.read(diceRollProvider).rollRequest;
    expect(request?.notation, '6d20');
    expect(request?.results, [1, 2, 3, 4, 5, 6]);
  });

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

  group('large rolls (#103)', () {
    const values = [
      13, 4, 12, 5, 15, 1, 20, 3, 4, 19, 7, 19, 3, //
      19, 3, 9, 11, 12, 6, 13, 9, 5, 19, 14, 11,
    ];
    final total = values.reduce((a, b) => a + b);

    Future<ProviderContainer> rollTwentyFive(WidgetTester tester) async {
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = const Size(360, 640);
      tester.view.padding = const FakeViewPadding(bottom: 48);
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
        tester.view.resetPadding();
      });
      final client = _PendingClient();
      final container = _containerFor(client);
      addTearDown(container.dispose);
      await _pumpDiceScreen(tester, container);
      final controller = container.read(diceRollProvider.notifier)
        ..setDiceCount(25);
      final roll = controller.startRoll();
      client.complete(values.join('\n'));
      await roll;
      await tester.pump();
      controller.completeAnimation(
        container.read(diceRollProvider).activeRequestId!,
      );
      await tester.pump();
      return container;
    }

    testWidgets('the main screen shows the total without overflowing', (
      tester,
    ) async {
      await rollTwentyFive(tester);

      expect(tester.takeException(), isNull);
      expect(find.text('Total: $total'), findsOneWidget);
      final expression = tester.widget<Text>(
        find.byKey(const Key('dice-expression')),
      );
      expect(expression.maxLines, 1);
      expect(expression.overflow, TextOverflow.ellipsis);
    });

    testWidgets('the details dialog lists every die, the sum and the total', (
      tester,
    ) async {
      await rollTwentyFive(tester);

      await tester.tap(find.byKey(const Key('dice-details-button')));
      await tester.pumpAndSettle();

      final dialog = find.byKey(const Key('dice-details-dialog'));
      expect(dialog, findsOneWidget);
      expect(tester.takeException(), isNull);
      expect(
        find.descendant(of: dialog, matching: find.text('25d20')),
        findsOneWidget,
      );
      final firstChip = tester.getRect(
        find.byKey(const Key('dice-details-value-0')),
      );
      final secondChip = tester.getRect(
        find.byKey(const Key('dice-details-value-1')),
      );
      expect(
        secondChip.top,
        firstChip.top,
        reason: 'die values must share a row instead of one per line',
      );
      for (var i = 0; i < values.length; i++) {
        final value = find.byKey(Key('dice-details-value-$i'));
        await tester.scrollUntilVisible(
          value,
          40,
          scrollable: find
              .descendant(of: dialog, matching: find.byType(Scrollable))
              .first,
        );
        expect(
          find.descendant(of: value, matching: find.text('${values[i]}')),
          findsOneWidget,
        );
      }
      final sum = find.byKey(const Key('dice-details-sum'));
      await tester.scrollUntilVisible(
        sum,
        40,
        scrollable: find
            .descendant(of: dialog, matching: find.byType(Scrollable))
            .first,
      );
      expect(
        tester.widget<SelectableText>(sum).data,
        '${values.join(' + ')} = $total',
      );
      expect(
        find.descendant(
          of: dialog,
          matching: find.byKey(const Key('dice-details-total')),
        ),
        findsOneWidget,
      );
      expect(
        tester.getRect(find.byKey(const Key('dice-details-total'))).bottom,
        lessThanOrEqualTo(640 - 48),
        reason: 'the total must stay above the system navigation inset',
      );

      await tester.tap(find.byKey(const Key('dice-details-close')));
      await tester.pumpAndSettle();
      expect(dialog, findsNothing);
    });

    testWidgets('details stay unavailable until a roll has settled', (
      tester,
    ) async {
      final client = _PendingClient();
      final container = _containerFor(client);
      addTearDown(container.dispose);
      await _pumpDiceScreen(tester, container);

      InkWell detailsButton() => tester.widget<InkWell>(
        find.descendant(
          of: find.byKey(const Key('dice-details-button')),
          matching: find.byType(InkWell),
        ),
      );

      expect(detailsButton().onTap, isNull);
      final roll = container.read(diceRollProvider.notifier).startRoll();
      await tester.pump();
      expect(detailsButton().onTap, isNull);
      client.complete('3');
      await roll;
      await tester.pump();
      expect(detailsButton().onTap, isNull);
      container
          .read(diceRollProvider.notifier)
          .completeAnimation(container.read(diceRollProvider).activeRequestId!);
      await tester.pump();
      expect(detailsButton().onTap, isNotNull);
    });

    testWidgets('fetching shows progress instead of the previous result', (
      tester,
    ) async {
      final first = _PendingClient();
      final second = _PendingClient();
      final clients = [first, second];
      final container = ProviderContainer(
        overrides: [
          randomOrgServiceProvider.overrideWithValue(
            RandomOrgService(client: _SequenceClient(clients)),
          ),
        ],
      );
      addTearDown(container.dispose);
      await _pumpDiceScreen(tester, container);
      final controller = container.read(diceRollProvider.notifier);

      final roll = controller.startRoll();
      first.complete('3');
      await roll;
      controller.completeAnimation(
        container.read(diceRollProvider).activeRequestId!,
      );
      await tester.pump();
      expect(find.byKey(const Key('dice-total')), findsOneWidget);

      final next = controller.startRoll();
      await tester.pump();
      expect(find.byKey(const Key('dice-fetching')), findsOneWidget);
      expect(find.byKey(const Key('dice-total')), findsNothing);

      second.complete('7');
      await next;
      await tester.pump();
      expect(find.byKey(const Key('dice-fetching')), findsNothing);
    });
  });
}

class _SequenceClient extends http.BaseClient {
  _SequenceClient(this._clients);

  final List<_PendingClient> _clients;
  var _index = 0;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) =>
      _clients[_index++].send(request);
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
  expect(
    tester.widget<TextField>(find.byKey(const Key('dice-count-custom'))).enabled,
    isFalse,
    reason: 'dice count should be disabled while busy',
  );
  for (final key in const [Key('dice-side-20'), Key('dice-roll-button')]) {
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
