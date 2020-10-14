import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<String> signUp(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);

    return userCredential.user.uid;
  }

  Future<String> logIn(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);

    return userCredential.user.uid;
  }

  User getUser() {
    User user = firebaseAuth.currentUser;
    return user;
  }

  Future signOut() async {
    return firebaseAuth.signOut();
  }
}
