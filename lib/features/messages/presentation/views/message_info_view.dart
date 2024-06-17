import 'package:events_week_admin/core/models/message_model.dart';
import 'package:events_week_admin/features/messages/presentation/views/widgets/message_info_body.dart';
import 'package:events_week_admin/features/messages/presentation/views/widgets/navigate_back_icon.dart';
import 'package:flutter/material.dart';

class MessageInfoView extends StatelessWidget {
  const MessageInfoView({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const NavigateBackIcon(),
          MessageInfoBody(
            message: message,
          ),
        ],
      ),
    );
  }
}
