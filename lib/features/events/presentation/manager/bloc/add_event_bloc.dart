import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events_week_admin/core/models/event_model.dart';
import 'package:events_week_admin/features/events/data/repo/events_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

part 'add_event_event.dart';
part 'add_event_state.dart';

class AddEventBloc extends Bloc<AddEventEvent, AddEventState> {
  final EventsRepo _eventsRepo;
  AddEventBloc(this._eventsRepo) : super(AddEventInitial()) {
    on<AddEventEvent>((event, emit) async {
      if (event is AddEvent) {
        emit(AddEventLaoding());
        var id = const Uuid().v4();
        Event e = Event(
          id: id,
          title: event.title,
          description: event.description,
          place: event.place,
          date: Timestamp.fromDate(event.date),
        );
        var result = await _eventsRepo.addEvent(e);
        result.fold((left) {
          emit(AddEventFailure(err: left.errMessage));
        }, (right) {
          emit(AddEventSuccess());
        });
      }
    });
  }
}
