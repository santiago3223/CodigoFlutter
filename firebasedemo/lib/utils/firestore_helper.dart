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

  Future<List<Favourite>> getUserFavourites(String uid) async {
    List<Favourite> favs = [];
    var colection = await db.collection("favourites").get();
    if (colection != null) {
      favs = colection.docs.map((e) => Favourite.fromMap(e)).toList();
    }
    return favs;
  }

  Future deleteFavourite(String favId) async {
    await db.collection('favourites').doc(favId).delete();
  }
}
