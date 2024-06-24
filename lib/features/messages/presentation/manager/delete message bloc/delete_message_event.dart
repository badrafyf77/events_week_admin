part of 'delete_message_bloc.dart';

sealed class DeleteMessageEvent {}

class DeleteMessage extends DeleteMessageEvent {
  final String id;

  DeleteMessage({required this.id});
}
