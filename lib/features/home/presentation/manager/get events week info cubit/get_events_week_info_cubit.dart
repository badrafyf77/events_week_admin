import 'package:events_week_admin/features/home/data/model/events_week_info.dart';
import 'package:events_week_admin/features/home/data/repo/home_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'get_events_week_info_state.dart';

class EventsWeekInfoCubit extends Cubit<EventsWeekInfoState> {
  final HomeRepo _homeRepo;
  EventsWeekInfoCubit(this._homeRepo) : super(EventsWeekInfoInitial());

  Future<void> getEventsWeekInfo() async {
    emit(EventsWeekInfoLoading());
    var result = await _homeRepo.getEventsWeekInfo();
    result.fold((left) {
      emit(EventsWeekInfoFailure(err: left.errMessage));
    }, (right) {
      emit(EventsWeekInfoSuccess(eventsWeekInfo: right));
    });
  }
}
