import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events_week_admin/core/models/event_model.dart';

class FirestoreService {
  CollectionReference events = FirebaseFirestore.instance.collection('events');

  Future<void> addEvent(Event event) async {
    await events.doc(event.id).set(event.toJson());
  }

  Future<List<Event>> getEvents() async {
    List<Event> eventsList = [];
    await events.get().then((event) {
      for (var doc in event.docs) {
        eventsList.add(Event.fromJson(doc));
      }
    });
    return eventsList;
  }
}
