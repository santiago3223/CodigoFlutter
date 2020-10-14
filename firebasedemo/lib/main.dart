import 'package:firebase_core/firebase_core.dart';
import 'package:firebasedemo/route/events_route.dart';
import 'package:firebasedemo/route/signup_route.dart';
import 'package:firebasedemo/utils/authentication.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Authentication auth = Authentication();
    if (auth.getUser() != null) {
      return EventsRoute();
    } else {
      return SingUpRoute();
    }
  }
}
