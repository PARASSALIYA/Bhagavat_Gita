import 'dart:convert';
import 'package:bhagavat_gita/model/chapter_model.dart';
import 'package:bhagavat_gita/model/verses_model.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChapterHelper {
  static ChapterHelper chapterHelper = ChapterHelper();
  Future<List<ChapterModel>> jsonChapterData() async {
    String jsonChapter =
        await rootBundle.loadString('assets/json/chapters.json');
    List json = await jsonDecode(jsonChapter);

    List<ChapterModel> jsonChapterList =
        json.map((e) => ChapterModel.mapToModel(e)).toList();

    return jsonChapterList;
  }

  Future<List<VerseModel>> jsonVerseData() async {
    String jsonVerse = await rootBundle.loadString('assets/json/verses.json');
    List json = await jsonDecode(jsonVerse);

    List<VerseModel> jsonVerseList =
        json.map((e) => VerseModel.mapToModel(e)).toList();
    return jsonVerseList;
  }

  Future<void> setTheme(bool theme) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setBool("theme", theme);
  }

  Future<bool?> getTheme() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    bool? theme = shr.getBool("theme");
    return theme;
  }
}
