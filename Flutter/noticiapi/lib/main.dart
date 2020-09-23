import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:noticiapi/utils/http_helper.dart';

import 'models/noticia.dart';

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
      home: MyHomePage(title: 'CodiGoNoticias'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateFormat fomatoFecha = DateFormat("dd/MM/yy");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: HttpHelper().fetchNoticias(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Noticia> noticias = snapshot.data;
            return Column(
              children: [
                FlatButton(
                    onPressed: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2018, 3, 5),
                          maxTime: DateTime(2019, 6, 7), onChanged: (date) {
                        print('change $date');
                      }, onConfirm: (date) {
                        print('confirm $date');
                      }, currentTime: DateTime.now(), locale: LocaleType.es);
                    },
                    child: Text(
                      'show date time picker (Chinese)',
                      style: TextStyle(color: Colors.blue),
                    )),
                Expanded(
                  child: ListView.builder(
                    itemCount: noticias.length,
                    itemBuilder: (context, index) => Card(
                      child: Row(
                        children: [
                          Image.network(
                            noticias[index].urlToImage,
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    noticias[index].title,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    noticias[index].source.name +
                                        " - " +
                                        fomatoFecha.format(
                                            noticias[index].publishedAt),
                                    textAlign: TextAlign.end,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    noticias[index].description,
                                    textAlign: TextAlign.justify,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(noticias[index].author,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(fontSize: 12)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          HttpHelper().fetchNoticias();
        },
      ),
    );
  }
}
