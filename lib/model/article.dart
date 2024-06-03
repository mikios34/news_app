// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Arthicle {
  final String title;
  final String imageUrl;
  final String source;
  final String sourceUrl;
  final String date;
  Arthicle({
    required this.title,
    required this.imageUrl,
    required this.source,
    required this.sourceUrl,
    required this.date,
  });

  factory Arthicle.fromMap(Map<String, dynamic> map) {
    return Arthicle(
      title: map['title'] as String,
      imageUrl: map['imageUrl'] as String,
      source: map['source'] as String,
      sourceUrl: map['sourceUrl'] as String,
      date: map['date'] as String,
    );
  }

  factory Arthicle.fromJson(String source) =>
      Arthicle.fromMap(json.decode(source) as Map<String, dynamic>);
}
