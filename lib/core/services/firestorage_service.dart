import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FireStorageService {
  Reference storageRef = FirebaseStorage.instance.ref();

  Future<void> uploadFile(File file, String fileName) async {
    var metadata = SettableMetadata(
      contentType: "image/jpeg",
    );
    await storageRef.child(fileName).putFile(file, metadata);
  }
}
