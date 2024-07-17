import 'package:events_week_admin/features/events/data/model/event_model.dart';
import 'package:events_week_admin/features/events/data/repo/events_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'set_initial_event_event.dart';
part 'set_initial_event_state.dart';

class SetInitialEventBloc
    extends Bloc<SetInitialEventEvent, SetInitialEventState> {
  final EventsRepo _eventsRepo;
  SetInitialEventBloc(this._eventsRepo) : super(SetInitialEventInitial()) {
    on<SetInitialEventEvent>((event, emit) async {
      if (event is SetInitialEvent) {
        emit(SetInitialEventLaoding());
        var result = await _eventsRepo.setInitialEvent(event.event);
        result.fold((left) {
          emit(SetInitialEventFailure(err: left.errMessage));
        }, (right) {
          emit(SetInitialEventSuccess(msg: 'hbewidnj'));
        });
      }
    });
  }
}
