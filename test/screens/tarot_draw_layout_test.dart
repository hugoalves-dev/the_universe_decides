import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theuniversedecides/controllers/tarot_draw_controller.dart';
import 'package:theuniversedecides/services/random_org_service.dart';
import 'package:theuniversedecides/services/tarot_preferences_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:theuniversedecides/layout/ritual_screen_frame.dart';
import 'package:theuniversedecides/screens/tarot_draw_screen.dart';

import '../support/layout_harness.dart';

class _FixedRandom extends RandomOrgService {
  @override
  Future<List<int>> fetchIntegers({
    required int count,
    required int min,
    required int max,
  }) async => [29];
}

void main() {
  for (final showMeaning in [false, true]) {
    testWidgets('tarot result remains centered with meaning=$showMeaning', (
      tester,
    ) async {
      SharedPreferences.setMockInitialValues({
        'tarot_show_meaning': showMeaning,
      });
      final random = _FixedRandom();
      final container = ProviderContainer(
        overrides: [randomOrgServiceProvider.overrideWith((ref) => random)],
      );
      await container.read(tarotPreferencesProvider.notifier).ready;
      await container.read(tarotDrawProvider.notifier).drawCard();
      await pumpAtWidth(
        tester,
        UncontrolledProviderScope(
          container: container,
          child: const TarotDrawScreen(),
        ),
        width: 400,
        height: 900,
      );
      await tester.pumpAndSettle();
      final title = find.text('Seven of Wands').last;
      expect(tester.getCenter(title).dx, closeTo(200, 0.5));
      expect(find.text('Meaning'), showMeaning ? findsOneWidget : findsNothing);
      await tester.pumpWidget(const SizedBox());
      container.dispose();
      random.dispose();
    });
  }
  testWidgets('the tarot lays out through the frame in every band', (
    tester,
  ) async {
    for (final width in const [400.0, 800.0, 1400.0]) {
      await pumpAtWidth(
        tester,
        const ProviderScope(child: TarotDrawScreen()),
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

  testWidgets('the tarot card is centered in its pane when expanded', (
    tester,
  ) async {
    // AspectRatio appears exactly once in the whole app: it wraps the
    // tarot card face, i.e. the frame's stage.
    await pumpAtWidth(
      tester,
      const ProviderScope(child: TarotDrawScreen()),
      width: 1400,
      height: 900,
    );

    final card = tester.getRect(find.byType(AspectRatio));

    // Expanded padding is fromLTRB(32, 28, 32, 24); the stage pane is the
    // frame's first kRitualStagePaneWidth (420) logical pixels.
    const paneContentLeft = 32.0;
    final expectedCenteredLeft =
        paneContentLeft + (kRitualStagePaneWidth - card.width) / 2;

    expect(
      card.left,
      closeTo(expectedCenteredLeft, 0.5),
      reason:
          'the tarot card must be centered in the expanded stage pane; a '
          'frame that put it flush left in expanded would put it at '
          'x=$paneContentLeft instead',
    );
    expect(
      card.left,
      greaterThan(paneContentLeft),
      reason:
          'sanity check: the card must not be flush against the '
          "pane's left edge in expanded",
    );
  });
}
