import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future singUp(String email, String password) async {
    UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User user = cred.user;
    return user;
  }

  Future logIn(String email, String password) async {
    UserCredential cred = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    User user = cred.user;
    return user;
  }

  Future logOut() async {
    return await _auth.signOut();
  }
}
