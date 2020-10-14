import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasedemo/models/event.dart';
import 'package:firebasedemo/models/favourite.dart';

class FirestoreHelper {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future addFavourite(String evento, String user) {
    Favourite fav = Favourite(null, evento, user);
    var result = db
        .collection("favourites")
        .add(fav.toMap())
        .then((value) => print(value))
        .catchError((error) => print(error));
    return result;
  }
}
