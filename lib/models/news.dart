class News {
  int id, likeCount;
  String title, author, banner, date, desc;

  News(
      {required this.id,
      required this.likeCount,
      required this.title,
      required this.author,
      required this.banner,
      required this.date,
      required this.desc});
}

var newsList = [
  News(
      id: 01,
      likeCount: 300,
      title: "title",
      author: "author",
      banner: "banner",
      date: "date",
      desc: "desc"
    ),
];
