import 'package:events_week_admin/features/events/data/model/event_model.dart';
import 'package:events_week_admin/features/events/presentation/manager/delete%20event%20bloc/delete_event_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteEventIconButton extends StatelessWidget {
  const DeleteEventIconButton({
    super.key,
    required this.event,
  });

  final Event event;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          BlocProvider.of<DeleteEventBloc>(context)
              .add(DeleteEvent(event: event));
        },
        icon: const Icon(
          Icons.delete,
          size: 22,
          color: Colors.white,
        ),
      ),
    );
  }
}