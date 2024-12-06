import 'package:bhagavat_gita/screen/chapter/provider/provider.dart';
import 'package:bhagavat_gita/screen/chapter/views/chapter.dart';
import 'package:bhagavat_gita/screen/chapterdetail/views/chapterdetail_page.dart';
import 'package:bhagavat_gita/screen/quotes/views/quotes_page.dart';
import 'package:bhagavat_gita/screen/splash/views/splash_page.dart';
import 'package:bhagavat_gita/screen/verses/views/verses.dart';
import 'package:bhagavat_gita/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const BhagavadGita(),
  );
}

class BhagavadGita extends StatelessWidget {
  const BhagavadGita({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ChapterProvider()..checkTheme(),
        ),
      ],
      child: Consumer<ChapterProvider>(
        builder: (BuildContext context, value, Widget? child) => MaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: value.isTheme ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          routes: {
            Routes.splash: (context) => const SplashPage(),
            Routes.chapter: (context) => const ChapterPage(),
            Routes.detail: (context) => const ChapterDetailPage(),
            Routes.verses: (context) => const VersesPage(),
            Routes.quotes: (context) => const QuotesPage(),
          },
        ),
      ),
    );
  }
}
