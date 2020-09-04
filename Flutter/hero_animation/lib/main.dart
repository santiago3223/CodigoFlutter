import 'package:flutter/material.dart';

import 'page2.dart';

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
      home: Page1(),
    );
  }
}

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int _currentIndex = 0;
  List _listPages = List();
  Widget _currentPage;
  GlobalKey<NavigatorState> navigatorkey = GlobalKey();

  List<String> rutas = ["/", "/birthday", "/calendar", "/alarm"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero animation"),
      ),
      body: Navigator(
        key: navigatorkey,
        initialRoute: '/',
        onGenerateRoute: (settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case "/":
              builder = (context) => Home();
              break;
            case "/birthday":
              builder = (context) => Birthday();
              break;
            case "/calendar":
              builder = (context) => Calendar();
              break;
            case "/alarm":
              builder = (context) => Alarm();
              break;
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text("Cumpleaños"),
            icon: Icon(Icons.cake),
          ),
          BottomNavigationBarItem(
            title: Text("Calendario"),
            icon: Icon(Icons.calendar_today),
          ),
          BottomNavigationBarItem(
            title: Text("Alarma"),
            icon: Icon(Icons.alarm),
          ),
        ],
        onTap: (index) {
          navigatorkey.currentState.pushNamed(rutas[index]);
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Hero(
        tag: "etiquetaIcono",
        child: Icon(
          Icons.home,
          color: Colors.green,
          size: 40,
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (c) => Page2()));
      },
    );
  }
}

class Birthday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(Icons.cake),
    );
  }
}

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(Icons.calendar_today),
    );
  }
}

class Alarm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(Icons.alarm),
    );
  }
}
