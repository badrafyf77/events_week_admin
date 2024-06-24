import 'package:firebase_auth/firebase_auth.dart';

class FireauthService {
  final credential = FirebaseAuth.instance;

  Future<bool> signIn(String email, String password) async {
    try {
      await credential.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }

}
