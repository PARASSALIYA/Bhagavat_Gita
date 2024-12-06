import 'package:bhagavat_gita/screen/chapter/provider/provider.dart';
import 'package:bhagavat_gita/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChapterPage extends StatefulWidget {
  const ChapterPage({super.key});

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  @override
  void initState() {
    context.read<ChapterProvider>().chapterData();
    super.initState();
  }

  late ChapterProvider chapterProviderW;
  late ChapterProvider chapterProviderR;

  @override
  Widget build(BuildContext context) {
    chapterProviderW = context.watch<ChapterProvider>();
    chapterProviderR = context.read<ChapterProvider>();
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg_drawer.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Center(
                child: Text(
                  chapterProviderW.isHindi ? 'Bhagavad Geeta' : 'भगवद गीता',
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: Text(
                chapterProviderW.isHindi ? 'Home' : 'घर',
              ),
              onTap: () {
                Navigator.of(context).pushNamed('chapter');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.favorite,
              ),
              title: Text(
                chapterProviderW.isHindi ? 'Favorite' : 'पसंदीदा',
              ),
              onTap: () {
                Navigator.of(context).pushNamed('favorite_screen');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.format_quote,
              ),
              title: Text(
                chapterProviderW.isHindi ? 'Quotes' : 'विचार',
              ),
              onTap: () {
                Navigator.of(context).pushNamed(Routes.quotes);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.language,
              ),
              title: Text(
                chapterProviderW.isHindi ? 'Hindi' : 'English',
              ),
              onTap: () {
                chapterProviderW.onChange();
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.dark_mode_rounded,
              ),
              title: Text(
                chapterProviderW.isTheme ? "Light" : "Dark",
              ),
              onTap: () {
                chapterProviderR.themeChange();
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: const Color(0xffFE8800),
        title: Text(
          chapterProviderW.isHindi ? "Bhagavad Geeta" : "श्रीमद् भगवद गीता",
        ),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == 0) {
                chapterProviderW.isHindi = true;
              }
              if (value == 1) {
                chapterProviderW.isHindi = false;
              }
              if (value == 2) {
                chapterProviderW.isHindi = true;
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () {
                  chapterProviderR.onChange();
                },
                child: const Text("Hindi"),
              ),
              PopupMenuItem(
                onTap: () {
                  chapterProviderR.onChange();
                },
                child: const Text("English"),
              ),
              PopupMenuItem(
                onTap: () {
                  chapterProviderR.onChange();
                },
                child: const Text("Sanskrit"),
              ),
            ],
          ),
        ],
      ),
      body: chapterProviderW.chapterList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: chapterProviderW.chapterList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      chapterProviderR.filterVerseChapterWise(
                          chapterProviderR.chapterList[index].chapterNumber);
                      Navigator.pushNamed(context, 'chapterdetail',
                          arguments: chapterProviderW
                              .chapterList[index].chapterNumber);
                    },
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(
                              chapterProviderW.chapterList[index].img),
                        ),
                        title: Text(chapterProviderW.isHindi
                            ? chapterProviderW.chapterList[index].imageName
                            : chapterProviderW.chapterList[index].name),
                        subtitle: Text(
                          "${chapterProviderW.isHindi ? "Verses" : "श्लोक"}: ${chapterProviderW.chapterList[index].versesCount}",
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
