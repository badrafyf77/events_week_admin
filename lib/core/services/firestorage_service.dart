import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FirestorageService {
  Reference storageRef = FirebaseStorage.instance.ref();

  Future<String> uploadFile(File file, String fileName) async {
    var metadata = SettableMetadata(
      contentType: "image/jpeg",
    );
    var result = await storageRef.child(fileName).putFile(file, metadata);
    return await result.ref.getDownloadURL();
  }
}
