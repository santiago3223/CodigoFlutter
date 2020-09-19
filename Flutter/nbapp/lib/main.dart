import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nbapp/models/equipo.dart';
import 'package:nbapp/routes/players_team.dart';
import 'package:nbapp/util/httphelper.dart';

void main() {
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

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String imageBaseUrl = "http://loodibee.com/wp-content/uploads/";

  String getImageUrlByName(String name) {
    if (name == "Denver Nuggets")
      return "http://loodibee.com/wp-content/uploads/nba-denver-nuggets-logo-2018-300x300.png";
    if (name == "LA Clippers")
      return "http://loodibee.com/wp-content/uploads/nba-la-clippers-logo-png-300x300.png";
    name = name.replaceAll(" ", "-").toLowerCase();
    name = "nba-$name-logo.png";
    return imageBaseUrl + name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      "https://fsb.zobj.net/crop.php?r=5ffMHZijd77ZhtdvnK8KQSDouWWgul75phyX-GSpysrIxJPzGbPPlqA1Y4s6PAQxGw-IUaKEMwiQ7NYWbi91oIIC7-wxZbaBIctsMqCsC3dnX9_7SF17PA1HLmkROFIFG1Y0qKj_87ssONZ6iYGQNYAXPH_5rvHwlNFhwolZ2szWXe4Zug0DPyd825w",
                    ),
                    fit: BoxFit.fill)),
          ),
          Center(
              child: FutureBuilder<List<Equipo>>(
            future: HttpHelper().fetchEquipos(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CarouselSlider(
                  options: CarouselOptions(height: 500.0),
                  items: (snapshot.data).map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  i.conference + " - " + i.division,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w800),
                                ),
                                Image.network(getImageUrlByName(i.fullName)),
                                Text(
                                  i.abbreviation,
                                  style: TextStyle(
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.w300),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  i.fullName,
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w800),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    RaisedButton(
                                      color: Colors.black,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PlayersPerTeam(),
                                            ));
                                      },
                                      child: Text(
                                        "Jugadores",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    RaisedButton(
                                      color: Colors.black,
                                      onPressed: () {},
                                      child: Text(
                                        "Ultimos partidos",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ));
                      },
                    );
                  }).toList(),
                );
              }
              if (snapshot.hasError)
                return Text(snapshot.error.toString());
              else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
        ],
      ),
    );
  }
}
