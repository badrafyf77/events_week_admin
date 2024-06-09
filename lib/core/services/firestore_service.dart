import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events_week_admin/core/models/event_model.dart';

class FirestoreService {
  CollectionReference users = FirebaseFirestore.instance.collection('events');

  Future<void> addEvent(Event event) async {
    await users.doc(event.id).set(event.toJson());
  }

  // Future<UserInformation> getUser(String email) async {
  //   dynamic data;
  //   UserInformation user;
  //   final DocumentReference document = users.doc(email);
  //   await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
  //     data = snapshot.data();
  //   });
  //   user = UserInformation.fromJson(data);
  //   return user;
  // }

  // List<Message> getMessages() {
  //   List<Message> messagesList = [];
  //   users
  //       .doc(FirebaseAuth.instance.currentUser!.email!)
  //       .collection('messages')
  //       .orderBy('createdAt', descending: true)
  //       .snapshots()
  //       .listen((event) {
  //     for (var doc in event.docs) {
  //       messagesList.add(Message.fromJson(doc));
  //     }
  //   });
  //   return messagesList;
  // }
}
