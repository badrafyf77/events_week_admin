part of 'change_message_to_readed_bloc.dart';

@immutable
abstract class ChangeMessageToReadedState {}

final class ChangeMessageToReadedInitial extends ChangeMessageToReadedState {}

final class ChangeMessageToReadedLoading extends ChangeMessageToReadedState {}

final class ChangeMessageToReadedSuccess extends ChangeMessageToReadedState {}

final class ChangeMessageToReadedFailure extends ChangeMessageToReadedState {
  final String err;

  ChangeMessageToReadedFailure({required this.err});
}
