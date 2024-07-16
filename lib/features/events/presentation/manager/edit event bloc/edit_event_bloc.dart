import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events_week_admin/core/models/event_model.dart';
import 'package:events_week_admin/features/events/data/repo/events_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'edit_event_event.dart';
part 'edit_event_state.dart';

class EditEventBloc extends Bloc<EditEventEvent, EditEventState> {
  final EventsRepo _eventsRepo;
  EditEventBloc(this._eventsRepo) : super(EditEventInitial()) {
    on<EditEventEvent>((event, emit) async {
      if (event is EditEvent) {
        emit(EditEventLoading());
        Event e = Event(
          id: event.id,
          title: event.title,
          description: event.description,
          place: event.place,
          downloadUrl: event.downloadUrl,
          date: Timestamp.fromDate(event.date),
        );
        var result =
            await _eventsRepo.updateEvent(e,event.oldTitle, event.oldImage, event.image);
        result.fold((left) {
          emit(EditEventFailure(err: left.errMessage));
        }, (right) {
          emit(EditEventSuccess(msg: 'Événement éditer avec succès'));
        });
      }
    });
  }
}
