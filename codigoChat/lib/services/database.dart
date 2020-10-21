import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future addUserInfo(Map user) async {
    _firestore.collection("users").add(user).catchError((e) {
      print(e.toString());
    });
  }

  serachByName(String searchField) {
    return _firestore
        .collection("users")
        .where('userName', isEqualTo: searchField)
        .get();
  }

  Future addChatRoom(chatRoom, chatRoomId) {
    _firestore
        .collection("chatRoom")
        .doc(chatRoomId)
        .set(chatRoom)
        .catchError((e) {
      print(e);
    });
  }

  getUserInfo(String email) async {
    return _firestore
        .collection("users")
        .where("userEmail", isEqualTo: email)
        .get();
  }
}
