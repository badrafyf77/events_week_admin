import 'package:cloud_firestore/cloud_firestore.dart';

class Gallery {
  final String id;
  final String title;
  final Timestamp date;
  final String downloadUrl;

  Gallery({
    required this.id,
    required this.title,
    required this.date,
    required this.downloadUrl,
  });

  Gallery.fromJson(json)
      : this(
          id: json['id'] as String,
          title: json['title'] as String,
          date: json['date'] as Timestamp,
          downloadUrl: json['downloadUrl'] as String,
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'downloadUrl': downloadUrl,
    };
  }
}