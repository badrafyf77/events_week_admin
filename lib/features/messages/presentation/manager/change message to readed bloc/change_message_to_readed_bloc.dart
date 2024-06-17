import 'package:events_week_admin/features/messages/data/repo/messages_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_message_to_readed_event.dart';
part 'change_message_to_readed_state.dart';

class ChangeMessageToReadedBloc
    extends Bloc<ChangeMessageToReadedEvent, ChangeMessageToReadedState> {
  final MessagesRepo _messagesRepo;
  ChangeMessageToReadedBloc(this._messagesRepo)
      : super(ChangeMessageToReadedInitial()) {
    on<ChangeMessageToReadedEvent>((event, emit) async {
      if (event is ChangeMessageToReaded) {
        emit(ChangeMessageToReadedLoading());
        var result = await _messagesRepo.changeMessageToReaded(event.id);
        result.fold((left) {
          emit(ChangeMessageToReadedFailure(err: left.errMessage));
        }, (right) {
          emit(ChangeMessageToReadedSuccess());
        });
      }
    });
  }
}
