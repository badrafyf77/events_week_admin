import 'package:events_week_admin/features/messages/data/repo/messages_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'delete_message_event.dart';
part 'delete_message_state.dart';

class DeleteMessageBloc extends Bloc<DeleteMessageEvent, DeleteMessageState> {
  final MessagesRepo _messagesRepo;
  DeleteMessageBloc(this._messagesRepo) : super(DeleteMessageInitial()) {
    on<DeleteMessageEvent>((event, emit) async {
      if (event is DeleteMessage) {
        emit(DeleteMessageLoading());
        var result = await _messagesRepo.deleteMessage(event.id);
        result.fold((left) {
          emit(DeleteMessageFailure(err: left.errMessage));
        }, (right) {
          emit(DeleteMessageSuccess());
        });
      }
    });
  }
}
