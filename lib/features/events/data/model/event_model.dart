import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String id;
  final String title;
  final String description;
  final String place;
  final String downloadUrl;
  final Timestamp date;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.place,
    required this.downloadUrl,
    required this.date,
  });

  Event.fromJson(json)
      : this(
          id: json['id'] as String,
          title: json['title'] as String,
          description: json['description'] as String,
          place: json['place'] as String,
          downloadUrl: json['downloadUrl'] as String,
          date: json['date'] as Timestamp,
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'place': place,
      'downloadUrl': downloadUrl,
      'date': date,
    };
  }
}
