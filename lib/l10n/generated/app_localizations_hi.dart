// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'The Universe Decides';

  @override
  String get navCoin => 'सिक्का';

  @override
  String get navDice => 'पासा';

  @override
  String get navCards => 'कार्ड्स';

  @override
  String get navLists => 'सूचियाँ';

  @override
  String get navTarot => 'टैरो';

  @override
  String get navAboutMe => 'परिचय';

  @override
  String get coinEyebrow => 'अनुष्ठान मुहर';

  @override
  String get coinTitle => 'हेड्स या टेल्स';

  @override
  String get coinRitualSubtitle =>
      'एक रहस्यमय मुहर जलती है यह पुष्टि करने के लिए: परिणाम शुद्ध संयोग से आता है।';

  @override
  String get coinHeads => 'हेड्स';

  @override
  String get coinTails => 'टेल्स';

  @override
  String get coinResultCaption => 'ब्रह्मांड ने तय किया — प्रोसेसर ने नहीं।';

  @override
  String get coinHint => 'उछालने के लिए बटन दबाएं या सिक्के को खींचें';

  @override
  String get coinHintDrag =>
      'उछालने के लिए छोड़ें — अधिक ज़ोर के लिए और खींचें';

  @override
  String get coinDragHelper => 'या सिक्के को खींचकर फेंकें';

  @override
  String get coinButton => 'सिक्का उछालें';

  @override
  String get diceEyebrow => 'पासा अनुष्ठान';

  @override
  String get diceTitle => 'RPG पासे';

  @override
  String get diceCountLabel => 'मात्रा';

  @override
  String get diceSidesLabel => 'पहलू';

  @override
  String get diceRollButton => 'पासा फेंकें';

  @override
  String diceTotal(int total) {
    return 'कुल: $total';
  }

  @override
  String get cardEyebrow => 'कार्ड अनुष्ठान';

  @override
  String get cardTitle => 'पूरा डेक';

  @override
  String get cardSubtitle => '52 कार्ड। एक टैप, एक नियति।';

  @override
  String get cardDrawButton => 'एक कार्ड निकालें';

  @override
  String get listEyebrow => 'चयन अनुष्ठान';

  @override
  String get listTitle => 'सूची चयन';

  @override
  String get listSubtitle => 'विकल्प जोड़ें और संयोग को निर्णय लेने दें।';

  @override
  String get listAddOptionHint => 'नया विकल्प…';

  @override
  String get listChooseButton => 'ब्रह्मांड को चुनने दें';

  @override
  String get listEmptyState => 'शुरू करने के लिए कम से कम दो विकल्प जोड़ें।';

  @override
  String get listChosenByUniverse => 'ब्रह्मांड द्वारा चुना गया';

  @override
  String get listReadyHint =>
      'आपकी सूची तैयार है। चुनने के लिए ऊपर दिया गया बटन दबाएं।';

  @override
  String get listModeClassic => 'सूची';

  @override
  String get listModeWheel => 'पहिया';

  @override
  String get listWheelSpinButton => 'पहिया घुमाएं';

  @override
  String get listWheelHint => 'कम से कम दो विकल्प जोड़ें, फिर घुमाएं।';

  @override
  String get listWheelSpinAgainHint => 'फिर से आज़माने के लिए घुमाएं दबाएं।';

  @override
  String get listDuplicateItem => 'यह आइटम पहले से सूची में मौजूद है।';

  @override
  String listDuplicateItemsDiscarded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count डुप्लिकेट आइटम छोड़ दिए गए।',
      one: '1 डुप्लिकेट आइटम छोड़ दिया गया।',
    );
    return '$_temp0';
  }

  @override
  String get tarotEyebrow => 'टैरो अनुष्ठान';

  @override
  String get tarotTitle => 'टैरो रीडिंग';

  @override
  String get tarotSubtitle => 'एक कार्ड, शुद्ध संयोग से प्रकट।';

  @override
  String get tarotButton => 'कार्ड प्रकट करें';

  @override
  String get tarotWaiting => 'कार्ड प्रतीक्षा में है';

  @override
  String get tarotTapReveal => 'प्रकट करने के लिए टैप करें';

  @override
  String get tarotMajorArcana => 'मेजर आर्काना';

  @override
  String get tarotMinorArcana => 'माइनर आर्काना';

  @override
  String tarotDeckPosition(int number) {
    return 'कार्ड $number / 78';
  }

  @override
  String get aboutEyebrow => 'दैवज्ञ';

  @override
  String get aboutTitle => 'मेरे बारे में';

  @override
  String get aboutBioFallback =>
      'The Universe Decides के निर्माता; उपलब्ध होने पर RANDOM.ORG और ऑफ़लाइन स्थानीय सुरक्षित जनरेटर का उपयोग करता है।';

  @override
  String get aboutShortcutsTitle => 'त्वरित शॉर्टकट';

  @override
  String get aboutAddCoinButton => 'सिक्का जोड़ें';

  @override
  String get aboutDonationButton => 'मुझे कॉफ़ी पिलाएं';

  @override
  String get aboutSoundEffectsTitle => 'ध्वनि प्रभाव';

  @override
  String get aboutSoundEffectsSubtitle =>
      'निर्णय पूरा होने पर एक हल्की ध्वनि बजाएं।';

  @override
  String get aboutTarotDeckTitle => 'टैरो डेक';

  @override
  String get aboutTarotDeckSubtitle => 'टैरो कार्ड की कलाकृति चुनें।';

  @override
  String get tarotDeckRiderWaite => 'राइडर–वेट';

  @override
  String get tarotDeckJeanDodal => 'जीन डोडल';

  @override
  String get tarotDeckVieville => 'विएविल';

  @override
  String get tarotDeckSolaBusca => 'सोला–बुस्का';

  @override
  String get tarotDeckEtteilla => 'एटेय्या I';

  @override
  String get tarotUpright => 'सीधा';

  @override
  String get tarotReversed => 'उल्टा';

  @override
  String get tarotMeaningTitle => 'अर्थ';

  @override
  String get aboutCardDeckTitle => 'ताश का डेक';

  @override
  String get aboutCardDeckSubtitle => 'खींचे गए कार्डों का डिज़ाइन चुनें।';

  @override
  String get cardDeckUniverse => 'यूनिवर्स शैली';

  @override
  String get cardDeckPublicDomainBlue => 'क्लासिक (नीली पीठ)';

  @override
  String get cardDeckPublicDomainRed => 'क्लासिक (लाल पीठ)';

  @override
  String get aboutRandomnessCardTitle =>
      'यादृच्छिकता कैसे काम करती है';

  @override
  String get aboutRandomnessCardSubtitle =>
      'PRNG और सुरक्षित RNG के बीच अंतर';

  @override
  String get aboutHistoryCardTitle => 'हाल के परिणाम';

  @override
  String get aboutHistoryCardSubtitle => 'अपने पिछले परिणाम देखें';

  @override
  String get aboutProfileLoadError => 'अभी प्रोफ़ाइल लोड नहीं हो सकी।';

  @override
  String get aboutRetryButton => 'फिर से प्रयास करें';

  @override
  String get historyTitle => 'हाल का इतिहास';

  @override
  String get historyEmptyState => 'आपके हाल के परिणाम यहाँ दिखेंगे।';

  @override
  String get historyClearButton => 'इतिहास साफ़ करें';

  @override
  String get historyClearDialogTitle => 'इतिहास साफ़ करें?';

  @override
  String get historyClearDialogMessage =>
      'इससे इस डिवाइस से सभी हाल के परिणाम हट जाएंगे। इसे पूर्ववत नहीं किया जा सकता।';

  @override
  String get historyClearDialogCancel => 'रद्द करें';

  @override
  String get historyClearDialogConfirm => 'साफ़ करें';

  @override
  String get historyClearedSnackbar => 'इतिहास साफ़ हो गया।';

  @override
  String get quickTileCoinAdded => 'सिक्का शॉर्टकट पैनल में जोड़ा गया।';

  @override
  String get quickTileCoinAlreadyAdded =>
      'सिक्का शॉर्टकट पहले से ही पैनल में है।';

  @override
  String get quickTileCoinCancelled =>
      'सिक्का शॉर्टकट का अनुरोध रद्द किया गया।';

  @override
  String get quickTileCoinUnsupported =>
      'आपका Android संस्करण ऐप से यह शॉर्टकट नहीं जोड़ सकता।';

  @override
  String get randomnessSheetEyebrow => 'संयोग के पीछे क्या है';

  @override
  String get randomnessSheetTitle =>
      'PRNG, सुरक्षित RNG और भौतिक एंट्रॉपी';

  @override
  String get randomnessCard1Title =>
      'तीन संबंधित, लेकिन अलग अवधारणाएँ';

  @override
  String get randomnessCard1Body =>
      'PRNG बीज और आंतरिक स्थिति से नियतात्मक क्रम बनाता है। यह गेम और सिमुलेशन के लिए उपयोगी है, लेकिन अनुमान से बचाव के लिए नहीं बनाया गया। CSPRNG (अक्सर DRBG के रूप में) आउटपुट का अनुमान कठिन बनाता है और आम तौर पर ऑपरेटिंग सिस्टम की एंट्रॉपी लेता है। भौतिक स्रोत किसी भौतिक प्रक्रिया को मापता है। ये संबंधित, पर अलग अवधारणाएँ हैं।';

  @override
  String get randomnessCard2Title =>
      'यह ऐप क्या उपयोग करता है';

  @override
  String get randomnessCard2Body =>
      'उपलब्ध होने पर ऐप RANDOM.ORG से संख्याएँ माँगता है, जो वायुमंडलीय रेडियो शोर को एंट्रॉपी स्रोत बताता है। अनुरोध से पहले आउटपुट संसाधित और बफ़र हो सकता है; हम इस प्रक्रिया की पुष्टि नहीं करते। ऑफ़लाइन ऐप Dart Random.secure() का उपयोग करता है, यदि सिस्टम सुरक्षित स्रोत देता है। यदि सुरक्षित यादृच्छिकता समर्थित नहीं है, तो यह सामान्य PRNG का उपयोग करता है और इसे क्रिप्टोग्राफ़िक रूप से असुरक्षित बताता है।';

  @override
  String get randomnessCard3Title =>
      'एंट्रॉपी प्रमाण नहीं है';

  @override
  String get randomnessCard3Body =>
      'एंट्रॉपी अनिश्चितता बताती है, किसी परिणाम के निष्पक्ष या स्वतंत्र रूप से सत्यापित होने का प्रमाण नहीं। प्रसंस्करण पक्षपात घटा सकता है, अनुपस्थित एंट्रॉपी बना नहीं सकता। सांख्यिकीय परीक्षण कुछ समस्याएँ पकड़ते हैं, यादृच्छिकता सिद्ध नहीं करते। सुरक्षित जनरेटर को हर मान के लिए नया भौतिक शोर नहीं चाहिए। सीमाबद्ध पूर्णांक API modulo पक्षपात से बचते हैं। सीधे शेषफल से कुछ अंक अधिक आ सकते हैं, यदि सीमा समान रूप से विभाजित न हो; bounded API इस modulo पक्षपात से बचती हैं।';

  @override
  String get randomnessSheetButton => 'समझ गया';

  @override
  String get randomOrgFallbackNotice =>
      'RANDOM.ORG उपलब्ध नहीं है। स्थानीय सुरक्षित RNG (CSPRNG) का उपयोग हो रहा है।';

  @override
  String get secureRandomUnavailableNotice =>
      'RANDOM.ORG उपलब्ध नहीं है और सुरक्षित RNG समर्थित नहीं है। स्थानीय PRNG उपयोग हो रहा है (क्रिप्टोग्राफ़िक रूप से सुरक्षित नहीं)।';
}
