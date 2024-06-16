import 'package:events_week_admin/features/messages/presentation/views/widgets/message.dart';
import 'package:flutter/material.dart';

class MessagesBody extends StatelessWidget {
  const MessagesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return const Column(
            children: [
              SizedBox(height: 15),
              Message(
                read: true,
              ),
              SizedBox(height: 15),
              Message(
                read: false,
              ),
              SizedBox(height: 15),
              Message(
                read: true,
              ),
              SizedBox(height: 15),
              Message(
                read: true,
              ),
            ],
          );
        },
      ),
    );
  }
}