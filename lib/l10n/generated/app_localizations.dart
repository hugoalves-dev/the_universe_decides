import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_it.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('it'),
    Locale('pt'),
    Locale('tr'),
    Locale('uk'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'The Universe Decides'**
  String get appTitle;

  /// No description provided for @navCoin.
  ///
  /// In en, this message translates to:
  /// **'Coin'**
  String get navCoin;

  /// No description provided for @navDice.
  ///
  /// In en, this message translates to:
  /// **'Dice'**
  String get navDice;

  /// No description provided for @navCards.
  ///
  /// In en, this message translates to:
  /// **'Cards'**
  String get navCards;

  /// No description provided for @navLists.
  ///
  /// In en, this message translates to:
  /// **'Lists'**
  String get navLists;

  /// No description provided for @navTarot.
  ///
  /// In en, this message translates to:
  /// **'Tarot'**
  String get navTarot;

  /// No description provided for @navAboutMe.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get navAboutMe;

  /// No description provided for @coinEyebrow.
  ///
  /// In en, this message translates to:
  /// **'Ritual Seal'**
  String get coinEyebrow;

  /// No description provided for @coinTitle.
  ///
  /// In en, this message translates to:
  /// **'Heads or Tails'**
  String get coinTitle;

  /// No description provided for @coinRitualSubtitle.
  ///
  /// In en, this message translates to:
  /// **'A mystic seal lights up to confirm: the result comes from pure chance.'**
  String get coinRitualSubtitle;

  /// No description provided for @coinHeads.
  ///
  /// In en, this message translates to:
  /// **'HEADS'**
  String get coinHeads;

  /// No description provided for @coinTails.
  ///
  /// In en, this message translates to:
  /// **'TAILS'**
  String get coinTails;

  /// No description provided for @coinResultCaption.
  ///
  /// In en, this message translates to:
  /// **'The universe decided — not the processor.'**
  String get coinResultCaption;

  /// No description provided for @coinHint.
  ///
  /// In en, this message translates to:
  /// **'Tap the button or drag the coin to flip'**
  String get coinHint;

  /// No description provided for @coinHintDrag.
  ///
  /// In en, this message translates to:
  /// **'Release to flip — pull further for more force'**
  String get coinHintDrag;

  /// No description provided for @coinDragHelper.
  ///
  /// In en, this message translates to:
  /// **'or drag and flick the coin to throw it'**
  String get coinDragHelper;

  /// No description provided for @coinButton.
  ///
  /// In en, this message translates to:
  /// **'Flip a coin'**
  String get coinButton;

  /// No description provided for @diceEyebrow.
  ///
  /// In en, this message translates to:
  /// **'Dice Ritual'**
  String get diceEyebrow;

  /// No description provided for @diceTitle.
  ///
  /// In en, this message translates to:
  /// **'RPG Dice'**
  String get diceTitle;

  /// No description provided for @diceCountLabel.
  ///
  /// In en, this message translates to:
  /// **'QUANTITY'**
  String get diceCountLabel;

  /// No description provided for @diceSidesLabel.
  ///
  /// In en, this message translates to:
  /// **'SIDES'**
  String get diceSidesLabel;

  /// No description provided for @diceRollButton.
  ///
  /// In en, this message translates to:
  /// **'Roll dice'**
  String get diceRollButton;

  /// No description provided for @diceTotal.
  ///
  /// In en, this message translates to:
  /// **'Total: {total}'**
  String diceTotal(int total);

  /// No description provided for @cardEyebrow.
  ///
  /// In en, this message translates to:
  /// **'Card Ritual'**
  String get cardEyebrow;

  /// No description provided for @cardTitle.
  ///
  /// In en, this message translates to:
  /// **'Full Deck'**
  String get cardTitle;

  /// No description provided for @cardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'52 cards. One fate per tap.'**
  String get cardSubtitle;

  /// No description provided for @cardDrawButton.
  ///
  /// In en, this message translates to:
  /// **'Draw a card'**
  String get cardDrawButton;

  /// No description provided for @listEyebrow.
  ///
  /// In en, this message translates to:
  /// **'Choice Ritual'**
  String get listEyebrow;

  /// No description provided for @listTitle.
  ///
  /// In en, this message translates to:
  /// **'List Draw'**
  String get listTitle;

  /// No description provided for @listSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add options and let chance decide.'**
  String get listSubtitle;

  /// No description provided for @listAddOptionHint.
  ///
  /// In en, this message translates to:
  /// **'New option…'**
  String get listAddOptionHint;

  /// No description provided for @listChooseButton.
  ///
  /// In en, this message translates to:
  /// **'Let the universe choose'**
  String get listChooseButton;

  /// No description provided for @listEmptyState.
  ///
  /// In en, this message translates to:
  /// **'Add at least two options to begin.'**
  String get listEmptyState;

  /// No description provided for @listChosenByUniverse.
  ///
  /// In en, this message translates to:
  /// **'Chosen by the universe'**
  String get listChosenByUniverse;

  /// No description provided for @listReadyHint.
  ///
  /// In en, this message translates to:
  /// **'Your list is ready. Tap the button above to choose.'**
  String get listReadyHint;

  /// No description provided for @listModeClassic.
  ///
  /// In en, this message translates to:
  /// **'List'**
  String get listModeClassic;

  /// No description provided for @listModeWheel.
  ///
  /// In en, this message translates to:
  /// **'Wheel'**
  String get listModeWheel;

  /// No description provided for @listWheelSpinButton.
  ///
  /// In en, this message translates to:
  /// **'Spin the wheel'**
  String get listWheelSpinButton;

  /// No description provided for @listWheelHint.
  ///
  /// In en, this message translates to:
  /// **'Add at least two options, then give it a spin.'**
  String get listWheelHint;

  /// No description provided for @listWheelSpinAgainHint.
  ///
  /// In en, this message translates to:
  /// **'Tap spin to try again.'**
  String get listWheelSpinAgainHint;

  /// No description provided for @listDuplicateItem.
  ///
  /// In en, this message translates to:
  /// **'This item already exists in the list.'**
  String get listDuplicateItem;

  /// No description provided for @listDuplicateItemsDiscarded.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{1 duplicate item was skipped.} other{{count} duplicate items were skipped.}}'**
  String listDuplicateItemsDiscarded(int count);

  /// No description provided for @tarotEyebrow.
  ///
  /// In en, this message translates to:
  /// **'Tarot Ritual'**
  String get tarotEyebrow;

  /// No description provided for @tarotTitle.
  ///
  /// In en, this message translates to:
  /// **'Tarot Reading'**
  String get tarotTitle;

  /// No description provided for @tarotSubtitle.
  ///
  /// In en, this message translates to:
  /// **'One card, revealed by pure chance.'**
  String get tarotSubtitle;

  /// No description provided for @tarotButton.
  ///
  /// In en, this message translates to:
  /// **'Reveal card'**
  String get tarotButton;

  /// No description provided for @tarotWaiting.
  ///
  /// In en, this message translates to:
  /// **'The card awaits'**
  String get tarotWaiting;

  /// No description provided for @tarotTapReveal.
  ///
  /// In en, this message translates to:
  /// **'Tap to reveal'**
  String get tarotTapReveal;

  /// No description provided for @tarotMajorArcana.
  ///
  /// In en, this message translates to:
  /// **'Major Arcana'**
  String get tarotMajorArcana;

  /// No description provided for @tarotMinorArcana.
  ///
  /// In en, this message translates to:
  /// **'Minor Arcana'**
  String get tarotMinorArcana;

  /// No description provided for @tarotDeckPosition.
  ///
  /// In en, this message translates to:
  /// **'Card {number} of 78'**
  String tarotDeckPosition(int number);

  /// No description provided for @aboutEyebrow.
  ///
  /// In en, this message translates to:
  /// **'The Oracle'**
  String get aboutEyebrow;

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About me'**
  String get aboutTitle;

  /// No description provided for @aboutBioFallback.
  ///
  /// In en, this message translates to:
  /// **'Creator of The Universe Decides, using RANDOM.ORG when available and a secure local generator offline.'**
  String get aboutBioFallback;

  /// No description provided for @aboutShortcutsTitle.
  ///
  /// In en, this message translates to:
  /// **'Quick shortcuts'**
  String get aboutShortcutsTitle;

  /// No description provided for @aboutAddCoinButton.
  ///
  /// In en, this message translates to:
  /// **'Add coin'**
  String get aboutAddCoinButton;

  /// No description provided for @aboutDonationButton.
  ///
  /// In en, this message translates to:
  /// **'Buy me a coffee'**
  String get aboutDonationButton;

  /// No description provided for @aboutSoundEffectsTitle.
  ///
  /// In en, this message translates to:
  /// **'Sound effects'**
  String get aboutSoundEffectsTitle;

  /// No description provided for @aboutSoundEffectsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Play a subtle sound when a decision is complete.'**
  String get aboutSoundEffectsSubtitle;

  /// No description provided for @aboutCardDeckTitle.
  ///
  /// In en, this message translates to:
  /// **'Card deck'**
  String get aboutCardDeckTitle;

  /// No description provided for @aboutCardDeckSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose the artwork for card draws.'**
  String get aboutCardDeckSubtitle;

  /// No description provided for @cardDeckUniverse.
  ///
  /// In en, this message translates to:
  /// **'Universe style'**
  String get cardDeckUniverse;

  /// No description provided for @cardDeckPublicDomainBlue.
  ///
  /// In en, this message translates to:
  /// **'Classic (blue back)'**
  String get cardDeckPublicDomainBlue;

  /// No description provided for @cardDeckPublicDomainRed.
  ///
  /// In en, this message translates to:
  /// **'Classic (red back)'**
  String get cardDeckPublicDomainRed;

  /// No description provided for @aboutRandomnessCardTitle.
  ///
  /// In en, this message translates to:
  /// **'How randomness works'**
  String get aboutRandomnessCardTitle;

  /// No description provided for @aboutRandomnessCardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'How PRNGs and secure RNGs differ'**
  String get aboutRandomnessCardSubtitle;

  /// No description provided for @aboutHistoryCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Recent results'**
  String get aboutHistoryCardTitle;

  /// No description provided for @aboutHistoryCardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Review your last outcomes'**
  String get aboutHistoryCardSubtitle;

  /// No description provided for @aboutProfileLoadError.
  ///
  /// In en, this message translates to:
  /// **'Could not load the profile right now.'**
  String get aboutProfileLoadError;

  /// No description provided for @aboutRetryButton.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get aboutRetryButton;

  /// No description provided for @historyTitle.
  ///
  /// In en, this message translates to:
  /// **'Recent History'**
  String get historyTitle;

  /// No description provided for @historyEmptyState.
  ///
  /// In en, this message translates to:
  /// **'Your recent results will appear here.'**
  String get historyEmptyState;

  /// No description provided for @historyClearButton.
  ///
  /// In en, this message translates to:
  /// **'Clear history'**
  String get historyClearButton;

  /// No description provided for @historyClearDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear history?'**
  String get historyClearDialogTitle;

  /// No description provided for @historyClearDialogMessage.
  ///
  /// In en, this message translates to:
  /// **'This removes all recent results from this device. This can\'t be undone.'**
  String get historyClearDialogMessage;

  /// No description provided for @historyClearDialogCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get historyClearDialogCancel;

  /// No description provided for @historyClearDialogConfirm.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get historyClearDialogConfirm;

  /// No description provided for @historyClearedSnackbar.
  ///
  /// In en, this message translates to:
  /// **'History cleared.'**
  String get historyClearedSnackbar;

  /// No description provided for @quickTileCoinAdded.
  ///
  /// In en, this message translates to:
  /// **'Coin shortcut added to the panel.'**
  String get quickTileCoinAdded;

  /// No description provided for @quickTileCoinAlreadyAdded.
  ///
  /// In en, this message translates to:
  /// **'The coin shortcut is already in the panel.'**
  String get quickTileCoinAlreadyAdded;

  /// No description provided for @quickTileCoinCancelled.
  ///
  /// In en, this message translates to:
  /// **'Coin shortcut request cancelled.'**
  String get quickTileCoinCancelled;

  /// No description provided for @quickTileCoinUnsupported.
  ///
  /// In en, this message translates to:
  /// **'Your Android version cannot add this shortcut from the app.'**
  String get quickTileCoinUnsupported;

  /// No description provided for @randomnessSheetEyebrow.
  ///
  /// In en, this message translates to:
  /// **'What lies behind chance'**
  String get randomnessSheetEyebrow;

  /// No description provided for @randomnessSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'PRNGs, secure RNGs & physical entropy'**
  String get randomnessSheetTitle;

  /// No description provided for @randomnessCard1Title.
  ///
  /// In en, this message translates to:
  /// **'Three related but different sources'**
  String get randomnessCard1Title;

  /// No description provided for @randomnessCard1Body.
  ///
  /// In en, this message translates to:
  /// **'A PRNG deterministically expands a seed and internal state; it is useful for games and simulations but is not designed to resist prediction. A CSPRNG (often built as a DRBG) is designed to make outputs hard to predict, usually using operating-system entropy. A physical entropy source measures a physical process. These categories are related, not interchangeable.'**
  String get randomnessCard1Body;

  /// No description provided for @randomnessCard2Title.
  ///
  /// In en, this message translates to:
  /// **'What this app uses'**
  String get randomnessCard2Title;

  /// No description provided for @randomnessCard2Body.
  ///
  /// In en, this message translates to:
  /// **'When available, the app requests integers from RANDOM.ORG, which documents atmospheric radio noise as an entropy source. Its output can be conditioned and buffered before a request; we do not measure or verify the provider\'s process ourselves. Offline, the app uses Dart Random.secure(), an OS-backed CSPRNG when supported. If secure randomness is unsupported, the app falls back to an ordinary PRNG and labels it as non-cryptographic.'**
  String get randomnessCard2Body;

  /// No description provided for @randomnessCard3Title.
  ///
  /// In en, this message translates to:
  /// **'Entropy is not proof'**
  String get randomnessCard3Title;

  /// No description provided for @randomnessCard3Body.
  ///
  /// In en, this message translates to:
  /// **'Entropy describes uncertainty, not a proof that a particular result is unbiased or independently verifiable. Conditioning and hashing can remove bias but cannot create missing entropy; statistical tests can find some problems but cannot prove randomness. Secure generators do not need fresh physical noise for every value. For a six-sided die, use a bounded integer API (such as nextInt(6) + 1) to avoid modulo bias. A plain remainder operation can favor some faces when the range does not divide evenly; bounded APIs avoid that modulo bias.'**
  String get randomnessCard3Body;

  /// No description provided for @randomnessSheetButton.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get randomnessSheetButton;

  /// No description provided for @randomOrgFallbackNotice.
  ///
  /// In en, this message translates to:
  /// **'RANDOM.ORG unavailable. Using local secure RNG (CSPRNG).'**
  String get randomOrgFallbackNotice;

  /// No description provided for @aboutTarotDeckTitle.
  ///
  /// In en, this message translates to:
  /// **'Tarot deck'**
  String get aboutTarotDeckTitle;

  /// No description provided for @aboutTarotDeckSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose the artwork for tarot draws.'**
  String get aboutTarotDeckSubtitle;

  /// No description provided for @tarotDeckRiderWaite.
  ///
  /// In en, this message translates to:
  /// **'Rider–Waite'**
  String get tarotDeckRiderWaite;

  /// No description provided for @tarotDeckJeanDodal.
  ///
  /// In en, this message translates to:
  /// **'Jean Dodal'**
  String get tarotDeckJeanDodal;

  /// No description provided for @tarotDeckVieville.
  ///
  /// In en, this message translates to:
  /// **'Viéville'**
  String get tarotDeckVieville;

  /// No description provided for @tarotDeckSolaBusca.
  ///
  /// In en, this message translates to:
  /// **'Sola–Busca'**
  String get tarotDeckSolaBusca;

  /// No description provided for @tarotDeckEtteilla.
  ///
  /// In en, this message translates to:
  /// **'Etteilla I'**
  String get tarotDeckEtteilla;

  /// No description provided for @tarotUpright.
  ///
  /// In en, this message translates to:
  /// **'Upright'**
  String get tarotUpright;

  /// No description provided for @tarotReversed.
  ///
  /// In en, this message translates to:
  /// **'Reversed'**
  String get tarotReversed;

  /// No description provided for @tarotMeaningTitle.
  ///
  /// In en, this message translates to:
  /// **'Meaning'**
  String get tarotMeaningTitle;

  /// No description provided for @secureRandomUnavailableNotice.
  ///
  /// In en, this message translates to:
  /// **'RANDOM.ORG unavailable and secure RNG unsupported. Using local PRNG (not cryptographically secure).'**
  String get secureRandomUnavailableNotice;

  /// No description provided for @tarotAllowReversed.
  ///
  /// In en, this message translates to:
  /// **'Allow reversed cards'**
  String get tarotAllowReversed;

  /// No description provided for @tarotShowMeaning.
  ///
  /// In en, this message translates to:
  /// **'Show card meaning'**
  String get tarotShowMeaning;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'de',
    'en',
    'es',
    'fr',
    'hi',
    'it',
    'pt',
    'tr',
    'uk',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'it':
      return AppLocalizationsIt();
    case 'pt':
      return AppLocalizationsPt();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
