import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pertemuan_v/models/news.dart';

import '../../../../configs/app_routes.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.size,
    required this.news,
  });

  final Size size;
  final News news;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              8,
            ),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                spreadRadius: 1,
                color: Colors.black12,
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              GoRouter.of(context).goNamed(
                AppRoutes.newsDetail,
                params: {
                  "id": news.id.toString(),
                },
                extra: news,
              );
            },
            child: Row(
              children: [
                SizedBox(
                  width: size.width * 0.25,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Image.network(news.banner, fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                        return const Text('not image');
                      }),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          news.title,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "by ${news.author} - ${news.date}",
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
      ],
    );
  }
}

class NewsFragment extends StatelessWidget {
  const NewsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Masukkan kata kunci disini",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    suffixIcon: const Icon(
                      Icons.search_rounded,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: newsList
                        .map((news) => NewsCard(size: size, news: news))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
