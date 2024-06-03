// ignore_for_file: public_member_api_docs, sort_constructors_first

class Article {
  final String title;
  final String imageUrl;
  final String source;
  final String sourceUrl;
  final String date;
  Article({
    required this.title,
    required this.imageUrl,
    required this.source,
    required this.sourceUrl,
    required this.date,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] as String,
      imageUrl: json['urlToImage'] as String,
      source: json['author'] as String,
      sourceUrl: json['url'] as String,
      date: json['publishedAt'] as String,
    );
  }
}
