import 'package:bhagavat_gita/screen/chapter/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({super.key});

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://i.pinimg.com/736x/ea/d9/4f/ead94f728c6606d2a796abed102a4c20.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                padding: const EdgeInsets.only(
                  left: 30,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                ),
              ),
              const SizedBox(
                width: 95,
              ),
              Center(
                child: Text(
                  context.watch<ChapterProvider>().isHindi ? "Quotes" : "विचार",
                  style: const TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: context.read<ChapterProvider>().allQuotes.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      context.read<ChapterProvider>().isHindi
                          ? context.read<ChapterProvider>().allQuotes[index]
                          : context
                              .read<ChapterProvider>()
                              .allQuotesHindi[index],
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
