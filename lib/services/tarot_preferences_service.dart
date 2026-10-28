import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final tarotPreferencesProvider =
    NotifierProvider<TarotPreferencesNotifier, TarotPreferences>(
      TarotPreferencesNotifier.new,
    );

class TarotPreferences {
  const TarotPreferences({this.allowReversed = true, this.showMeaning = true});
  final bool allowReversed;
  final bool showMeaning;
}

class TarotPreferencesNotifier extends Notifier<TarotPreferences> {
  bool _reversedChanged = false;
  bool _meaningChanged = false;
  late final Future<void> ready;

  @override
  TarotPreferences build() {
    ready = _load();
    return const TarotPreferences();
  }

  Future<void> _load() async {
    final preferences = await SharedPreferences.getInstance();
    if (!ref.mounted) return;
    state = TarotPreferences(
      allowReversed: _reversedChanged
          ? state.allowReversed
          : preferences.getBool('tarot_allow_reversed') ?? true,
      showMeaning: _meaningChanged
          ? state.showMeaning
          : preferences.getBool('tarot_show_meaning') ?? true,
    );
  }

  Future<void> setAllowReversed(bool value) async {
    _reversedChanged = true;
    state = TarotPreferences(
      allowReversed: value,
      showMeaning: state.showMeaning,
    );
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool('tarot_allow_reversed', value);
  }

  Future<void> setShowMeaning(bool value) async {
    _meaningChanged = true;
    state = TarotPreferences(
      allowReversed: state.allowReversed,
      showMeaning: value,
    );
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool('tarot_show_meaning', value);
  }
}
