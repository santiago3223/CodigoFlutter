import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  String token;
  String username;
  String email;
  String first_name;
  String last_name;
  String dni;

  fetchUserData() async {
    this.token = token;
    var prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    if (token == null) token = "";
    username = prefs.getString("username");
    email = prefs.getString("email");
    first_name = prefs.getString("first_name");
    last_name = prefs.getString("last_name");
    dni = prefs.getString("dni");
    notifyListeners();
  }

  saveUserData(String token) async {
    this.token = token;
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
    notifyListeners();
  }

  saveUserProfile(String username, String email, String first_name,
      String last_name, String dni) async {
    this.username = username;
    this.email = email;
    this.first_name = first_name;
    this.last_name = last_name;
    this.dni = dni;
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("username", username);
    prefs.setString("email", email);
    prefs.setString("first_name", first_name);
    prefs.setString("last_name", last_name);
    prefs.setString("dni", dni);
    notifyListeners();
  }
}
