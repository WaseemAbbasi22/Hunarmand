import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/group_screen/groupwidgets/message_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Hunarmand_signIn_Ui/controllers/group_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:Hunarmand_signIn_Ui/Models/group_modle.dart';

class ChatPage extends StatefulWidget {
  final String groupId;
  final String userName;
  final String groupName;

  ChatPage({this.groupId, this.userName, this.groupName});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController messageEditingController = new TextEditingController();

  _sendMessage(GroupProvider provider) {
    if (messageEditingController.text.isNotEmpty) {
      provider.changemessagebody = messageEditingController.text;
      provider.changemessagesender = widget.userName;
      DateTime now = DateTime.now();
      String formattedTime = DateFormat.jm().format(now);
      provider.changemessagetime = formattedTime;
      print('group id is');
      print(widget.groupId);
      print(provider.groupid);
      provider.savemessage();
      // Map<String, dynamic> chatMessageMap = {
      //   "message": messageEditingController.text,
      //   "sender": widget.userName,
      //   'time': DateTime.now().millisecondsSinceEpoch,
      // };

      // GroupDatabaseService().sendMessage(widget.groupId, chatMessageMap);

      setState(() {
        messageEditingController.text = "";
      });
    }
  }

  // @override
  // void initState() {
  //   final groupprovider = Provider.of<GroupProvider>(context, listen: false);
  //   groupprovider.changegroupid = widget.groupId;
  //   print('group id in init state is ');
  //   groupprovider.groupid;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final groupprovider = Provider.of<GroupProvider>(context, listen: false);

    // setState(() {
    //   groupprovider.changegroupid = widget.groupId;
    //   print('widget group id is');
    //   print(widget.groupId);
    //   print('group id under build methos is');
    //   print(groupprovider.groupid);
    // });

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.groupName, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        elevation: 5.0,
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            _chatMessages(groupprovider),
            // Container(),
            Container(
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                color: Colors.grey[700],
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: messageEditingController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: "Send a message ...",
                            hintStyle: TextStyle(
                              color: Colors.white38,
                              fontSize: 16,
                            ),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(width: 12.0),
                    GestureDetector(
                      onTap: () {
                        _sendMessage(groupprovider);
                      },
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                            child: Icon(Icons.send, color: Colors.white)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _chatMessages(GroupProvider groupProvider) {
    // final gprovider = Provider.of<GroupProvider>(context, listen: false);
    // gprovider.changeicon = widget.groupId;
    print('group icon is');
    print(groupProvider.groupicon);
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('groups')
          .doc(widget.groupId)
          .collection('message')
          .orderBy('time')
          .snapshots(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot chatData = snapshot.data.docs[index];
                  return MessageTile(
                    message: chatData['message'],
                    sender: chatData['sender'],
                    sentByMe: widget.userName == chatData['sender'],
                  );
                })
            : Container(
                child: Text('no text yet'),
              );
      },
    );
  }
}
