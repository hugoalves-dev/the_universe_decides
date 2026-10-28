// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'The Universe Decides';

  @override
  String get navCoin => 'Münze';

  @override
  String get navDice => 'Würfel';

  @override
  String get navCards => 'Karten';

  @override
  String get navLists => 'Listen';

  @override
  String get navTarot => 'Tarot';

  @override
  String get navAboutMe => 'Über';

  @override
  String get coinEyebrow => 'Ritualsiegel';

  @override
  String get coinTitle => 'Kopf oder Zahl';

  @override
  String get coinRitualSubtitle =>
      'Ein mystisches Siegel leuchtet auf, um zu bestätigen: Das Ergebnis kommt aus reinem Zufall.';

  @override
  String get coinHeads => 'KOPF';

  @override
  String get coinTails => 'ZAHL';

  @override
  String get coinResultCaption =>
      'Das Universum hat entschieden — nicht der Prozessor.';

  @override
  String get coinHint =>
      'Tippe auf die Schaltfläche oder ziehe die Münze, um sie zu werfen';

  @override
  String get coinHintDrag =>
      'Loslassen zum Werfen — weiter ziehen für mehr Kraft';

  @override
  String get coinDragHelper =>
      'oder ziehe und schnippe die Münze, um sie zu werfen';

  @override
  String get coinButton => 'Münze werfen';

  @override
  String get diceEyebrow => 'Würfelritual';

  @override
  String get diceTitle => 'RPG-Würfel';

  @override
  String get diceCountLabel => 'ANZAHL';

  @override
  String get diceSidesLabel => 'SEITEN';

  @override
  String get diceRollButton => 'Würfeln';

  @override
  String diceTotal(int total) {
    return 'Gesamt: $total';
  }

  @override
  String get cardEyebrow => 'Kartenritual';

  @override
  String get cardTitle => 'Volles Deck';

  @override
  String get cardSubtitle => '52 Karten. Ein Schicksal pro Tippen.';

  @override
  String get cardDrawButton => 'Karte ziehen';

  @override
  String get listEyebrow => 'Auswahlritual';

  @override
  String get listTitle => 'Listenlosung';

  @override
  String get listSubtitle =>
      'Füge Optionen hinzu und lass den Zufall entscheiden.';

  @override
  String get listAddOptionHint => 'Neue Option…';

  @override
  String get listChooseButton => 'Das Universum entscheiden lassen';

  @override
  String get listEmptyState =>
      'Füge mindestens zwei Optionen hinzu, um zu beginnen.';

  @override
  String get listChosenByUniverse => 'Vom Universum gewählt';

  @override
  String get listReadyHint =>
      'Deine Liste ist bereit. Tippe oben auf die Schaltfläche, um zu wählen.';

  @override
  String get listModeClassic => 'Liste';

  @override
  String get listModeWheel => 'Glücksrad';

  @override
  String get listWheelSpinButton => 'Rad drehen';

  @override
  String get listWheelHint =>
      'Füge mindestens zwei Optionen hinzu und dreh los.';

  @override
  String get listWheelSpinAgainHint =>
      'Tippe auf Drehen, um es erneut zu versuchen.';

  @override
  String get listDuplicateItem => 'Dieser Eintrag ist bereits in der Liste.';

  @override
  String listDuplicateItemsDiscarded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count doppelte Einträge wurden übersprungen.',
      one: '1 doppelter Eintrag wurde übersprungen.',
    );
    return '$_temp0';
  }

  @override
  String get tarotEyebrow => 'Tarot-Ritual';

  @override
  String get tarotTitle => 'Tarot-Lesung';

  @override
  String get tarotSubtitle => 'Eine Karte, enthüllt durch reinen Zufall.';

  @override
  String get tarotButton => 'Karte aufdecken';

  @override
  String get tarotWaiting => 'Die Karte wartet';

  @override
  String get tarotTapReveal => 'Zum Aufdecken tippen';

  @override
  String get tarotMajorArcana => 'Große Arkana';

  @override
  String get tarotMinorArcana => 'Kleine Arkana';

  @override
  String tarotDeckPosition(int number) {
    return 'Karte $number von 78';
  }

  @override
  String get aboutEyebrow => 'Das Orakel';

  @override
  String get aboutTitle => 'Über mich';

  @override
  String get aboutBioFallback =>
      'Entwickler von The Universe Decides mit RANDOM.ORG, sofern verfügbar, und einem sicheren lokalen Generator offline.';

  @override
  String get aboutShortcutsTitle => 'Schnellzugriffe';

  @override
  String get aboutAddCoinButton => 'Münze hinzufügen';

  @override
  String get aboutDonationButton => 'Spendiere mir einen Kaffee';

  @override
  String get aboutSoundEffectsTitle => 'Soundeffekte';

  @override
  String get aboutSoundEffectsSubtitle =>
      'Einen dezenten Ton abspielen, wenn eine Entscheidung abgeschlossen ist.';

  @override
  String get aboutCardDeckTitle => 'Kartendeck';

  @override
  String get aboutCardDeckSubtitle => 'Wähle das Design für Kartenziehungen.';

  @override
  String get cardDeckUniverse => 'Universum-Stil';

  @override
  String get cardDeckPublicDomainBlue => 'Klassisch (blaue Rückseite)';

  @override
  String get cardDeckPublicDomainRed => 'Klassisch (rote Rückseite)';

  @override
  String get aboutRandomnessCardTitle => 'So funktioniert Zufall';

  @override
  String get aboutRandomnessCardSubtitle =>
      'Unterschiede zwischen PRNGs und sicheren Generatoren';

  @override
  String get aboutHistoryCardTitle => 'Letzte Ergebnisse';

  @override
  String get aboutHistoryCardSubtitle => 'Deine letzten Ergebnisse ansehen';

  @override
  String get aboutProfileLoadError =>
      'Das Profil konnte gerade nicht geladen werden.';

  @override
  String get aboutRetryButton => 'Erneut versuchen';

  @override
  String get historyTitle => 'Letzte Ergebnisse';

  @override
  String get historyEmptyState => 'Deine letzten Ergebnisse erscheinen hier.';

  @override
  String get historyClearButton => 'Verlauf löschen';

  @override
  String get historyClearDialogTitle => 'Verlauf löschen?';

  @override
  String get historyClearDialogMessage =>
      'Dadurch werden alle letzten Ergebnisse von diesem Gerät entfernt. Das kann nicht rückgängig gemacht werden.';

  @override
  String get historyClearDialogCancel => 'Abbrechen';

  @override
  String get historyClearDialogConfirm => 'Löschen';

  @override
  String get historyClearedSnackbar => 'Verlauf gelöscht.';

  @override
  String get quickTileCoinAdded => 'Münz-Verknüpfung zum Panel hinzugefügt.';

  @override
  String get quickTileCoinAlreadyAdded =>
      'Die Münz-Verknüpfung ist bereits im Panel.';

  @override
  String get quickTileCoinCancelled =>
      'Anfrage für die Münz-Verknüpfung abgebrochen.';

  @override
  String get quickTileCoinUnsupported =>
      'Deine Android-Version kann diese Verknüpfung nicht aus der App hinzufügen.';

  @override
  String get randomnessSheetEyebrow => 'Was hinter dem Zufall steckt';

  @override
  String get randomnessSheetTitle => 'Zufall, PRNG und CSPRNG';

  @override
  String get randomnessCard1Title =>
      'Drei verwandte, aber verschiedene Quellen';

  @override
  String get randomnessCard1Body =>
      'Ein PRNG erzeugt aus Startwert und internem Zustand deterministische Folgen. Er eignet sich für Spiele und Simulationen, ist aber nicht gegen Vorhersage ausgelegt. Ein CSPRNG (oft als DRBG) soll Ausgaben schwer vorhersagbar machen und nutzt üblicherweise Betriebssystem-Entropie. Eine physische Entropiequelle misst einen physikalischen Prozess. Diese Begriffe sind verwandt, aber nicht austauschbar.';

  @override
  String get randomnessCard2Title => 'Was diese App verwendet';

  @override
  String get randomnessCard2Body =>
      'Wenn verfügbar, fordert die App Zahlen bei RANDOM.ORG an. Der Dienst nennt atmosphärisches Funkrauschen als Entropiequelle; die Ausgabe kann vor der Anfrage verarbeitet und gepuffert werden. Wir prüfen diesen Prozess nicht selbst. Offline verwendet die App Dart Random.secure(), sofern eine sichere Betriebssystemquelle verfügbar ist. Wird sichere Zufälligkeit nicht unterstützt, nutzt die App einen gewöhnlichen PRNG und kennzeichnet ihn als nicht kryptografisch sicher.';

  @override
  String get randomnessCard3Title => 'Entropie ist kein Beweis';

  @override
  String get randomnessCard3Body =>
      'Entropie beschreibt Unsicherheit, beweist aber nicht, dass ein Ergebnis unverzerrt oder unabhängig überprüfbar ist. Verarbeitung kann Verzerrungen mindern, aber fehlende Entropie nicht erzeugen. Statistische Tests können manche Fehler finden, Zufälligkeit jedoch nicht beweisen. Sichere Generatoren benötigen nicht für jeden Wert frisches physisches Rauschen. Begrenzte Ganzzahl-APIs vermeiden Modulo-Verzerrung. Eine einfache Restwertbildung kann manche Seiten bevorzugen, wenn der Bereich nicht aufgeht; begrenzte APIs vermeiden diese Modulo-Verzerrung.';

  @override
  String get randomnessSheetButton => 'Verstanden';

  @override
  String get randomOrgFallbackNotice =>
      'RANDOM.ORG nicht verfügbar. Lokaler sicherer Zufallsgenerator (CSPRNG) wird verwendet.';

  @override
  String get aboutTarotDeckTitle => 'Tarotdeck';

  @override
  String get aboutTarotDeckSubtitle => 'Wähle die Tarotkartenillustrationen.';

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
  String get tarotUpright => 'Aufrecht';

  @override
  String get tarotReversed => 'Umgekehrt';

  @override
  String get tarotMeaningTitle => 'Bedeutung';

  @override
  String get secureRandomUnavailableNotice =>
      'RANDOM.ORG nicht verfügbar und sicherer Generator nicht unterstützt. Lokaler PRNG wird verwendet (nicht kryptografisch sicher).';

  @override
  String get tarotAllowReversed => 'Umgekehrte Karten erlauben';

  @override
  String get tarotShowMeaning => 'Kartenbedeutung anzeigen';
}
