import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events_week_admin/core/models/event_model.dart';
import 'package:events_week_admin/core/models/message_model.dart';

class FirestoreService {
  CollectionReference events = FirebaseFirestore.instance.collection('events');
  CollectionReference initialEvent =
      FirebaseFirestore.instance.collection('initialEvent');
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  CollectionReference visits = FirebaseFirestore.instance.collection('visits');

  Future<void> addEvent(Event event) async {
    await events.doc(event.id).set(event.toJson());
  }

  Future<List<Event>> getEvents() async {
    List<Event> eventsList = [];
    await events.orderBy('date', descending: true).get().then((event) {
      for (var doc in event.docs) {
        eventsList.add(Event.fromJson(doc));
      }
    });
    return eventsList;
  }

  Future<void> updateEvent(Event event) async {
    await events.doc(event.id).update(event.toJson());
  }

  Future<void> deleteEvent(String id) async {
    await events.doc(id).delete();
  }

  Future<List<Message>> getMessages() async {
    List<Message> messagesList = [];
    await messages.orderBy('sendAt', descending: true).get().then((event) {
      for (var doc in event.docs) {
        messagesList.add(Message.fromJson(doc));
      }
    });
    return messagesList;
  }

  Future<void> setInitialEvent(Event event) async {
    await initialEvent.doc('Initial_event').set(event.toJson());
  }

  Future<Event> getInitialEvent() async {
    dynamic data;
    Event event;
    await initialEvent
        .doc('Initial_event')
        .get()
        .then<dynamic>((DocumentSnapshot snapshot) async {
      data = snapshot.data();
    });
    event = Event.fromJson(data);
    return event;
  }

  Future<void> changeMessageToReaded(String id) async {
    await messages.doc(id).update({
      'isReaded': true,
    });
  }

  Future<List> getVisitsList(int month, int year) async {
    String id = '$month-$year';
    List v = [];
    var doc = await visits.doc(id).get();
    if (doc.exists) {
      await visits.doc(id).get().then((value) async {
        final docs = value.data()!;
        final data = docs as Map<String, dynamic>;
        v = data['visits'] as List;
      });
      return v;
    }
    return ifNotExistsMonth(month);
  }

  Future<int> countEvents() async {
    AggregateQuerySnapshot query = await events.count().get();
    int i;
    if (query.count != null) {
      i = query.count!;
      return i;
    }
    return 0;
  }

  Future<int> countMessages() async {
    AggregateQuerySnapshot query = await messages.count().get();
    int i;
    if (query.count != null) {
      i = query.count!;
      return i;
    }
    return 0;
  }
}

List ifNotExistsMonth(int month) {
  switch (month) {
    case 1:
    case 3:
    case 5:
    case 7:
    case 8:
    case 10:
    case 12:
      return [
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0
        ];
    case 4:
    case 6:
    case 9:
    case 11:
      return [
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
        ];
    case 2:
      return [
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0
        ];
    default:
      return [];
  }
}
