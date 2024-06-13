import 'package:events_week_admin/core/models/event_model.dart';
import 'package:events_week_admin/features/events/data/repo/events_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_events_state.dart';

class GetEventsCubit extends Cubit<GetEventsState> {
  final EventsRepo _eventsRepo;
  GetEventsCubit(this._eventsRepo) : super(GetEventsInitial());

  Future<void> getEventsCubit() async {
    emit(GetEventsLoading());
    var result = await _eventsRepo.getEventsInfo();
    result.fold((left) {
      emit(GetEventsFailure(err: left.errMessage));
    }, (right) {
      emit(GetEventsSuccess(eventsInfo: right));
    });
  }
}
