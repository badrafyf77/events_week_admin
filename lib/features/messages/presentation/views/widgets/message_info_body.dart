import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:events_week_admin/core/models/message_model.dart';
import 'package:events_week_admin/core/utils/styles.dart';
import 'package:flutter/material.dart';

class MessageInfoBody extends StatelessWidget {
  const MessageInfoBody({
    super.key, required this.message,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${message.senderNom} - ${message.senderEmail}\n${message.senderPhone}',
                    style: Styles.normal14.copyWith(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    BoardDateFormat('yyyy/MM/dd HH:mm').format(message.sendAt.toDate()),
                    style: Styles.normal14.copyWith(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              const Spacer(
                flex: 2,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  message.message,
                  style: Styles.normal16,
                  textAlign: TextAlign.justify,
                ),
              ),
              const Spacer(
                flex: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
