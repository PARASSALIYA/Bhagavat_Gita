class VerseModel {
  int? chapterId;
  int? chapterNumber;
  int? externalId;
  int? id;
  String? text;
  String? title;
  int? verseNumber;
  int? verseOrder;
  String? transliteration;
  String? wordMeanings;

  VerseModel({
    this.chapterId,
    this.chapterNumber,
    this.externalId,
    this.id,
    this.text,
    this.title,
    this.verseNumber,
    this.verseOrder,
    this.transliteration,
    this.wordMeanings,
  });

  factory VerseModel.mapToModel(Map data) {
    return VerseModel(
      chapterId: data['chapter_id'],
      chapterNumber: data['chapter_number'],
      externalId: data['externalId'],
      id: data['id'],
      text: data['text'],
      title: data['title'],
      verseNumber: data['verse_number'],
      verseOrder: data['verse_order'],
      transliteration: data['transliteration'],
      wordMeanings: data['word_meanings'],
    );
  }
}
