import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theuniversedecides/services/tarot_preferences_service.dart';
import 'package:theuniversedecides/services/random_org_service.dart';
import 'package:theuniversedecides/controllers/tarot_draw_controller.dart';

class FixedRandom extends RandomOrgService {
  @override
  Future<List<int>> fetchIntegers({
    required int count,
    required int min,
    required int max,
  }) async => [79];
}

void main() {
  for (final reversed in [false, true]) {
    for (final meaning in [false, true]) {
      test('draw restores reversed=$reversed meaning=$meaning', () async {
        SharedPreferences.setMockInitialValues({
          'tarot_allow_reversed': reversed,
          'tarot_show_meaning': meaning,
        });
        final random = FixedRandom();
        final container = ProviderContainer(
          overrides: [randomOrgServiceProvider.overrideWith((ref) => random)],
        );
        await container.read(tarotDrawProvider.notifier).drawCard();
        final card = container.read(tarotDrawProvider).card!;
        expect(card.deckNumber, 1);
        expect(card.isReversed, reversed);
        expect(
          card.meaningForOrientation,
          reversed ? card.meaning.reversed : card.meaning.upright,
        );
        expect(container.read(tarotPreferencesProvider).showMeaning, meaning);
        container.dispose();
        random.dispose();
      });
    }
  }
  test('preferences default on and persist independently', () async {
    SharedPreferences.setMockInitialValues({});
    final first = ProviderContainer();
    expect(first.read(tarotPreferencesProvider).allowReversed, isTrue);
    expect(first.read(tarotPreferencesProvider).showMeaning, isTrue);
    await first.read(tarotPreferencesProvider.notifier).setAllowReversed(false);
    await first.read(tarotPreferencesProvider.notifier).setShowMeaning(false);
    first.dispose();
    final restored = ProviderContainer();
    restored.read(tarotPreferencesProvider);
    await Future<void>.delayed(const Duration(milliseconds: 20));
    expect(restored.read(tarotPreferencesProvider).allowReversed, isFalse);
    expect(restored.read(tarotPreferencesProvider).showMeaning, isFalse);
    await restored.read(tarotPreferencesProvider.notifier).setShowMeaning(true);
    expect(restored.read(tarotPreferencesProvider).allowReversed, isFalse);
    expect(restored.read(tarotPreferencesProvider).showMeaning, isTrue);
    restored.dispose();
  });
}
