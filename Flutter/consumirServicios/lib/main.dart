import 'package:flutter/material.dart';

import 'create_user.dart';
import 'get_user.dart';
import 'list_users.dart';
import 'put_user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PutUser(),
    );
  }
}
