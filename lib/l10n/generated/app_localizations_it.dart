// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'The Universe Decides';

  @override
  String get navCoin => 'Moneta';

  @override
  String get navDice => 'Dadi';

  @override
  String get navCards => 'Carte';

  @override
  String get navLists => 'Liste';

  @override
  String get navTarot => 'Tarocchi';

  @override
  String get navAboutMe => 'Info';

  @override
  String get coinEyebrow => 'Sigillo Rituale';

  @override
  String get coinTitle => 'Testa o Croce';

  @override
  String get coinRitualSubtitle =>
      'Un sigillo mistico si illumina per confermare: il risultato viene dal puro caso.';

  @override
  String get coinHeads => 'TESTA';

  @override
  String get coinTails => 'CROCE';

  @override
  String get coinResultCaption => 'L\'universo ha deciso — non il processore.';

  @override
  String get coinHint => 'Tocca il pulsante o trascina la moneta per lanciarla';

  @override
  String get coinHintDrag =>
      'Rilascia per lanciare — trascina più lontano per più forza';

  @override
  String get coinDragHelper =>
      'oppure trascina e lancia la moneta con un colpetto';

  @override
  String get coinButton => 'Lancia una moneta';

  @override
  String get diceEyebrow => 'Rituale dei Dadi';

  @override
  String get diceTitle => 'Dadi RPG';

  @override
  String get diceCountLabel => 'QUANTITÀ';

  @override
  String get diceSidesLabel => 'FACCE';

  @override
  String get diceRollButton => 'Tira i dadi';

  @override
  String diceTotal(int total) {
    return 'Totale: $total';
  }

  @override
  String get cardEyebrow => 'Rituale delle Carte';

  @override
  String get cardTitle => 'Mazzo Completo';

  @override
  String get cardSubtitle => '52 carte. Un destino per tocco.';

  @override
  String get cardDrawButton => 'Pesca una carta';

  @override
  String get listEyebrow => 'Rituale della Scelta';

  @override
  String get listTitle => 'Estrazione da Lista';

  @override
  String get listSubtitle => 'Aggiungi opzioni e lascia decidere il caso.';

  @override
  String get listAddOptionHint => 'Nuova opzione…';

  @override
  String get listChooseButton => 'Lascia scegliere l\'universo';

  @override
  String get listEmptyState => 'Aggiungi almeno due opzioni per iniziare.';

  @override
  String get listChosenByUniverse => 'Scelto dall\'universo';

  @override
  String get listReadyHint =>
      'La tua lista è pronta. Tocca il pulsante sopra per scegliere.';

  @override
  String get listModeClassic => 'Lista';

  @override
  String get listModeWheel => 'Ruota';

  @override
  String get listWheelSpinButton => 'Gira la ruota';

  @override
  String get listWheelHint => 'Aggiungi almeno due opzioni, poi girala.';

  @override
  String get listWheelSpinAgainHint => 'Tocca gira per riprovare.';

  @override
  String get listDuplicateItem => 'Questo elemento è già presente nella lista.';

  @override
  String listDuplicateItemsDiscarded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sono stati ignorati $count elementi duplicati.',
      one: 'È stato ignorato 1 elemento duplicato.',
    );
    return '$_temp0';
  }

  @override
  String get tarotEyebrow => 'Rituale dei Tarocchi';

  @override
  String get tarotTitle => 'Lettura dei Tarocchi';

  @override
  String get tarotSubtitle => 'Una carta, rivelata dal puro caso.';

  @override
  String get tarotButton => 'Rivela la carta';

  @override
  String get tarotWaiting => 'La carta attende';

  @override
  String get tarotTapReveal => 'Tocca per rivelare';

  @override
  String get tarotMajorArcana => 'Arcani Maggiori';

  @override
  String get tarotMinorArcana => 'Arcani Minori';

  @override
  String tarotDeckPosition(int number) {
    return 'Carta $number di 78';
  }

  @override
  String get aboutEyebrow => 'L\'Oracolo';

  @override
  String get aboutTitle => 'Chi sono';

  @override
  String get aboutBioFallback =>
      'Creatore di The Universe Decides, che usa RANDOM.ORG quando disponibile e un generatore locale sicuro offline.';

  @override
  String get aboutShortcutsTitle => 'Scorciatoie rapide';

  @override
  String get aboutAddCoinButton => 'Aggiungi moneta';

  @override
  String get aboutDonationButton => 'Offrimi un caffè';

  @override
  String get aboutSoundEffectsTitle => 'Effetti sonori';

  @override
  String get aboutSoundEffectsSubtitle =>
      'Riproduci un suono discreto al termine di una decisione.';

  @override
  String get aboutCardDeckTitle => 'Mazzo di carte';

  @override
  String get aboutCardDeckSubtitle =>
      'Scegli lo stile grafico delle carte estratte.';

  @override
  String get cardDeckUniverse => 'Stile Universo';

  @override
  String get cardDeckPublicDomainBlue => 'Classico (retro blu)';

  @override
  String get cardDeckPublicDomainRed => 'Classico (retro rosso)';

  @override
  String get aboutRandomnessCardTitle =>
      'Come funziona la casualità';

  @override
  String get aboutRandomnessCardSubtitle =>
      'Differenze tra PRNG e generatori sicuri';

  @override
  String get aboutHistoryCardTitle => 'Risultati recenti';

  @override
  String get aboutHistoryCardSubtitle => 'Rivedi i tuoi ultimi risultati';

  @override
  String get aboutProfileLoadError =>
      'Al momento non è stato possibile caricare il profilo.';

  @override
  String get aboutRetryButton => 'Riprova';

  @override
  String get historyTitle => 'Cronologia Recente';

  @override
  String get historyEmptyState => 'I tuoi risultati recenti appariranno qui.';

  @override
  String get historyClearButton => 'Cancella cronologia';

  @override
  String get historyClearDialogTitle => 'Cancellare la cronologia?';

  @override
  String get historyClearDialogMessage =>
      'Questo rimuove tutti i risultati recenti da questo dispositivo. Questa azione non può essere annullata.';

  @override
  String get historyClearDialogCancel => 'Annulla';

  @override
  String get historyClearDialogConfirm => 'Cancella';

  @override
  String get historyClearedSnackbar => 'Cronologia cancellata.';

  @override
  String get quickTileCoinAdded =>
      'Scorciatoia della moneta aggiunta al pannello.';

  @override
  String get quickTileCoinAlreadyAdded =>
      'La scorciatoia della moneta è già nel pannello.';

  @override
  String get quickTileCoinCancelled =>
      'Richiesta della scorciatoia della moneta annullata.';

  @override
  String get quickTileCoinUnsupported =>
      'La tua versione di Android non può aggiungere questa scorciatoia dall\'app.';

  @override
  String get randomnessSheetEyebrow => 'Cosa c\'è dietro il caso';

  @override
  String get randomnessSheetTitle =>
      'PRNG, generatori sicuri ed entropia fisica';

  @override
  String get randomnessCard1Title =>
      'Tre concetti correlati, ma distinti';

  @override
  String get randomnessCard1Body =>
      'Un PRNG produce sequenze deterministiche da un seme e uno stato interno. È utile per giochi e simulazioni, ma non è progettato per resistere alle previsioni. Un CSPRNG (spesso un DRBG) mira a rendere difficile prevedere i risultati e di solito usa entropia del sistema operativo. Una fonte fisica misura un fenomeno fisico. Sono concetti collegati, non intercambiabili.';

  @override
  String get randomnessCard2Title =>
      'Cosa usa questa app';

  @override
  String get randomnessCard2Body =>
      'Quando disponibile, l\'app richiede numeri a RANDOM.ORG, che documenta il rumore radio atmosferico come fonte di entropia. I dati possono essere elaborati e bufferizzati prima della richiesta; non verifichiamo questo processo. Offline, l\'app usa Dart Random.secure() se è disponibile una fonte sicura del sistema. Se la casualità sicura non è supportata, usa un PRNG comune e lo segnala come non sicuro a livello crittografico.';

  @override
  String get randomnessCard3Title =>
      'L\'entropia non è una prova';

  @override
  String get randomnessCard3Body =>
      'L\'entropia descrive l\'incertezza, ma non prova che un risultato sia imparziale o verificabile in modo indipendente. Il condizionamento può ridurre distorsioni, non creare entropia mancante. I test statistici trovano alcuni problemi, ma non dimostrano la casualità. Un generatore sicuro non richiede nuovo rumore fisico per ogni valore. Le API per interi limitati evitano il bias modulo. Il resto può favorire alcune facce se l’intervallo non si divide esattamente; le API con limiti evitano questo bias modulo.';

  @override
  String get randomnessSheetButton => 'Capito';

  @override
  String get randomOrgFallbackNotice =>
      'RANDOM.ORG non disponibile. Uso del generatore sicuro locale (CSPRNG).';

  @override
  String get secureRandomUnavailableNotice =>
      'RANDOM.ORG non disponibile e RNG sicuro non supportato. Uso di un PRNG locale (non sicuro a livello crittografico).';
}
