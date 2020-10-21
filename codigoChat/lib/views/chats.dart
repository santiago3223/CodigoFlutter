import 'package:codigoChat/services/database.dart';
import 'package:codigoChat/utils/preferencias.dart';
import 'package:codigoChat/views/search.dart';
import 'package:flutter/material.dart';

import 'chat.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  Stream chats;
  String userName = "";

  getUserChats() async {
    userName = await Preferencias().getUserName();
    FirestoreHelper().getUserChats(userName).then((snapshots) {
      setState(() {
        chats = snapshots;
      });
    });
  }

  @override
  void initState() {
    getUserChats();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: StreamBuilder(
            stream: chats,
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) => ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Chat(snapshot
                                        .data.documents[index]["chatRoomId"]),
                                  ));
                            },
                            title: Text(
                              snapshot.data.documents[index]["chatRoomId"]
                                  .toString()
                                  .replaceAll("_", "")
                                  .replaceAll(userName, ""),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ))
                  : Container();
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Search(),
              ));
        },
      ),
    );
  }
}
