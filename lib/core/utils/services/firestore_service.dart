import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events_week_admin/features/events/data/model/event_model.dart';
import 'package:events_week_admin/features/gallery/data/model/gallery_model.dart';
import 'package:events_week_admin/features/messages/data/model/message_model.dart';
import 'package:events_week_admin/features/activities/data/model/activity_model.dart';

class FirestoreService {
  CollectionReference events = FirebaseFirestore.instance.collection('events');
  CollectionReference initialEvent =
      FirebaseFirestore.instance.collection('initialEvent');
  CollectionReference activities =
      FirebaseFirestore.instance.collection('activities');
      CollectionReference galleries =
      FirebaseFirestore.instance.collection('galleries');
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

  Future<void> addActivity(Activity activity) async {
    await activities.doc(activity.id).set(activity.toJson());
  }

  Future<List<Activity>> getActivities() async {
    List<Activity> activitiesList = [];
    await activities.get().then((activity) {
      for (var doc in activity.docs) {
        activitiesList.add(Activity.fromJson(doc));
      }
    });
    return activitiesList;
  }

  Future<void> updateActivity(Activity activity) async {
    await activities.doc(activity.id).update(activity.toJson());
  }

  Future<void> deleteActivity(Activity activity) async {
    await activities.doc(activity.id).delete();
  }

  Future<void> addGallery(Gallery gallery) async {
    await galleries.doc(gallery.id).set(gallery.toJson());
  }

  Future<List<Gallery>> getGalleries() async {
    List<Gallery> galleriesList = [];
    await galleries.get().then((gallery) {
      for (var doc in gallery.docs) {
        galleriesList.add(Gallery.fromJson(doc));
      }
    });
    return galleriesList;
  }

  Future<void> updateGallery(Gallery gallery) async {
    await galleries.doc(gallery.id).update(gallery.toJson());
  }

  Future<void> deleteGallery(Gallery gallery) async {
    await galleries.doc(gallery.id).delete();
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

  Future<void> deleteMessage(String id) async {
    await messages.doc(id).delete();
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
    return [];
  }

  Future<int> getTodayVisits() async {
    int year = DateTime.now().year;
    int month = DateTime.now().month;
    int day = DateTime.now().day;
    String id = '$month-$year';
    List v = [];
    var doc = await visits.doc(id).get();
    if (doc.exists) {
      await visits.doc(id).get().then((value) async {
        final docs = value.data()!;
        final data = docs as Map<String, dynamic>;
        v = data['visits'] as List;
      });
      return v[day - 1];
    }
    return 0;
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
