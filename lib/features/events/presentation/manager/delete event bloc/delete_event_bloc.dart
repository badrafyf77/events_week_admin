import 'package:events_week_admin/core/models/event_model.dart';
import 'package:events_week_admin/features/events/data/repo/events_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'delete_event_event.dart';
part 'delete_event_state.dart';

class DeleteEventBloc extends Bloc<DeleteEventEvent, DeleteEventState> {
  final EventsRepo _eventsRepo;
  DeleteEventBloc(this._eventsRepo) : super(DeleteEventInitial()) {
    on<DeleteEventEvent>((event, emit) async {
      if (event is DeleteEvent) {
        emit(DeleteEventLoading());
        var result = await _eventsRepo.deleteEvent(event.event);
        result.fold((left) {
          emit(DeleteEventFailure(err: left.errMessage));
        }, (right) {
          emit(DeleteEventSuccess(msg: 'Événement supprimer avec succes'));
        });
      }
    });
  }
}
