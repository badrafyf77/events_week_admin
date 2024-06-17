import 'package:events_week_admin/features/messages/presentation/manager/get%20messages%20cubit/get_messages_cubit.dart';
import 'package:events_week_admin/features/messages/presentation/views/widgets/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MessagesBody extends StatelessWidget {
  const MessagesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMessagesCubit, GetMessagesState>(
      builder: (context, state) {
        if (state is GetMessagesFailure) {
          return const Center(child: Icon(Icons.error));
        }
        if (state is GetMessagesSuccess) {
          return ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView.builder(
              itemCount: state.messagesList.length,
              itemBuilder: (context, index) {
                return const Column(
                  children: [
                    SizedBox(height: 15),
                    MessageItem(
                      read: true,
                    ),
                  ],
                );
              },
            ),
          );
        }
        return ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return const Column(
                children: [
                  SizedBox(height: 15),
                  Skeletonizer(
                    enabled: true,
                    child: MessageItem(
                      read: true,
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
