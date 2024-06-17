import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events_week_admin/core/models/event_model.dart';
import 'package:events_week_admin/core/models/message_model.dart';

class FirestoreService {
  CollectionReference events = FirebaseFirestore.instance.collection('events');
  CollectionReference initialEvent =
      FirebaseFirestore.instance.collection('initialEvent');
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

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
