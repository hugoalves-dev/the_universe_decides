// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'The Universe Decides';

  @override
  String get navCoin => 'Pièce';

  @override
  String get navDice => 'Dés';

  @override
  String get navCards => 'Cartes';

  @override
  String get navLists => 'Listes';

  @override
  String get navTarot => 'Tarot';

  @override
  String get navAboutMe => 'À propos';

  @override
  String get coinEyebrow => 'Sceau Rituel';

  @override
  String get coinTitle => 'Pile ou Face';

  @override
  String get coinRitualSubtitle =>
      'Un sceau mystique s\'allume pour confirmer : le résultat vient du pur hasard.';

  @override
  String get coinHeads => 'FACE';

  @override
  String get coinTails => 'PILE';

  @override
  String get coinResultCaption => 'L\'univers a décidé — pas le processeur.';

  @override
  String get coinHint =>
      'Appuie sur le bouton ou fais glisser la pièce pour la lancer';

  @override
  String get coinHintDrag =>
      'Relâche pour lancer — tire plus loin pour plus de force';

  @override
  String get coinDragHelper =>
      'ou fais glisser et lance la pièce d\'une pichenette';

  @override
  String get coinButton => 'Lancer une pièce';

  @override
  String get diceEyebrow => 'Rituel des Dés';

  @override
  String get diceTitle => 'Dés de JDR';

  @override
  String get diceCountLabel => 'QUANTITÉ';

  @override
  String get diceSidesLabel => 'FACES';

  @override
  String get diceRollButton => 'Lancer les dés';

  @override
  String diceTotal(int total) {
    return 'Total : $total';
  }

  @override
  String get cardEyebrow => 'Rituel des Cartes';

  @override
  String get cardTitle => 'Jeu Complet';

  @override
  String get cardSubtitle => '52 cartes. Un destin par tapotement.';

  @override
  String get cardDrawButton => 'Tirer une carte';

  @override
  String get listEyebrow => 'Rituel du Choix';

  @override
  String get listTitle => 'Tirage de Liste';

  @override
  String get listSubtitle => 'Ajoute des options et laisse le hasard décider.';

  @override
  String get listAddOptionHint => 'Nouvelle option…';

  @override
  String get listChooseButton => 'Laisser l\'univers choisir';

  @override
  String get listEmptyState => 'Ajoute au moins deux options pour commencer.';

  @override
  String get listChosenByUniverse => 'Choisi par l\'univers';

  @override
  String get listReadyHint =>
      'Ta liste est prête. Appuie sur le bouton ci-dessus pour choisir.';

  @override
  String get listModeClassic => 'Liste';

  @override
  String get listModeWheel => 'Roue';

  @override
  String get listWheelSpinButton => 'Faire tourner la roue';

  @override
  String get listWheelHint =>
      'Ajoute au moins deux options, puis lance la roue.';

  @override
  String get listWheelSpinAgainHint => 'Touche tourner pour réessayer.';

  @override
  String get listDuplicateItem => 'Cet élément existe déjà dans la liste.';

  @override
  String listDuplicateItemsDiscarded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count éléments en double ont été ignorés.',
      one: '1 élément en double a été ignoré.',
    );
    return '$_temp0';
  }

  @override
  String get tarotEyebrow => 'Rituel du Tarot';

  @override
  String get tarotTitle => 'Tirage de Tarot';

  @override
  String get tarotSubtitle => 'Une carte, révélée par le pur hasard.';

  @override
  String get tarotButton => 'Révéler la carte';

  @override
  String get tarotWaiting => 'La carte attend';

  @override
  String get tarotTapReveal => 'Touche pour révéler';

  @override
  String get tarotMajorArcana => 'Arcanes Majeurs';

  @override
  String get tarotMinorArcana => 'Arcanes Mineurs';

  @override
  String tarotDeckPosition(int number) {
    return 'Carte $number sur 78';
  }

  @override
  String get aboutEyebrow => 'L\'Oracle';

  @override
  String get aboutTitle => 'À propos de moi';

  @override
  String get aboutBioFallback =>
      'Créateur de The Universe Decides, qui utilise RANDOM.ORG si disponible et un générateur local sûr hors ligne.';

  @override
  String get aboutShortcutsTitle => 'Raccourcis rapides';

  @override
  String get aboutAddCoinButton => 'Ajouter la pièce';

  @override
  String get aboutDonationButton => 'Offrez-moi un café';

  @override
  String get aboutSoundEffectsTitle => 'Effets sonores';

  @override
  String get aboutSoundEffectsSubtitle =>
      'Jouer un son discret lorsqu\'une décision est prise.';

  @override
  String get aboutTarotDeckTitle => 'Jeu de tarot';

  @override
  String get aboutTarotDeckSubtitle => 'Choisissez les illustrations des tirages de tarot.';

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
  String get tarotUpright => 'À l’endroit';

  @override
  String get tarotReversed => 'À l’envers';

  @override
  String get tarotMeaningTitle => 'Signification';

  @override
  String get aboutCardDeckTitle => 'Jeu de cartes';

  @override
  String get aboutCardDeckSubtitle => 'Choisissez le visuel des cartes tirées.';

  @override
  String get cardDeckUniverse => 'Style Univers';

  @override
  String get cardDeckPublicDomainBlue => 'Classique (dos bleu)';

  @override
  String get cardDeckPublicDomainRed => 'Classique (dos rouge)';

  @override
  String get aboutRandomnessCardTitle =>
      'Comment fonctionne le hasard';

  @override
  String get aboutRandomnessCardSubtitle =>
      'Différences entre PRNG et générateurs sûrs';

  @override
  String get aboutHistoryCardTitle => 'Résultats récents';

  @override
  String get aboutHistoryCardSubtitle => 'Consulte tes derniers résultats';

  @override
  String get aboutProfileLoadError =>
      'Impossible de charger le profil pour le moment.';

  @override
  String get aboutRetryButton => 'Réessayer';

  @override
  String get historyTitle => 'Historique Récent';

  @override
  String get historyEmptyState => 'Tes résultats récents apparaîtront ici.';

  @override
  String get historyClearButton => 'Effacer l\'historique';

  @override
  String get historyClearDialogTitle => 'Effacer l\'historique ?';

  @override
  String get historyClearDialogMessage =>
      'Cela supprime tous les résultats récents de cet appareil. Cette action est irréversible.';

  @override
  String get historyClearDialogCancel => 'Annuler';

  @override
  String get historyClearDialogConfirm => 'Effacer';

  @override
  String get historyClearedSnackbar => 'Historique effacé.';

  @override
  String get quickTileCoinAdded => 'Raccourci de la pièce ajouté au panneau.';

  @override
  String get quickTileCoinAlreadyAdded =>
      'Le raccourci de la pièce est déjà dans le panneau.';

  @override
  String get quickTileCoinCancelled =>
      'Demande de raccourci de la pièce annulée.';

  @override
  String get quickTileCoinUnsupported =>
      'Ta version d\'Android ne peut pas ajouter ce raccourci depuis l\'appli.';

  @override
  String get randomnessSheetEyebrow => 'Ce qui se cache derrière le hasard';

  @override
  String get randomnessSheetTitle =>
      'PRNG, générateurs sûrs et entropie physique';

  @override
  String get randomnessCard1Title =>
      'Trois notions liées, mais distinctes';

  @override
  String get randomnessCard1Body =>
      'Un PRNG produit une suite déterministe à partir d\'une graine et d\'un état interne. Il convient aux jeux et simulations, mais n\'est pas conçu pour résister à la prédiction. Un CSPRNG (souvent un DRBG) vise des sorties difficiles à prévoir et utilise généralement l\'entropie du système. Une source physique mesure un phénomène physique. Ces notions sont liées, mais différentes.';

  @override
  String get randomnessCard2Title =>
      'Ce que cette app utilise';

  @override
  String get randomnessCard2Body =>
      'Quand le service est disponible, l\'app demande des nombres à RANDOM.ORG, qui décrit le bruit radio atmosphérique comme source d\'entropie. Les données peuvent être traitées et mises en tampon avant la requête ; nous ne vérifions pas ce processus. Hors ligne, l\'app utilise Dart Random.secure() si une source système sûre existe. Si le hasard sûr n’est pas pris en charge, un PRNG ordinaire est utilisé et signalé comme non cryptographiquement sûr.';

  @override
  String get randomnessCard3Title =>
      'L\'entropie n\'est pas une preuve';

  @override
  String get randomnessCard3Body =>
      'L\'entropie décrit l\'incertitude, sans prouver qu\'un résultat est impartial ou vérifiable indépendamment. Le conditionnement peut réduire un biais, mais pas créer l\'entropie manquante. Les tests statistiques détectent certains problèmes sans prouver le hasard. Un générateur sûr n\'a pas besoin de bruit physique neuf pour chaque valeur. Les API d\'entiers bornés évitent le biais modulo. Un simple reste peut favoriser certaines faces si la plage ne se divise pas exactement ; les API bornées évitent ce biais modulo.';

  @override
  String get randomnessSheetButton => 'Compris';

  @override
  String get randomOrgFallbackNotice =>
      'RANDOM.ORG indisponible. Utilisation du générateur sûr local (CSPRNG).';

  @override
  String get secureRandomUnavailableNotice =>
      'RANDOM.ORG indisponible et générateur sûr non pris en charge. Utilisation d’un PRNG local (non cryptographiquement sûr).';
}
