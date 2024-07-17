import 'package:events_week_admin/core/config/router.dart';
import 'package:events_week_admin/features/messages/data/model/message_model.dart';
import 'package:events_week_admin/core/utils/helpers/show_toast.dart';
import 'package:events_week_admin/features/messages/presentation/manager/change%20message%20to%20readed%20bloc/change_message_to_readed_bloc.dart';
import 'package:events_week_admin/features/messages/presentation/views/widgets/message_info_body.dart';
import 'package:events_week_admin/features/messages/presentation/views/widgets/navigate_back_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageInfoView extends StatefulWidget {
  const MessageInfoView({super.key, required this.message});

  final Message message;

  @override
  State<MessageInfoView> createState() => _MessageInfoViewState();
}

class _MessageInfoViewState extends State<MessageInfoView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChangeMessageToReadedBloc>(context).add(
      ChangeMessageToReaded(id: widget.message.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangeMessageToReadedBloc, ChangeMessageToReadedState>(
      listener: (context, state) {
        if (state is ChangeMessageToReadedFailure) {
          myShowToastError(context, state.err);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            NavigateBackIcon(
              title: 'Informations d\'un Message',
              onPressed: () {
                AppRouter.navigateTo(context, AppRouter.messages);
              },
            ),
            MessageInfoBody(
              message: widget.message,
            ),
          ],
        ),
      ),
    );
  }
}
