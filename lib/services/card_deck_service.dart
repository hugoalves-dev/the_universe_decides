import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final cardDeckStyleProvider =
    NotifierProvider<CardDeckNotifier, CardDeckStyle>(CardDeckNotifier.new);

enum CardDeckStyle { universe, publicDomainBlue, publicDomainRed }

class CardDeckNotifier extends Notifier<CardDeckStyle> {
  static const _key = 'card_deck_style';
  bool _styleWasChanged = false;

  @override
  CardDeckStyle build() {
    unawaited(_load());
    return CardDeckStyle.universe;
  }

  Future<void> _load() async {
    final preferences = await SharedPreferences.getInstance();
    if (_styleWasChanged) {
      return;
    }
    final storedName = preferences.getString(_key);
    for (final style in CardDeckStyle.values) {
      if (style.name == storedName) {
        state = style;
        return;
      }
    }
  }

  Future<void> setStyle(CardDeckStyle style) async {
    _styleWasChanged = true;
    state = style;
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_key, style.name);
  }
}
