import 'package:shared_preferences/shared_preferences.dart';

class Preferencias {
  Future saveUserName(String userName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString("USERNAME", userName);
  }

  Future saveEmail(String email) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString("EMAIL", email);
  }

  Future saveLogInState(bool isLogedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool("LOGEDIN", isLogedIn);
  }

  Future<String> getUserName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString("USERNAME");
  }

  Future<String> getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString("EMAIL");
  }

  Future<bool> getLogInState() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool("LOGEDIN");
  }
}
