import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Orientation or = MediaQuery.of(context).orientation;
    print(or);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text("Demo orientacion"),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text("Pagina 1"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Pagina 2"),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("demo orientacion"),
      ),
      body: Container(
        child: Column(
          children: [
            or == Orientation.landscape
                ? Row(
                    children: [Icon(Icons.ac_unit), Icon(Icons.ac_unit)],
                  )
                : Icon(Icons.ac_unit),
            Container(
              width: or == Orientation.landscape ? 200 : 100,
              height: 100,
              color: Colors.amber,
            ),
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: or == Orientation.landscape ? 10 : 3),
                itemBuilder: (context, indice) {
                  return Text("item");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
