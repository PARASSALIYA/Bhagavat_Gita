import 'package:bhagavat_gita/helper/chapter_helper.dart';
import 'package:bhagavat_gita/model/chapter_model.dart';
import 'package:bhagavat_gita/model/verses_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ChapterProvider extends ChangeNotifier {
  List<VerseModel> allVerse = [];
  List<VerseModel> selectedVerse = [];
  List<VerseModel> allChVerse = [];
  List<ChapterModel> chapterList = [];
  int currentIndex = 0;

  Future<void> chapterData() async {
    ChapterHelper chapterHelper = ChapterHelper();
    chapterList = await chapterHelper.jsonChapterData();
    notifyListeners();
  }

  addChapter(int index, int chIndex) {
    if (index == chIndex) {
      allChVerse.add(allVerse[index]);
    }
    notifyListeners();
  }

  void filterVerseChapterWise(int no) {
    selectedVerse = allVerse
        .where(
          (element) => element.chapterNumber == no,
        )
        .toList();
    notifyListeners();
  }

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  Future<void> chapterVerseData() async {
    ChapterHelper chapterHelper = ChapterHelper();
    allVerse = await chapterHelper.jsonVerseData();
    notifyListeners();
  }

  FlutterTts flutterTts = FlutterTts();

  void speak(String text) async {
    await flutterTts.speak(text);
    notifyListeners();
  }

  void stop() async {
    await flutterTts.stop();
    notifyListeners();
  }

  List<List> images = [
    [
      "assets/images/ch_1(1).jpg",
      "assets/images/ch_1(2).jpg",
      "assets/images/ch_1(3).jpg",
    ],
    [
      "assets/images/ch_2(1).jpg",
      "assets/images/ch_2(2).jpg",
      "assets/images/ch_2(3).jpg",
    ],
    [
      "assets/images/ch_3(1).jpg",
      "assets/images/ch_3(2).jpg",
      "assets/images/ch_6(3).jpg",
    ],
    [
      "assets/images/ch_4(1).jpg",
      "assets/images/ch_4(2).jpg",
      "assets/images/ch_4(3).jpg",
    ],
    [
      "assets/images/ch_5(1).jpg",
      "assets/images/ch_5(2).jpg",
      "assets/images/ch_5(3).jpg",
    ],
    [
      "assets/images/ch_6(1).jpg",
      "assets/images/ch_6(2).jpg",
      "assets/images/ch_6(3).jpg",
    ],
    [
      "assets/images/ch_7(1).jpg",
      "assets/images/ch_7(2).jpg",
      "assets/images/ch_2(2).jpg",
    ],
    [
      "assets/images/ch_8(1).jpg",
      "assets/images/ch_8(2).jpg",
      "assets/images/ch_8(3).jpg",
    ],
    [
      "assets/images/ch_9(1).jpg",
      "assets/images/ch_9(2).jpg",
      "assets/images/ch_9(3).jpg",
    ],
    [
      "assets/images/ch_10(1).jpg",
      "assets/images/ch_10(2).jpg",
      "assets/images/ch_10(3).jpg",
    ],
    [
      "assets/images/ch_11(1).jpg",
      "assets/images/ch_11(2).jpg",
      "assets/images/ch_11(3).jpg",
    ],
    [
      "assets/images/ch_12(1).jpg",
      "assets/images/ch_12(2).jpg",
      "assets/images/ch_12(3).jpg",
      "assets/images/ch_12(4).jpg",
    ],
    [
      "assets/images/ch_13(1).jpg",
      "assets/images/ch_13(2).jpg",
      "assets/images/ch_13(3).jpg",
    ],
    [
      "assets/images/ch_14(1).jpg",
      "assets/images/ch_14(2).jpg",
      "assets/images/ch_14(3).jpg",
    ],
    [
      "assets/images/ch_15(1).jpg",
      "assets/images/ch_15(2).jpg",
    ],
    [
      "assets/images/ch_16(1).jpg",
      "assets/images/ch_16(2).jpg",
      "assets/images/ch_16(3).jpg",
    ],
    [
      "assets/images/ch_17(1).jpg",
      "assets/images/ch_17(2).jpg",
      "assets/images/ch_17(3).jpg",
    ],
    [
      "assets/images/ch_18(1).jpg",
      "assets/images/ch_18(2).jpg",
      "assets/images/ch_18(3).jpg",
    ],
  ];
  bool isHindi = false;

  onChange() {
    isHindi = !isHindi;
    notifyListeners();
  }

  bool isTheme = false;
  void themeChange() {
    isTheme = !isTheme;
    ChapterHelper.chapterHelper.setTheme(isTheme);
    notifyListeners();
  }

  void checkTheme() async {
    bool? theme = await ChapterHelper.chapterHelper.getTheme();
    isTheme = theme ?? false;
    notifyListeners();
  }

  List<String> allQuotesHindi = [
    'आत्मा कभी जन्म नहीं लेती, एक बार अस्तित्व में आने के बाद वह कभी मरती नहीं, वह कभी समाप्त नहीं होती। अजन्मा, शाश्वत, स्थायी और आदिम, यह शरीर के मारे जाने पर नहीं मारा जाता..!!',
    'जन्म लेने वाले की मृत्यु निश्चित है, और मृत्यु के लिए पुनर्जन्म निश्चित है; इसलिए जो अपरिहार्य है उसके लिए आपको दुःख महसूस नहीं करना चाहिए..!!',
    'आपको अपने निर्धारित कर्तव्य निभाने का अधिकार है, लेकिन आप अपने कर्मों के फल के हकदार नहीं हैं..!!',
    'हथियार आत्मा को काटते नहीं, अग्नि जलाती नहीं, जल गीला नहीं करता और पंख सुखाते नहीं..!!',
    'हे अर्जुन, मैं भूत, वर्तमान और भविष्य को जानता हूं और सभी प्राणियों को भी जानता हूं; लेकिन मेरे बारे में कोई नहीं जानता..!!',
    'काम, क्रोध और लोभ, ये आत्म-विनाशकारी नरक के तीन द्वार हैं। अत: इनसे बचना चाहिए..!!',
    'जो लोग खाने और मनोरंजन में अनुशासित, काम में संतुलित और नींद में संयमित हैं, वे योगाभ्यास द्वारा सभी दुखों को कम कर सकते हैं..!!',
    'क्रोध से भ्रम उत्पन्न होता है; भ्रम से, स्मृति की हानि; स्मृति के नष्ट होने से, विवेक के नष्ट होने से; और विवेक के नाश से वह नष्ट हो जाता है..!!',
    'मर जाओ, और तुम स्वर्ग जीतोगे; जीतो, और तुम पृथ्वी की संप्रभुता का आनंद लोगे, इसलिए, लड़ने के लिए दृढ़ संकल्पित होकर खड़े हो जाओ अर्जुन..!!'
        'तुम्हें अकेले काम करने का अधिकार है, फल का नहीं। कर्म के फल से प्रभावित न हों. न ही अकर्मण्यता में आसक्ति है..!!',
  ];

  List<String> allQuotes = [
    'The soul is never born, it never dies having come into being once, it never ceases to be. Unborn, eternal, abiding and primeval, it is not slain when the body is slain..!!',
    'Death is certain for the born, and re-birth is certain for the death; therefore you should not feel grief for what is inevitable..!!',
    'You have a right to perform your prescribed duties, but you are not entitled to the fruits of your actions..!!',
    'Weapons do not cleave the soul, fire does not burn it, waters do not wet it, and wing does not dry it..!!',
    'O Arjun, I know of past, present, and future, and I also know all living beings; but no one knows about me..!!',
    'Lust, anger and greed, these are the three doors to self-destructive hell. Thus, one should avoid these..!!',
    'Those who are disciplined in eating and recreation, balanced in work, and regulated in sleep, can mitigate all sorrows by practicing Yoga..!!',
    'From anger there comes delusion; from delusion, the loss of memory; from the loss of memory, the destruction of discrimination; and with the destruction of discrimination, he is lost..!!',
    'Die, and you will win heaven; conquer, and you will enjoy sovereignty of the earth, therefore, stand up Arjuna, determined to fight..!!'
        'To work alone you have the right, and not to the fruits. Do not be impelled by the fruits of work. Nor have attachment to inaction..!!',
  ];
}
