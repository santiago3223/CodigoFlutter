import 'package:flutter/material.dart';
import 'package:miloficios_app/providers/user_provider.dart';
import 'package:miloficios_app/views/listar_categorias.dart';
import 'package:provider/provider.dart';
import 'views/login.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<UserProvider>(context, listen: false).token == null)
      Provider.of<UserProvider>(context, listen: false).fetchUserData();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: (Provider.of<UserProvider>(context).token != null &&
              Provider.of<UserProvider>(context).token.length > 0)
          ? Categorias()
          : Login(),
    );
  }
}
