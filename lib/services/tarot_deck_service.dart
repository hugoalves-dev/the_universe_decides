import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final tarotDeckStyleProvider =
    NotifierProvider<TarotDeckNotifier, TarotDeckStyle>(TarotDeckNotifier.new);

enum TarotDeckStyle {
  universe,
  riderWaite,
  jeanDodal,
  vieville,
  solaBusca,
  etteillaI;

  String get assetFolder => switch (this) {
    TarotDeckStyle.universe => 'universe',
    TarotDeckStyle.riderWaite => 'rider_waite',
    TarotDeckStyle.jeanDodal => 'jean_dodal',
    TarotDeckStyle.vieville => 'vieville',
    TarotDeckStyle.solaBusca => 'sola_busca',
    TarotDeckStyle.etteillaI => 'etteilla_i',
  };
}

class TarotDeckNotifier extends Notifier<TarotDeckStyle> {
  static const _key = 'tarot_deck_style';
  bool _styleWasChanged = false;

  @override
  TarotDeckStyle build() {
    unawaited(_load());
    return TarotDeckStyle.universe;
  }

  Future<void> _load() async {
    final preferences = await SharedPreferences.getInstance();
    if (_styleWasChanged) return;

    final storedName = preferences.getString(_key);
    for (final style in TarotDeckStyle.values) {
      if (style.name == storedName) {
        state = style;
        return;
      }
    }
  }

  Future<void> setStyle(TarotDeckStyle style) async {
    _styleWasChanged = true;
    state = style;
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_key, style.name);
  }
}
