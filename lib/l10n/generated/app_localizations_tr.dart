// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'The Universe Decides';

  @override
  String get navCoin => 'Para';

  @override
  String get navDice => 'Zar';

  @override
  String get navCards => 'Kartlar';

  @override
  String get navLists => 'Listeler';

  @override
  String get navTarot => 'Tarot';

  @override
  String get navAboutMe => 'Hakkında';

  @override
  String get coinEyebrow => 'Ritüel Mührü';

  @override
  String get coinTitle => 'Yazı Tura';

  @override
  String get coinRitualSubtitle =>
      'Mistik bir mühür yanar ve şunu doğrular: sonuç saf şanstan gelir.';

  @override
  String get coinHeads => 'YAZI';

  @override
  String get coinTails => 'TURA';

  @override
  String get coinResultCaption => 'Evren karar verdi — işlemci değil.';

  @override
  String get coinHint => 'Çevirmek için düğmeye dokun ya da parayı sürükle';

  @override
  String get coinHintDrag =>
      'Çevirmek için bırak — daha fazla güç için daha çok çek';

  @override
  String get coinDragHelper => 'ya da parayı sürükleyip fırlatarak at';

  @override
  String get coinButton => 'Parayı çevir';

  @override
  String get diceEyebrow => 'Zar Ritüeli';

  @override
  String get diceTitle => 'RPG Zarları';

  @override
  String get diceCountLabel => 'ADET';

  @override
  String get diceSidesLabel => 'YÜZEY';

  @override
  String get diceRollButton => 'Zar at';

  @override
  String diceTotal(int total) {
    return 'Toplam: $total';
  }

  @override
  String get cardEyebrow => 'Kart Ritüeli';

  @override
  String get cardTitle => 'Tam Deste';

  @override
  String get cardSubtitle => '52 kart. Her dokunuşta bir kader.';

  @override
  String get cardDrawButton => 'Kart çek';

  @override
  String get listEyebrow => 'Seçim Ritüeli';

  @override
  String get listTitle => 'Liste Çekilişi';

  @override
  String get listSubtitle =>
      'Seçenekler ekle ve şansın karar vermesine izin ver.';

  @override
  String get listAddOptionHint => 'Yeni seçenek…';

  @override
  String get listChooseButton => 'Evrenin seçmesine izin ver';

  @override
  String get listEmptyState => 'Başlamak için en az iki seçenek ekle.';

  @override
  String get listChosenByUniverse => 'Evren tarafından seçildi';

  @override
  String get listReadyHint =>
      'Listen hazır. Seçmek için yukarıdaki düğmeye dokun.';

  @override
  String get listModeClassic => 'Liste';

  @override
  String get listModeWheel => 'Çark';

  @override
  String get listWheelSpinButton => 'Çarkı çevir';

  @override
  String get listWheelHint => 'En az iki seçenek ekle, sonra çevir.';

  @override
  String get listWheelSpinAgainHint => 'Tekrar denemek için çevire dokun.';

  @override
  String get listDuplicateItem => 'Bu öğe listede zaten var.';

  @override
  String listDuplicateItemsDiscarded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count yinelenen öğe atlandı.',
      one: '1 yinelenen öğe atlandı.',
    );
    return '$_temp0';
  }

  @override
  String get tarotEyebrow => 'Tarot Ritüeli';

  @override
  String get tarotTitle => 'Tarot Falı';

  @override
  String get tarotSubtitle => 'Saf şansla açığa çıkan tek bir kart.';

  @override
  String get tarotButton => 'Kartı aç';

  @override
  String get tarotWaiting => 'Kart bekliyor';

  @override
  String get tarotTapReveal => 'Açmak için dokun';

  @override
  String get tarotMajorArcana => 'Büyük Arkana';

  @override
  String get tarotMinorArcana => 'Küçük Arkana';

  @override
  String tarotDeckPosition(int number) {
    return 'Kart $number / 78';
  }

  @override
  String get aboutEyebrow => 'Kâhin';

  @override
  String get aboutTitle => 'Hakkımda';

  @override
  String get aboutBioFallback =>
      'RANDOM.ORG mevcutken ve çevrimdışıyken yerel güvenli üreteç kullanan The Universe Decides uygulamasının geliştiricisi.';

  @override
  String get aboutShortcutsTitle => 'Hızlı kısayollar';

  @override
  String get aboutAddCoinButton => 'Para ekle';

  @override
  String get aboutDonationButton => 'Bana bir kahve ısmarla';

  @override
  String get aboutSoundEffectsTitle => 'Ses efektleri';

  @override
  String get aboutSoundEffectsSubtitle =>
      'Bir karar tamamlandığında hafif bir ses çal.';

  @override
  String get aboutCardDeckTitle => 'Kart destesi';

  @override
  String get aboutCardDeckSubtitle => 'Çekilen kartların tasarımını seçin.';

  @override
  String get cardDeckUniverse => 'Evren stili';

  @override
  String get cardDeckPublicDomainBlue => 'Klasik (mavi arka yüz)';

  @override
  String get cardDeckPublicDomainRed => 'Klasik (kırmızı arka yüz)';

  @override
  String get aboutRandomnessCardTitle => 'Rastgelelik nasıl çalışır';

  @override
  String get aboutRandomnessCardSubtitle =>
      'PRNG ve güvenli üreteçler arasındaki farklar';

  @override
  String get aboutHistoryCardTitle => 'Son sonuçlar';

  @override
  String get aboutHistoryCardSubtitle => 'Son sonuçlarını gözden geçir';

  @override
  String get aboutProfileLoadError => 'Profil şu anda yüklenemedi.';

  @override
  String get aboutRetryButton => 'Tekrar dene';

  @override
  String get historyTitle => 'Son Geçmiş';

  @override
  String get historyEmptyState => 'Son sonuçların burada görünecek.';

  @override
  String get historyClearButton => 'Geçmişi temizle';

  @override
  String get historyClearDialogTitle => 'Geçmiş temizlensin mi?';

  @override
  String get historyClearDialogMessage =>
      'Bu, bu cihazdaki tüm son sonuçları kaldırır. Bu işlem geri alınamaz.';

  @override
  String get historyClearDialogCancel => 'İptal';

  @override
  String get historyClearDialogConfirm => 'Temizle';

  @override
  String get historyClearedSnackbar => 'Geçmiş temizlendi.';

  @override
  String get quickTileCoinAdded => 'Para kısayolu panele eklendi.';

  @override
  String get quickTileCoinAlreadyAdded => 'Para kısayolu zaten panelde.';

  @override
  String get quickTileCoinCancelled => 'Para kısayolu isteği iptal edildi.';

  @override
  String get quickTileCoinUnsupported =>
      'Android sürümün bu kısayolu uygulamadan ekleyemiyor.';

  @override
  String get randomnessSheetEyebrow => 'Şansın arkasında ne var';

  @override
  String get randomnessSheetTitle =>
      'PRNG, güvenli üreteçler ve fiziksel entropi';

  @override
  String get randomnessCard1Title => 'İlişkili ama farklı üç kavram';

  @override
  String get randomnessCard1Body =>
      'PRNG, bir başlangıç değeri ve iç durumdan belirleyici diziler üretir. Oyunlar ve benzetimler için kullanışlıdır ancak tahmine karşı koruma amacı taşımaz. CSPRNG (çoğunlukla DRBG olarak kurulur), çıktıları tahmin etmeyi zorlaştırır ve genellikle işletim sistemi entropisini kullanır. Fiziksel kaynak bir fiziksel süreci ölçer. Bunlar ilişkili ama farklı kavramlardır.';

  @override
  String get randomnessCard2Title => 'Bu uygulamanın kullandıkları';

  @override
  String get randomnessCard2Body =>
      'Kullanılabilir olduğunda uygulama, atmosferik radyo gürültüsünü entropi kaynağı olarak belgeleyen RANDOM.ORG\'dan sayı ister. Veriler istek öncesinde işlenip tamponlanabilir; bu süreci biz doğrulamıyoruz. Çevrimdışıyken uygulama, sistem güvenli kaynak sağlıyorsa Dart Random.secure() kullanır. Güvenli rastgelelik desteklenmiyorsa sıradan bir PRNG kullanır ve bunu kriptografik olarak güvenli değil diye belirtir.';

  @override
  String get randomnessCard3Title => 'Entropi kanıt değildir';

  @override
  String get randomnessCard3Body =>
      'Entropi belirsizliği anlatır; tek bir sonucun tarafsız veya bağımsız doğrulanabilir olduğunu kanıtlamaz. İşleme yanlılığı azaltabilir, eksik entropiyi yaratamaz. İstatistik testleri bazı sorunları bulabilir ama rastgeleliği kanıtlayamaz. Güvenli üreteç her değer için yeni fiziksel gürültü gerektirmez. Sınırlandırılmış tamsayı API\'leri modül yanlılığını önler. Aralık eşit bölünmüyorsa kalan işlemi bazı yüzleri daha olası kılabilir; sınırlandırılmış API’ler bu modulo yanlılığını önler.';

  @override
  String get randomnessSheetButton => 'Anladım';

  @override
  String get randomOrgFallbackNotice =>
      'RANDOM.ORG kullanılamıyor. Yerel güvenli üreteç (CSPRNG) kullanılıyor.';

  @override
  String get aboutTarotDeckTitle => 'Tarot destesi';

  @override
  String get aboutTarotDeckSubtitle =>
      'Tarot açılımları için görsel stili seçin.';

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
  String get tarotUpright => 'Düz';

  @override
  String get tarotReversed => 'Ters';

  @override
  String get tarotMeaningTitle => 'Anlam';

  @override
  String get secureRandomUnavailableNotice =>
      'RANDOM.ORG kullanılamıyor ve güvenli RNG desteklenmiyor. Yerel PRNG kullanılıyor (kriptografik olarak güvenli değil).';

  @override
  String get tarotAllowReversed => 'Ters kartlara izin ver';

  @override
  String get tarotShowMeaning => 'Kart anlamını göster';
}
