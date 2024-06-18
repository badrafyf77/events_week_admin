part of 'delete_event_bloc.dart';

sealed class DeleteEventEvent {}

class DeleteEvent extends DeleteEventEvent {
  final Event event;

  DeleteEvent({required this.event});
}
