part of 'delete_message_bloc.dart';

sealed class DeleteMessageState {}

final class DeleteMessageInitial extends DeleteMessageState {}

final class DeleteMessageLoading extends DeleteMessageState {}

final class DeleteMessageSuccess extends DeleteMessageState {}

final class DeleteMessageFailure extends DeleteMessageState {
  final String err;

  DeleteMessageFailure({required this.err});
}
