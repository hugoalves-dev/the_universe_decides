// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'The Universe Decides';

  @override
  String get navCoin => 'Coin';

  @override
  String get navDice => 'Dice';

  @override
  String get navCards => 'Cards';

  @override
  String get navLists => 'Lists';

  @override
  String get navTarot => 'Tarot';

  @override
  String get navAboutMe => 'About';

  @override
  String get coinEyebrow => 'Ritual Seal';

  @override
  String get coinTitle => 'Heads or Tails';

  @override
  String get coinRitualSubtitle =>
      'A mystic seal lights up to confirm: the result comes from pure chance.';

  @override
  String get coinHeads => 'HEADS';

  @override
  String get coinTails => 'TAILS';

  @override
  String get coinResultCaption => 'The universe decided — not the processor.';

  @override
  String get coinHint => 'Tap the button or drag the coin to flip';

  @override
  String get coinHintDrag => 'Release to flip — pull further for more force';

  @override
  String get coinDragHelper => 'or drag and flick the coin to throw it';

  @override
  String get coinButton => 'Flip a coin';

  @override
  String get diceEyebrow => 'Dice Ritual';

  @override
  String get diceTitle => 'RPG Dice';

  @override
  String get diceCountLabel => 'QUANTITY';

  @override
  String get diceSidesLabel => 'SIDES';

  @override
  String get diceRollButton => 'Roll dice';

  @override
  String diceTotal(int total) {
    return 'Total: $total';
  }

  @override
  String get cardEyebrow => 'Card Ritual';

  @override
  String get cardTitle => 'Full Deck';

  @override
  String get cardSubtitle => '52 cards. One fate per tap.';

  @override
  String get cardDrawButton => 'Draw a card';

  @override
  String get listEyebrow => 'Choice Ritual';

  @override
  String get listTitle => 'List Draw';

  @override
  String get listSubtitle => 'Add options and let chance decide.';

  @override
  String get listAddOptionHint => 'New option…';

  @override
  String get listChooseButton => 'Let the universe choose';

  @override
  String get listEmptyState => 'Add at least two options to begin.';

  @override
  String get listChosenByUniverse => 'Chosen by the universe';

  @override
  String get listReadyHint =>
      'Your list is ready. Tap the button above to choose.';

  @override
  String get listModeClassic => 'List';

  @override
  String get listModeWheel => 'Wheel';

  @override
  String get listWheelSpinButton => 'Spin the wheel';

  @override
  String get listWheelHint => 'Add at least two options, then give it a spin.';

  @override
  String get listWheelSpinAgainHint => 'Tap spin to try again.';

  @override
  String get listDuplicateItem => 'This item already exists in the list.';

  @override
  String listDuplicateItemsDiscarded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count duplicate items were skipped.',
      one: '1 duplicate item was skipped.',
    );
    return '$_temp0';
  }

  @override
  String get tarotEyebrow => 'Tarot Ritual';

  @override
  String get tarotTitle => 'Tarot Reading';

  @override
  String get tarotSubtitle => 'One card, revealed by pure chance.';

  @override
  String get tarotButton => 'Reveal card';

  @override
  String get tarotWaiting => 'The card awaits';

  @override
  String get tarotTapReveal => 'Tap to reveal';

  @override
  String get tarotMajorArcana => 'Major Arcana';

  @override
  String get tarotMinorArcana => 'Minor Arcana';

  @override
  String tarotDeckPosition(int number) {
    return 'Card $number of 78';
  }

  @override
  String get aboutEyebrow => 'The Oracle';

  @override
  String get aboutTitle => 'About me';

  @override
  String get aboutBioFallback =>
      'Creator of The Universe Decides, using RANDOM.ORG when available and a secure local generator offline.';

  @override
  String get aboutShortcutsTitle => 'Quick shortcuts';

  @override
  String get aboutAddCoinButton => 'Add coin';

  @override
  String get aboutDonationButton => 'Buy me a coffee';

  @override
  String get aboutSoundEffectsTitle => 'Sound effects';

  @override
  String get aboutSoundEffectsSubtitle =>
      'Play a subtle sound when a decision is complete.';

  @override
  String get aboutCardDeckTitle => 'Card deck';

  @override
  String get aboutCardDeckSubtitle => 'Choose the artwork for card draws.';

  @override
  String get cardDeckUniverse => 'Universe style';

  @override
  String get cardDeckPublicDomainBlue => 'Classic (blue back)';

  @override
  String get cardDeckPublicDomainRed => 'Classic (red back)';

  @override
  String get aboutRandomnessCardTitle => 'How randomness works';

  @override
  String get aboutRandomnessCardSubtitle => 'How PRNGs and secure RNGs differ';

  @override
  String get aboutHistoryCardTitle => 'Recent results';

  @override
  String get aboutHistoryCardSubtitle => 'Review your last outcomes';

  @override
  String get aboutProfileLoadError => 'Could not load the profile right now.';

  @override
  String get aboutRetryButton => 'Try again';

  @override
  String get historyTitle => 'Recent History';

  @override
  String get historyEmptyState => 'Your recent results will appear here.';

  @override
  String get historyClearButton => 'Clear history';

  @override
  String get historyClearDialogTitle => 'Clear history?';

  @override
  String get historyClearDialogMessage =>
      'This removes all recent results from this device. This can\'t be undone.';

  @override
  String get historyClearDialogCancel => 'Cancel';

  @override
  String get historyClearDialogConfirm => 'Clear';

  @override
  String get historyClearedSnackbar => 'History cleared.';

  @override
  String get quickTileCoinAdded => 'Coin shortcut added to the panel.';

  @override
  String get quickTileCoinAlreadyAdded =>
      'The coin shortcut is already in the panel.';

  @override
  String get quickTileCoinCancelled => 'Coin shortcut request cancelled.';

  @override
  String get quickTileCoinUnsupported =>
      'Your Android version cannot add this shortcut from the app.';

  @override
  String get randomnessSheetEyebrow => 'What lies behind chance';

  @override
  String get randomnessSheetTitle => 'PRNGs, secure RNGs & physical entropy';

  @override
  String get randomnessCard1Title => 'Three related but different sources';

  @override
  String get randomnessCard1Body =>
      'A PRNG deterministically expands a seed and internal state; it is useful for games and simulations but is not designed to resist prediction. A CSPRNG (often built as a DRBG) is designed to make outputs hard to predict, usually using operating-system entropy. A physical entropy source measures a physical process. These categories are related, not interchangeable.';

  @override
  String get randomnessCard2Title => 'What this app uses';

  @override
  String get randomnessCard2Body =>
      'When available, the app requests integers from RANDOM.ORG, which documents atmospheric radio noise as an entropy source. Its output can be conditioned and buffered before a request; we do not measure or verify the provider\'s process ourselves. Offline, the app uses Dart Random.secure(), an OS-backed CSPRNG when supported. If secure randomness is unsupported, the app falls back to an ordinary PRNG and labels it as non-cryptographic.';

  @override
  String get randomnessCard3Title => 'Entropy is not proof';

  @override
  String get randomnessCard3Body =>
      'Entropy describes uncertainty, not a proof that a particular result is unbiased or independently verifiable. Conditioning and hashing can remove bias but cannot create missing entropy; statistical tests can find some problems but cannot prove randomness. Secure generators do not need fresh physical noise for every value. For a six-sided die, use a bounded integer API (such as nextInt(6) + 1) to avoid modulo bias. A plain remainder operation can favor some faces when the range does not divide evenly; bounded APIs avoid that modulo bias.';

  @override
  String get randomnessSheetButton => 'Got it';

  @override
  String get randomOrgFallbackNotice =>
      'RANDOM.ORG unavailable. Using local secure RNG (CSPRNG).';

  @override
  String get aboutTarotDeckTitle => 'Tarot deck';

  @override
  String get aboutTarotDeckSubtitle => 'Choose the artwork for tarot draws.';

  @override
  String get tarotDeckRiderWaite => 'Rider–Waite';

  @override
  String get tarotDeckJeanDodal => 'Jean Dodal';

  @override
  String get tarotDeckVieville => 'Viéville';

  @override
  String get tarotDeckSolaBusca => 'Sola–Busca';

  @override
  String get tarotDeckEtteilla => 'Etteilla I';

  @override
  String get tarotUpright => 'Upright';

  @override
  String get tarotReversed => 'Reversed';

  @override
  String get tarotMeaningTitle => 'Meaning';

  @override
  String get secureRandomUnavailableNotice =>
      'RANDOM.ORG unavailable and secure RNG unsupported. Using local PRNG (not cryptographically secure).';

  @override
  String get tarotAllowReversed => 'Allow reversed cards';

  @override
  String get tarotShowMeaning => 'Show card meaning';
}
