import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:theuniversedecides/dice/dice_web_view.dart';
import 'package:theuniversedecides/layout/ritual_screen_frame.dart';
import 'package:theuniversedecides/screens/dice_roll_screen.dart';

import '../support/fake_webview_platform.dart';
import '../support/layout_harness.dart';

void main() {
  setUpAll(FakeWebViewPlatform.register);

  testWidgets('the dice lay out through the frame in every band', (
    tester,
  ) async {
    for (final width in const [400.0, 800.0, 1400.0]) {
      await pumpAtWidth(
        tester,
        const ProviderScope(child: DiceRollScreen()),
        width: width,
        height: 700,
      );

      expect(
        find.byType(RitualScreenFrame),
        findsOneWidget,
        reason: 'width $width',
      );
      expect(tester.takeException(), isNull, reason: 'width $width');
    }
  });

  testWidgets('the dice surface grows on a taller tablet', (tester) async {
    final heights = <double>[];
    for (final size in const [(400.0, 700.0), (800.0, 1200.0)]) {
      await pumpAtWidth(
        tester,
        const ProviderScope(child: DiceRollScreen()),
        width: size.$1,
        height: size.$2,
      );
      heights.add(tester.getSize(find.byType(DiceWebView)).height);
    }
    expect(heights.last, greaterThan(heights.first));
  });

  testWidgets('the tablet arena uses the available height', (tester) async {
    await pumpAtWidth(
      tester,
      const ProviderScope(child: DiceRollScreen()),
      width: 800,
      height: 1200,
    );
    expect(tester.getSize(find.byType(DiceWebView)).height, greaterThan(650));
  });

  testWidgets('the wide arena grows beyond the old fixed pane', (tester) async {
    await pumpAtWidth(
      tester,
      const ProviderScope(child: DiceRollScreen()),
      width: 1400,
      height: 900,
    );
    expect(tester.getSize(find.byType(DiceWebView)).width, greaterThan(500));
  });
  testWidgets('short phones keep controls and arena scrollable', (
    tester,
  ) async {
    await pumpAtWidth(
      tester,
      const ProviderScope(child: DiceRollScreen()),
      width: 320,
      height: 550,
    );
    expect(tester.takeException(), isNull);
    expect(find.byType(DiceWebView), findsOneWidget);
    await tester.drag(
      find.byType(SingleChildScrollView).first,
      const Offset(0, -450),
    );
    await tester.pump();
    expect(tester.takeException(), isNull);
  });
}
