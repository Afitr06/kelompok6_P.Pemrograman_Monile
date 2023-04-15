class News {
  int id, views;
  String title, author, banner, date, content;

  News(
      {required this.id,
      required this.views,
      required this.title,
      required this.author,
      required this.banner,
      required this.date,
      required this.content});
}

List<News> newsList = [
  News(
    id: 0,
    views: 109,
    title: " Si Friendly Mudah Bergaul tapi Kok Susah Dapat Pacar?",
    author: "Haya Aulia",
    banner:
        "https://cdn1-production-images-kly.akamaized.net/M6532R_t7q2FkmHVhcvxler26pE=/0x844:1323x1589/640x360/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2990588/original/088647200_1575869508-woman-4292182_1920.jpg",
    date: "12 Okt 2022, 13:11 WIB",
    content:
        'etiap manusia memiliki sikap yang berbeda, mulai dari ramah, jutek, peduli hingga bodo amatan. Sikap ini terbentuk dari pengalaman dan lingkungan sekitar.',
  ),
  News(
      id: 1,
      views: 200,
      title: "Gempa 4 Kali Getarkan Indonesia Hari Ini Sabtu 15 April 2023",
      author: "luputan 6",
      banner:
          "https://cdn1-production-images-kly.akamaized.net/T9KeVFKgYbRoYwDzUKtIxOsXlxY=/640x358/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/4318739/original/058011500_1675927741-WhatsApp_Image_2023-02-09_at_14.14.30.jpeg",
      date: "16 April 2023",
      content:
          'Gempa terkini mengguncang Bengkulu Selatan. Lindu tersebut dilaporkan BMKG bermagnitudo 6,2 dengan pusat gempa berada di laut dengan kedalaman 23 kilometer.'),
];
