import 'package:events_week_admin/features/home/data/home_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'count_events_state.dart';

class CountEventsCubit extends Cubit<CountEventsState> {
  final HomeRepo _homeRepo;
  CountEventsCubit(this._homeRepo) : super(CountEventsInitial());

  Future<void> countEvents() async {
    emit(CountEventsLoading());
    var result = await _homeRepo.countEvents();
    result.fold((left) {
      emit(CountEventsFailure(err: left.errMessage));
    }, (right) {
      emit(CountEventsSuccess(eventsNumber: right));
    });
  }
}
