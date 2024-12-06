import 'package:bhagavat_gita/helper/arguments.dart';
import 'package:bhagavat_gita/model/verses_model.dart';
import 'package:bhagavat_gita/screen/chapter/provider/provider.dart';
import 'package:bhagavat_gita/utils/routes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChapterDetailPage extends StatefulWidget {
  const ChapterDetailPage({super.key});

  @override
  State<ChapterDetailPage> createState() => _ChapterDetailPageState();
}

class _ChapterDetailPageState extends State<ChapterDetailPage> {
  @override
  void initState() {
    context.read<ChapterProvider>().chapterVerseData();
    super.initState();
  }

  late ChapterProvider chapterProviderW;
  late ChapterProvider chapterProviderR;
  @override
  Widget build(BuildContext context) {
    chapterProviderW = context.watch<ChapterProvider>();
    chapterProviderR = context.read<ChapterProvider>();

    int chapterInt = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        backgroundColor: const Color(0xffFE8800),
        title: Text(
          chapterProviderW.isHindi
              ? chapterProviderW.chapterList[chapterInt].imageName
              : chapterProviderW.chapterList[chapterInt].name,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 250,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    chapterProviderR.changeIndex(index);
                  },
                ),
                items: chapterProviderW.images[chapterInt]
                    .map(
                      (e) => Container(
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(e),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: DotsIndicator(
                  dotsCount: chapterProviderW.images[chapterInt].length,
                  position: chapterProviderW.currentIndex,
                  decorator: const DotsDecorator(
                    activeColor: Color(0xffFE8800),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                chapterProviderW.isHindi
                    ? chapterProviderW.chapterList[chapterInt].imageName
                    : chapterProviderW.chapterList[chapterInt].name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                chapterProviderW.isHindi
                    ? chapterProviderW.chapterList[chapterInt].chapterSummary
                    : chapterProviderW
                        .chapterList[chapterInt].chapterSummaryHindi,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                chapterProviderW.isHindi ? "Verses" : "श्लोक",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: chapterProviderW.selectedVerse.length,
                (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.verses,
                            arguments: index,
                          );
                        },
                        child: Card(
                          child: ListTile(
                            title: Text(
                              chapterProviderW.isHindi
                                  ? "${chapterProviderW.selectedVerse[index].title}"
                                  : "श्लोक ${index + 1}",
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
