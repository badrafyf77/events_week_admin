import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events_week_admin/core/models/message_model.dart';
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
          return Expanded(
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: ListView.builder(
                itemCount: state.messagesList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(height: 15),
                      MessageItem(
                        message: state.messagesList[index],
                      ),
                      if (index == state.messagesList.length - 1)
                        const SizedBox(
                          height: 15,
                        ),
                    ],
                  );
                },
              ),
            ),
          );
        }
        return Expanded(
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                Message message = Message(
                  id: 'id',
                  message:
                      'Aliqua tempor magna non est labore laboris eu ex anim officia dolor adipisicing quis eiusmod. Nulla commodo duis proident aute excepteur in velit. Ipsum dolore ex culpa exercitation dolor sit amet fugiat cillum consectetur proident veniam quis ullamco. Dolor ex velit consequat non sunt veniam non ut nostrud sit adipisicing eu. Exercitation magna reprehenderit do elit.',
                  senderNom: 'senderNom',
                  senderPhone: 'senderPhone',
                  senderEmail: 'senderEmail',
                  isReaded: true,
                  sendAt: Timestamp.now(),
                );
                return Column(
                  children: [
                    const SizedBox(height: 15),
                    Skeletonizer(
                      enabled: true,
                      child: MessageItem(
                        message: message,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
