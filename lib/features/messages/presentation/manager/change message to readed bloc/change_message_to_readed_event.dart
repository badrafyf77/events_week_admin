part of 'change_message_to_readed_bloc.dart';

@immutable
abstract class ChangeMessageToReadedEvent {}

final class ChangeMessageToReaded extends ChangeMessageToReadedEvent {
  final String id;

  ChangeMessageToReaded({required this.id});
}
