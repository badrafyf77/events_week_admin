import 'package:events_week_admin/features/messages/presentation/manager/get%20messages%20cubit/get_messages_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RefreshMessages extends StatelessWidget {
  const RefreshMessages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: IconButton(
        onPressed: () {
          BlocProvider.of<GetMessagesCubit>(context).getMessages();
        },
        icon: const Icon(Icons.refresh),
      ),
    );
  }
}
