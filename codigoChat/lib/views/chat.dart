import 'package:codigoChat/services/database.dart';
import 'package:codigoChat/utils/preferencias.dart';
import 'package:codigoChat/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  String chatRoomId;

  Chat(this.chatRoomId);
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  Stream chats;
  String userName;
  TextEditingController messageController = TextEditingController();

  getMessages() async {
    userName = await Preferencias().getUserName();
    chats = await FirestoreHelper().getMessages(widget.chatRoomId);
    setState(() {
      chats = chats;
    });
  }

  sendMessage() {
    Map<String, dynamic> mensaje = {
      "sendBy": userName,
      "message": messageController.text.toString(),
      "time": DateTime.now().millisecondsSinceEpoch
    };
    FirestoreHelper().addMessage(widget.chatRoomId, mensaje);

    setState(() {
      messageController.text = "";
    });
  }

  @override
  void initState() {
    getMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCodigo(context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
                child: Container(
              child: StreamBuilder(
                  stream: chats,
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? ListView.builder(
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) => getMessageTile(
                                snapshot.data.documents[index]["message"],
                                snapshot.data.documents[index]["sendBy"]))
                        : Container();
                  }),
            )),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    style: TextStyle(color: Colors.white),
                    decoration: textFieldInputDecoration("email"),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      sendMessage();
                    })
              ],
            ),
            SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }

  Widget getMessageTile(String message, String user) {
    bool isMine = user == userName;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
          top: 8, bottom: 8, left: isMine ? 48 : 0, right: isMine ? 0 : 48),
      child: Container(
        padding: EdgeInsets.all(8),
        color: isMine ? Colors.blue.shade200 : Colors.blue.shade400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              user,
              textAlign: isMine ? TextAlign.right : TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
            Text(
              message,
              textAlign: isMine ? TextAlign.right : TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
