import 'package:cloud_firestore/cloud_firestore.dart';

class Gallery {
  final String id;
  final String title;
  final Timestamp date;
  final String downloadUrl;
  final int height;
  final int width;

  Gallery({
    required this.id,
    required this.title,
    required this.date,
    required this.downloadUrl,
    required this.height,
    required this.width,
  });

  Gallery.fromJson(json)
      : this(
          id: json['id'] as String,
          title: json['title'] as String,
          date: json['date'] as Timestamp,
          downloadUrl: json['downloadUrl'] as String,
          height: json['height'] as int,
          width: json['width'] as int,
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'downloadUrl': downloadUrl,
      'height': height,
      'width': width,
    };
  }
}