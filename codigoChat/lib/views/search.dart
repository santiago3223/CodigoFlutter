import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codigoChat/services/database.dart';
import 'package:codigoChat/utils/datos_usuario.dart';
import 'package:codigoChat/utils/preferencias.dart';
import 'package:codigoChat/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  FirestoreHelper firestore = FirestoreHelper();
  QuerySnapshot resultados;
  TextEditingController searchController = TextEditingController();

  buscarContacto() async {
    firestore.serachByName(searchController.text).then((snapshot) {
      print(snapshot.docs.toString());
      setState(() {
        resultados = snapshot;
      });
    });
  }

  enviarMensaje(String receptor) async {
    String usr = await Preferencias().getUserName();
    String chatRoomId = "$usr\_$receptor";
    Map<String, dynamic> chatRoom = {
      "users": [usr, receptor],
      "chatRoomId": chatRoomId,
    };

    firestore.addChatRoom(chatRoom, chatRoomId);
    print(receptor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCodigo(context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: searchController,
                  style: TextStyle(color: Colors.white),
                  decoration: textFieldInputDecoration("username"),
                )),
                IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      buscarContacto();
                    })
              ],
            ),
            Expanded(
              child: (resultados == null)
                  ? Container()
                  : ListView.builder(
                      itemCount: resultados.docs.length,
                      itemBuilder: (context, index) => ListTile(
                        onTap: () {
                          enviarMensaje(resultados.docs[index]["userName"]);
                        },
                        title: Text(
                          resultados.docs[index]["userName"],
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        subtitle: Text(
                          resultados.docs[index]["userEmail"],
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
