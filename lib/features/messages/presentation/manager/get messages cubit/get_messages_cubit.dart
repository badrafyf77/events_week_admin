import 'package:events_week_admin/core/models/message_model.dart';
import 'package:events_week_admin/features/messages/data/repo/messages_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_messages_state.dart';

class GetMessagesCubit extends Cubit<GetMessagesState> {
  final MessagesRepo _messagesRepo;
  GetMessagesCubit(this._messagesRepo) : super(GetMessagesInitial());

  Future<void> getMessages() async {
    emit(GetMessagesLoading());
    var result = await _messagesRepo.getMessages();
    result.fold((left) {
      emit(GetMessagesFailure(err: left.errMessage));
    }, (right) {
      emit(GetMessagesSuccess(messagesList: right));
    });
  }
}
