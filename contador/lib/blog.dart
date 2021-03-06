import 'package:flutter/material.dart';

class PaginaTabs extends StatelessWidget {
  final List<String> titulos = [
    "How to seem like you always have your shot together",
    "Does Dry is January Actually improve your health",
    "Yo do hire a designer to make something. Yuo hire them"
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        appBarTheme: AppBarTheme(
            color: Colors.white,
            textTheme: TextTheme(
              headline6: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            iconTheme: IconThemeData(color: Colors.black)),
      ),
      child: DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Categories"),
            leading: Icon(Icons.category),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              )
            ],
            bottom: TabBar(
              isScrollable: true,
              labelColor: Colors.pink,
              indicatorColor: Colors.pink,
              unselectedLabelColor: Colors.black,
              tabs: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Tab1",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Tab1",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Tab1",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Tab1",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Tab1",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Tab1",
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            ListView.builder(
                itemCount: titulos.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Container(
                      color: Colors.white,
                      child: Stack(
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            color: Colors.pink.shade50,
                          ),
                          Container(
                            margin: EdgeInsets.all(16),
                            padding: EdgeInsets.all(16),
                            color: Colors.white,
                            child: Container(
                              color: Colors.white,
                              child: Row(
                                children: [
                                  Container(
                                    height: 90,
                                    width: 80,
                                    child: Image.network(
                                      "https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/food%2Fmeal.jpg?alt=media",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          titulos[index],
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text.rich(TextSpan(children: [
                                          WidgetSpan(
                                              child: CircleAvatar(
                                            backgroundColor:
                                                Colors.pink.shade300,
                                            radius: 15,
                                          )),
                                          WidgetSpan(
                                              child: SizedBox(
                                            width: 5,
                                          )),
                                          TextSpan(
                                              text: "Jhon Vino",
                                              style: TextStyle(fontSize: 16)),
                                          WidgetSpan(
                                              child: SizedBox(
                                            width: 15,
                                          )),
                                          TextSpan(
                                            text: "4 min read ",
                                          )
                                        ])),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
            Text("Tab2"),
            Text("Tab3"),
            Text("Tab4"),
            Text("Tab5"),
            Text("Tab6"),
          ]),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.red,
            selectedItemColor: Colors.amber,
            currentIndex: 1,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                title: Text(""),
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                title: Text(""),
                icon: Icon(Icons.folder),
              ),
              BottomNavigationBarItem(
                title: Text(""),
                icon: Icon(Icons.favorite),
              ),
              BottomNavigationBarItem(
                title: Text(""),
                icon: Icon(Icons.portrait),
              ),
              BottomNavigationBarItem(
                title: Text(""),
                icon: Icon(Icons.settings),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
