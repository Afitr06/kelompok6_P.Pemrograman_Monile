import 'package:flutter/material.dart';

import '../../models/news.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({
    super.key,
    required this.id,
    required this.news,
  });
  final String id;
  final News news;

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottomOpacity: 0.0,
          elevation: 0.0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.share),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_horiz),
            ),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 325,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    image: DecorationImage(
                      image: NetworkImage(widget.news.banner),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text("bay "),
                        Text(
                          widget.news.author,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.remove_red_eye,
                          size: 16,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text("${widget.news.views}"),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  widget.news.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      color: Colors.blue,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      widget.news.date,
                      style: const TextStyle(color: Colors.blue),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  widget.news.content,
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
        ));
  }
}
