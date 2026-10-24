// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'The Universe Decides';

  @override
  String get navCoin => 'Moneda';

  @override
  String get navDice => 'Dados';

  @override
  String get navCards => 'Cartas';

  @override
  String get navLists => 'Listas';

  @override
  String get navTarot => 'Tarot';

  @override
  String get navAboutMe => 'Acerca';

  @override
  String get coinEyebrow => 'Sello Ritual';

  @override
  String get coinTitle => 'Cara o Cruz';

  @override
  String get coinRitualSubtitle =>
      'Un sello místico se enciende para confirmar: el resultado viene del azar puro.';

  @override
  String get coinHeads => 'CARA';

  @override
  String get coinTails => 'CRUZ';

  @override
  String get coinResultCaption => 'El universo decidió — no el procesador.';

  @override
  String get coinHint => 'Toca el botón o arrastra la moneda para lanzarla';

  @override
  String get coinHintDrag =>
      'Suelta para lanzar — tira más lejos para más fuerza';

  @override
  String get coinDragHelper => 'o arrastra y suelta la moneda para lanzarla';

  @override
  String get coinButton => 'Lanzar moneda';

  @override
  String get diceEyebrow => 'Ritual de los Dados';

  @override
  String get diceTitle => 'Dados de RPG';

  @override
  String get diceCountLabel => 'CANTIDAD';

  @override
  String get diceSidesLabel => 'CARAS';

  @override
  String get diceRollButton => 'Tirar dados';

  @override
  String diceTotal(int total) {
    return 'Total: $total';
  }

  @override
  String get cardEyebrow => 'Ritual de las Cartas';

  @override
  String get cardTitle => 'Baraja Completa';

  @override
  String get cardSubtitle => '52 cartas. Un destino por toque.';

  @override
  String get cardDrawButton => 'Sacar una carta';

  @override
  String get listEyebrow => 'Ritual de la Elección';

  @override
  String get listTitle => 'Sorteo de Lista';

  @override
  String get listSubtitle => 'Agrega opciones y deja que el azar decida.';

  @override
  String get listAddOptionHint => 'Nueva opción…';

  @override
  String get listChooseButton => 'Dejar que el universo elija';

  @override
  String get listEmptyState => 'Agrega al menos dos opciones para comenzar.';

  @override
  String get listChosenByUniverse => 'Elegido por el universo';

  @override
  String get listReadyHint =>
      'Tu lista está lista. Toca el botón de arriba para elegir.';

  @override
  String get listModeClassic => 'Lista';

  @override
  String get listModeWheel => 'Ruleta';

  @override
  String get listWheelSpinButton => 'Girar la ruleta';

  @override
  String get listWheelHint => 'Agrega al menos dos opciones y gira.';

  @override
  String get listWheelSpinAgainHint => 'Toca girar para intentarlo de nuevo.';

  @override
  String get listDuplicateItem => 'Este elemento ya existe en la lista.';

  @override
  String listDuplicateItemsDiscarded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se omitieron $count elementos duplicados.',
      one: 'Se omitió 1 elemento duplicado.',
    );
    return '$_temp0';
  }

  @override
  String get tarotEyebrow => 'Ritual del Tarot';

  @override
  String get tarotTitle => 'Lectura de Tarot';

  @override
  String get tarotSubtitle => 'Una carta, revelada por el azar puro.';

  @override
  String get tarotButton => 'Revelar carta';

  @override
  String get tarotWaiting => 'La carta espera';

  @override
  String get tarotTapReveal => 'Toca para revelar';

  @override
  String get tarotMajorArcana => 'Arcanos Mayores';

  @override
  String get tarotMinorArcana => 'Arcanos Menores';

  @override
  String tarotDeckPosition(int number) {
    return 'Carta $number de 78';
  }

  @override
  String get aboutEyebrow => 'El Oráculo';

  @override
  String get aboutTitle => 'Acerca de mí';

  @override
  String get aboutBioFallback =>
      'Creador de The Universe Decides, que usa RANDOM.ORG cuando está disponible y un generador local seguro sin conexión.';

  @override
  String get aboutShortcutsTitle => 'Accesos rápidos';

  @override
  String get aboutAddCoinButton => 'Añadir moneda';

  @override
  String get aboutDonationButton => 'Invítame un café';

  @override
  String get aboutSoundEffectsTitle => 'Efectos de sonido';

  @override
  String get aboutSoundEffectsSubtitle =>
      'Reproducir un sonido sutil cuando se complete una decisión.';

  @override
  String get aboutTarotDeckTitle => 'Mazo de tarot';

  @override
  String get aboutTarotDeckSubtitle => 'Elige las ilustraciones para las tiradas de tarot.';

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
  String get tarotUpright => 'Al derecho';

  @override
  String get tarotReversed => 'Invertida';

  @override
  String get tarotMeaningTitle => 'Significado';

  @override
  String get aboutCardDeckTitle => 'Baraja de cartas';

  @override
  String get aboutCardDeckSubtitle =>
      'Elige el diseño de las cartas que se extraen.';

  @override
  String get cardDeckUniverse => 'Estilo Universo';

  @override
  String get cardDeckPublicDomainBlue => 'Clásico (reverso azul)';

  @override
  String get cardDeckPublicDomainRed => 'Clásico (reverso rojo)';

  @override
  String get aboutRandomnessCardTitle =>
      'Cómo funciona la aleatoriedad';

  @override
  String get aboutRandomnessCardSubtitle =>
      'Diferencias entre PRNG y generadores seguros';

  @override
  String get aboutHistoryCardTitle => 'Resultados recientes';

  @override
  String get aboutHistoryCardSubtitle => 'Revisa tus últimos resultados';

  @override
  String get aboutProfileLoadError =>
      'No se pudo cargar el perfil en este momento.';

  @override
  String get aboutRetryButton => 'Reintentar';

  @override
  String get historyTitle => 'Historial Reciente';

  @override
  String get historyEmptyState => 'Tus resultados recientes aparecerán aquí.';

  @override
  String get historyClearButton => 'Borrar historial';

  @override
  String get historyClearDialogTitle => '¿Borrar historial?';

  @override
  String get historyClearDialogMessage =>
      'Esto elimina todos los resultados recientes de este dispositivo. Esta acción no se puede deshacer.';

  @override
  String get historyClearDialogCancel => 'Cancelar';

  @override
  String get historyClearDialogConfirm => 'Borrar';

  @override
  String get historyClearedSnackbar => 'Historial borrado.';

  @override
  String get quickTileCoinAdded =>
      'Acceso directo de la moneda añadido al panel.';

  @override
  String get quickTileCoinAlreadyAdded =>
      'El acceso directo de la moneda ya está en el panel.';

  @override
  String get quickTileCoinCancelled =>
      'Solicitud del acceso directo de la moneda cancelada.';

  @override
  String get quickTileCoinUnsupported =>
      'Tu versión de Android no puede añadir este acceso directo desde la app.';

  @override
  String get randomnessSheetEyebrow => 'Qué hay detrás del azar';

  @override
  String get randomnessSheetTitle =>
      'PRNG, generadores seguros y entropía física';

  @override
  String get randomnessCard1Title =>
      'Tres conceptos relacionados, pero distintos';

  @override
  String get randomnessCard1Body =>
      'Un PRNG genera secuencias deterministas a partir de una semilla y un estado interno. Sirve para juegos y simulaciones, pero no está diseñado para resistir predicciones. Un CSPRNG (a menudo implementado como DRBG) busca que sus resultados sean difíciles de predecir y suele usar entropía del sistema operativo. Una fuente física mide un proceso físico. Son conceptos relacionados, no intercambiables.';

  @override
  String get randomnessCard2Title =>
      'Qué usa esta app';

  @override
  String get randomnessCard2Body =>
      'Cuando está disponible, la app solicita números a RANDOM.ORG, que documenta el ruido de radio atmosférico como fuente de entropía. Los datos pueden procesarse y almacenarse en búfer antes de la solicitud; no verificamos ese proceso. Sin conexión, la app usa Dart Random.secure() si el sistema ofrece una fuente segura. Si no se admite la aleatoriedad segura, usa un PRNG común e indica que no es criptográficamente seguro.';

  @override
  String get randomnessCard3Title =>
      'La entropía no es una prueba';

  @override
  String get randomnessCard3Body =>
      'La entropía describe incertidumbre, no demuestra que un resultado concreto sea imparcial o verificable. El acondicionamiento puede reducir sesgos, pero no crear entropía faltante. Las pruebas estadísticas detectan algunos problemas, no prueban aleatoriedad. Un generador seguro no necesita ruido físico nuevo para cada valor. Las API de enteros acotados evitan el sesgo de módulo. Usar el resto puede favorecer algunos lados si el rango no divide exactamente; las API acotadas evitan ese sesgo de módulo.';

  @override
  String get randomnessSheetButton => 'Entendido';

  @override
  String get randomOrgFallbackNotice =>
      'RANDOM.ORG no disponible. Se usa un generador seguro local (CSPRNG).';

  @override
  String get secureRandomUnavailableNotice =>
      'RANDOM.ORG no disponible y RNG seguro no compatible. Se usa un PRNG local (no es criptográficamente seguro).';
}
