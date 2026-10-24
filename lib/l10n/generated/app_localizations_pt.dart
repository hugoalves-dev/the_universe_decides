// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'The Universe Decides';

  @override
  String get navCoin => 'Moeda';

  @override
  String get navDice => 'Dados';

  @override
  String get navCards => 'Cartas';

  @override
  String get navLists => 'Lista';

  @override
  String get navTarot => 'Tarot';

  @override
  String get navAboutMe => 'Sobre';

  @override
  String get coinEyebrow => 'Selo Ritual';

  @override
  String get coinTitle => 'Cara ou Coroa';

  @override
  String get coinRitualSubtitle =>
      'Um selo místico se acende para confirmar: o resultado vem do acaso puro.';

  @override
  String get coinHeads => 'CARA';

  @override
  String get coinTails => 'COROA';

  @override
  String get coinResultCaption => 'O universo decidiu — não o processador.';

  @override
  String get coinHint => 'Toque no botão ou arraste a moeda para lançar';

  @override
  String get coinHintDrag => 'Solte para lançar — puxe mais para mais força';

  @override
  String get coinDragHelper => 'ou arraste e solte a moeda para lançar';

  @override
  String get coinButton => 'Lançar a moeda';

  @override
  String get diceEyebrow => 'Ritual dos Dados';

  @override
  String get diceTitle => 'Dados RPG';

  @override
  String get diceCountLabel => 'QUANTIDADE';

  @override
  String get diceSidesLabel => 'LADOS';

  @override
  String get diceRollButton => 'Rolar os dados';

  @override
  String diceTotal(int total) {
    return 'Total: $total';
  }

  @override
  String get cardEyebrow => 'Ritual das Cartas';

  @override
  String get cardTitle => 'Baralho Completo';

  @override
  String get cardSubtitle => '52 cartas. Um destino por toque.';

  @override
  String get cardDrawButton => 'Sacar carta';

  @override
  String get listEyebrow => 'Ritual da Escolha';

  @override
  String get listTitle => 'Sorteio de Lista';

  @override
  String get listSubtitle => 'Adicione opções e deixe o acaso decidir.';

  @override
  String get listAddOptionHint => 'Nova opção…';

  @override
  String get listChooseButton => 'Deixar o universo escolher';

  @override
  String get listEmptyState => 'Adicione ao menos duas opções para começar.';

  @override
  String get listChosenByUniverse => 'Escolhido pelo universo';

  @override
  String get listReadyHint =>
      'Sua lista está pronta. Toque no botão acima para escolher.';

  @override
  String get listModeClassic => 'Lista';

  @override
  String get listModeWheel => 'Roleta';

  @override
  String get listWheelSpinButton => 'Girar a roleta';

  @override
  String get listWheelHint => 'Adicione ao menos duas opções e gire.';

  @override
  String get listWheelSpinAgainHint => 'Toque em girar para tentar de novo.';

  @override
  String get listDuplicateItem => 'Este item já existe na lista.';

  @override
  String listDuplicateItemsDiscarded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count itens duplicados foram ignorados.',
      one: '1 item duplicado foi ignorado.',
    );
    return '$_temp0';
  }

  @override
  String get tarotEyebrow => 'Ritual do Tarot';

  @override
  String get tarotTitle => 'Leitura do Tarot';

  @override
  String get tarotSubtitle => 'Uma carta, revelada pelo acaso puro.';

  @override
  String get tarotButton => 'Revelar carta';

  @override
  String get tarotWaiting => 'A carta aguarda';

  @override
  String get tarotTapReveal => 'Toque em revelar';

  @override
  String get tarotMajorArcana => 'Arcano Maior';

  @override
  String get tarotMinorArcana => 'Arcano Menor';

  @override
  String tarotDeckPosition(int number) {
    return 'Carta $number de 78';
  }

  @override
  String get aboutEyebrow => 'O Oráculo';

  @override
  String get aboutTitle => 'Sobre mim';

  @override
  String get aboutBioFallback =>
      'Criador do The Universe Decides, que usa o RANDOM.ORG quando disponível e um gerador local seguro offline.';

  @override
  String get aboutShortcutsTitle => 'Atalhos rápidos';

  @override
  String get aboutAddCoinButton => 'Adicionar moeda';

  @override
  String get aboutDonationButton => 'Compre-me um café';

  @override
  String get aboutSoundEffectsTitle => 'Efeitos sonoros';

  @override
  String get aboutSoundEffectsSubtitle =>
      'Reproduzir um som sutil quando uma decisão terminar.';

  @override
  String get aboutCardDeckTitle => 'Baralho de cartas';

  @override
  String get aboutCardDeckSubtitle => 'Escolha o visual das cartas sorteadas.';

  @override
  String get cardDeckUniverse => 'Estilo Universo';

  @override
  String get cardDeckPublicDomainBlue => 'Clássico (verso azul)';

  @override
  String get cardDeckPublicDomainRed => 'Clássico (verso vermelho)';

  @override
  String get aboutRandomnessCardTitle =>
      'Como funciona a aleatoriedade';

  @override
  String get aboutRandomnessCardSubtitle =>
      'Diferenças entre PRNGs e geradores seguros';

  @override
  String get aboutHistoryCardTitle => 'Resultados recentes';

  @override
  String get aboutHistoryCardSubtitle => 'Reveja seus últimos resultados';

  @override
  String get aboutProfileLoadError =>
      'Não foi possível carregar o perfil agora.';

  @override
  String get aboutRetryButton => 'Tentar novamente';

  @override
  String get historyTitle => 'Histórico Recente';

  @override
  String get historyEmptyState => 'Seus resultados recentes vão aparecer aqui.';

  @override
  String get historyClearButton => 'Limpar histórico';

  @override
  String get historyClearDialogTitle => 'Limpar histórico?';

  @override
  String get historyClearDialogMessage =>
      'Isso remove todos os resultados recentes deste dispositivo. Essa ação não pode ser desfeita.';

  @override
  String get historyClearDialogCancel => 'Cancelar';

  @override
  String get historyClearDialogConfirm => 'Limpar';

  @override
  String get historyClearedSnackbar => 'Histórico limpo.';

  @override
  String get quickTileCoinAdded => 'Atalho da moeda adicionado ao painel.';

  @override
  String get quickTileCoinAlreadyAdded =>
      'O atalho da moeda ja estava no painel.';

  @override
  String get quickTileCoinCancelled => 'Adicao da moeda cancelada.';

  @override
  String get quickTileCoinUnsupported =>
      'Seu Android nao permite pedir esse atalho pelo app.';

  @override
  String get randomnessSheetEyebrow => 'O que há por trás do acaso';

  @override
  String get randomnessSheetTitle =>
      'PRNG, geradores seguros e entropia física';

  @override
  String get randomnessCard1Title =>
      'Três conceitos relacionados, mas distintos';

  @override
  String get randomnessCard1Body =>
      'Um PRNG produz sequências determinísticas a partir de uma semente e de um estado interno. É útil para jogos e simulações, mas não foi projetado para resistir a previsões. Um CSPRNG (muitas vezes um DRBG) busca tornar as saídas difíceis de prever e normalmente usa entropia do sistema operacional. Uma fonte física mede um processo físico. São conceitos relacionados, mas diferentes.';

  @override
  String get randomnessCard2Title =>
      'O que este app usa';

  @override
  String get randomnessCard2Body =>
      'Quando disponível, o app solicita números ao RANDOM.ORG, que documenta ruído de rádio atmosférico como fonte de entropia. A saída pode ser processada e armazenada em buffer antes da solicitação; não verificamos esse processo. Offline, o app usa Dart Random.secure() se houver uma fonte segura do sistema. Se a aleatoriedade segura não for compatível, usa um PRNG comum e o identifica como não seguro criptograficamente.';

  @override
  String get randomnessCard3Title =>
      'Entropia não é prova';

  @override
  String get randomnessCard3Body =>
      'Entropia descreve incerteza, mas não prova que um resultado seja imparcial ou verificável de forma independente. O condicionamento pode reduzir viés, mas não criar entropia ausente. Testes estatísticos detectam alguns problemas, mas não provam aleatoriedade. Um gerador seguro não precisa de novo ruído físico para cada valor. APIs de inteiros limitados evitam viés de módulo. O resto pode favorecer algumas faces quando o intervalo não se divide igualmente; APIs limitadas evitam esse viés de módulo.';

  @override
  String get randomnessSheetButton => 'Entendi';

  @override
  String get randomOrgFallbackNotice =>
      'RANDOM.ORG indisponível. Usando gerador seguro local (CSPRNG).';

  @override
  String get secureRandomUnavailableNotice =>
      'RANDOM.ORG indisponível e RNG seguro não suportado. Usando PRNG local (não seguro criptograficamente).';
}
