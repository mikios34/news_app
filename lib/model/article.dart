// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class Article extends Equatable {
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
      title: json['title'] ?? "",
      imageUrl: json['urlToImage'] ?? "",
      source: (json['author'] ?? ""),
      sourceUrl: json['url'] ?? "",
      date: json['publishedAt'] ?? "",
    );
  }

  @override
  List<Object?> get props => [title];
}
