import 'package:events_week_admin/core/utils/helpers/show_toast.dart';
import 'package:events_week_admin/features/messages/presentation/manager/delete%20message%20bloc/delete_message_bloc.dart';
import 'package:events_week_admin/features/messages/presentation/manager/get%20messages%20cubit/get_messages_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteMessageIcon extends StatelessWidget {
  const DeleteMessageIcon({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteMessageBloc, DeleteMessageState>(
      listener: (context, state) {
        if (state is DeleteMessageFailure) {
          myShowToastError(context, state.err);
        }
        if (state is DeleteMessageSuccess) {
          myShowToastSuccess(context, 'supprimer le message avec succès');
          BlocProvider.of<GetMessagesCubit>(context).getMessages();
        }
      },
      child: IconButton(
        onPressed: () {
          BlocProvider.of<DeleteMessageBloc>(context)
              .add(DeleteMessage(id: id));
        },
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
    );
  }
}
