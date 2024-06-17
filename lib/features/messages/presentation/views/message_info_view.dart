import 'package:events_week_admin/features/messages/presentation/views/widgets/message_info_body.dart';
import 'package:events_week_admin/features/messages/presentation/views/widgets/navigate_back_icon.dart';
import 'package:flutter/material.dart';

class MessageInfoView extends StatelessWidget {
  const MessageInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          NavigateBackIcon(),
          MessageInfoBody(),
        ],
      ),
    );
  }
}

