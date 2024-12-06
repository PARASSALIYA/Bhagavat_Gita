import 'package:bhagavat_gita/model/chapter_model.dart';
import 'package:bhagavat_gita/model/verses_model.dart';

class Arguments {
  int chapterInt;
  int verseInt;
  VerseModel verse = VerseModel();

  Arguments(this.chapterInt, this.verseInt, this.verse);
}
