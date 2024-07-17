import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String id;
  final String message;
  final String senderNom;
  final String senderPhone;
  final String senderEmail;
  final bool isReaded;
  final Timestamp sendAt;

  Message({
    required this.id,
    required this.message,
    required this.senderNom,
    required this.senderPhone,
    required this.senderEmail,
    required this.isReaded,
    required this.sendAt,
  });

  Message.fromJson(json)
      : this(
          id: json['id'] as String,
          message: json['message'] as String,
          senderNom: json['senderNom'] as String,
          senderPhone: json['senderPhone'] as String,
          senderEmail: json['senderEmail'] as String,
          isReaded: json['isReaded'] as bool,
          sendAt: json['sendAt'] as Timestamp,
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'message': message,
      'senderNom': senderNom,
      'senderPhone': senderPhone,
      'senderEmail': senderEmail,
      'isReaded': isReaded,
      'sendAt': sendAt,
    };
  }
}
