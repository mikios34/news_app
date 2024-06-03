// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      title: map['title'] as String,
      imageUrl: map['imageUrl'] as String,
      source: map['source'] as String,
      sourceUrl: map['sourceUrl'] as String,
      date: map['date'] as String,
    );
  }

  factory Article.fromJson(String source) =>
      Article.fromMap(json.decode(source) as Map<String, dynamic>);
}
