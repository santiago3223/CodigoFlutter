import 'package:demomapas/dbHelper.dart';
import 'package:demomapas/manage_places.dart';
import 'package:demomapas/place.dart';
import 'package:demomapas/place_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
      home: MainMap(),
    );
  }
}

class MainMap extends StatefulWidget {
  @override
  _MainMapState createState() => _MainMapState();
}

class _MainMapState extends State<MainMap> {
  CameraPosition position =
      CameraPosition(target: LatLng(-16.3540115, -71.554834), zoom: 12);
  List<Marker> markers = [];
  List<Place> places = [];
  DbHelper dbHelper;

  Future _getCurrentLocation() async {
    bool isGeolocationAvailable = await Geolocator.isLocationServiceEnabled();
    Position _position = Position(
        latitude: this.position.target.latitude,
        longitude: this.position.target.longitude);

    if (isGeolocationAvailable) {
      _position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    }
    return _position;
  }

  void addMarker(Position pos, String markerId, String markerTitle) {
    Marker marker = Marker(
        markerId: MarkerId(markerId),
        position: LatLng(pos.latitude, pos.longitude),
        infoWindow: InfoWindow(title: markerTitle));
    markers.add(marker);
  }

  Future _getData() async {
    await dbHelper.openDb();
    places = await dbHelper.getPlaces();

    print("Got ${places.length} places");
    for (Place p in places) {
      print("Place " + Position(latitude: p.lat, longitude: p.lon).toString());

      addMarker(
          Position(latitude: p.lat, longitude: p.lon), p.id.toString(), p.name);
    }
    setState(() {
      markers = markers;
    });
  }

  @override
  void initState() {
    _getCurrentLocation().then((value) {
      print(value.toString());
      addMarker(value, "currpos", "Usted esta aqui");
      setState(() {
        position =
            CameraPosition(target: LatLng(value.latitude, value.longitude));
      });
    });
    dbHelper = DbHelper();
    //  dbHelper.insertTestData();
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Codigo mapa"),
        actions: [
          IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ManagePlaces(),
                    ));
              })
        ],
      ),
      body: Container(
        child: GoogleMap(
          onTap: (argument) async {
            PlaceDialog pd = PlaceDialog(
                Place(0, "", argument.latitude, argument.longitude, ""), true);
            await showDialog(
              context: context,
              builder: (context) => pd.buildAlert(context),
            );
            _getData();
          },
          initialCameraPosition: position,
          markers: Set<Marker>.of(markers),
        ),
      ),
    );
  }
}
