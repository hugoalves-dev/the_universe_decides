import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:theuniversedecides/services/tarot_deck_service.dart';

final tarotArtworkServiceProvider = Provider<TarotArtworkService>(
  (ref) => const TarotArtworkService(),
);

class TarotArtworkService {
  const TarotArtworkService();

  static const _availableDeckNumbers = <TarotDeckStyle, Set<int>>{
    TarotDeckStyle.riderWaite: _allCards,
    TarotDeckStyle.jeanDodal: {
      1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
      21, 22, 34, 38, 49,
    },
    TarotDeckStyle.vieville: _allCards,
    TarotDeckStyle.solaBusca: _allCards,
    TarotDeckStyle.etteillaI: _allCards,
  };

  static const _allCards = <int>{
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
    21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38,
    39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56,
    57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74,
    75, 76, 77, 78,
  };

  String? assetPathFor(TarotDeckStyle style, int deckNumber) {
    if (style == TarotDeckStyle.universe) return null;
    // The linked Viéville category has no scan for the 31st shared deck position.
    if (style == TarotDeckStyle.vieville && deckNumber == 31) {
      return null;
    }
    if (!_availableDeckNumbers[style]!.contains(deckNumber)) return null;
    final formattedNumber = deckNumber.toString().padLeft(2, '0');
    return 'assets/tarot/${style.assetFolder}/$formattedNumber.jpg';
  }
}
