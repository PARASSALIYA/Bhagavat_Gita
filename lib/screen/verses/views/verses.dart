import 'package:bhagavat_gita/model/verses_model.dart';
import 'package:bhagavat_gita/screen/chapter/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VersesPage extends StatefulWidget {
  const VersesPage({super.key});

  @override
  State<VersesPage> createState() => _VersesPageState();
}

class _VersesPageState extends State<VersesPage> {
  @override
  Widget build(BuildContext context) {
    int arguments = ModalRoute.of(context)?.settings.arguments as int;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://i.pinimg.com/736x/21/6e/9f/216e9f6ca05f03c7a9030d400932ecc2.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          PageView.builder(
            controller: PageController(
              initialPage: arguments,
            ),
            itemCount: context.read<ChapterProvider>().selectedVerse.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        height: 400,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  onPressed: () {
                                    context.read<ChapterProvider>().speak(
                                          context
                                                  .read<ChapterProvider>()
                                                  .isHindi
                                              ? "${context.read<ChapterProvider>().selectedVerse[index].transliteration}"
                                              : "${context.read<ChapterProvider>().selectedVerse[index].text}",
                                        );
                                  },
                                  icon: const Icon(
                                    Icons.volume_up,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Text(
                                context.watch<ChapterProvider>().isHindi
                                    ? "${context.read<ChapterProvider>().selectedVerse[index].transliteration}"
                                    : "${context.read<ChapterProvider>().selectedVerse[index].text}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
