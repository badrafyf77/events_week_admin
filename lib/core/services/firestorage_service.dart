import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';

class FirestorageService {
  Reference storageRef = FirebaseStorage.instance.ref();

  Future<String> uploadFile(File file, String fileName) async {
    var result = await storageRef.child(fileName).putFile(file);
    return await result.ref.getDownloadURL();
  }

  Future<String> updateFile(String oldfileName, String newfileName) async {
    Uint8List? file = await storageRef.child(oldfileName).getData();
    await deleteFile(oldfileName);
    var result = await storageRef.child(newfileName).putData(file!);
    return await result.ref.getDownloadURL();
  }

  Future<void> deleteFile(String fileName) async {
    await storageRef.child(fileName).delete();
  }
}
