import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirestoreHelper {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future addUserInfo(Map user) async {
    _firestore.collection("users").add(user).catchError((e) {
      print(e.toString());
    });
  }
}
