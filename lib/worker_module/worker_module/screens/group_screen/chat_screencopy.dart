import 'package:Hunarmand_signIn_Ui/Service/groupmanagement_services/group_dbservice.dart';
import 'package:Hunarmand_signIn_Ui/controllers/worker_provider.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/group_screen/pages/addmembes_page.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/group_screen/pages/create_groups.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/group_screen/pages/home_page.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/group_screen/pages/show_groupmembers.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/group_screen/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Hunarmand_signIn_Ui/controllers/group_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';

class ChatScreenCopy extends StatefulWidget {
  final String groupId;
  final String userName;
  final String groupName;
  ChatScreenCopy({this.groupId, this.userName, this.groupName});

  @override
  _ChatScreenCopyState createState() => _ChatScreenCopyState();
}

class _ChatScreenCopyState extends State<ChatScreenCopy> {
  List<dynamic> groupmember = [];

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

  void showmembers() async {
    GroupDatabaseService groupDatabaseService = GroupDatabaseService();
    groupmember = await groupDatabaseService.getgroupmemberid(widget.groupId);
    print(groupmember.length);
  }

  @override
  void initState() {
    // final groupprovider = Provider.of<GroupProvider>(context, listen: false);
    //groupprovider.changegroupid = widget.groupid;
    showmembers();
    super.initState();
  }

  _buildMessage({String message, String sender, String time, bool isMe}) {
    final Container msg = Container(
      width: MediaQuery.of(context).size.width * 0.35,
      margin: isMe
          ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 150.0)
          : EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
            ),
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ),
      decoration: BoxDecoration(
        color: isMe ? Colors.grey[200] : Color(0xFFFFEFEE),
        borderRadius: isMe
            ? BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              )
            : BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            message,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
    // if (isMe) {
    //   return msg;
    // }
    return Row(
      children: [
        msg,
        SizedBox(
          width: 5.0,
        ),
        SafeArea(
          child: Text(
            time,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
          // child: IconButton(
          //     icon: message.islinked
          //         ? Icon(Icons.favorite)
          //         : Icon(Icons.favorite_border),
          //     color: message.islinked ? deepOrangeColor : Colors.blueGrey,
          //     //iconSize: 30.0,
          // onPressed: () {}),
        )
      ],
    );
  }

  _buildMessageComposer(GroupProvider groupProvider) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      color: Colors.white,
      height: 70.0,
      child: Row(
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.photo,
                color: deepOrangeColor,
                size: 25.0,
              ),
              onPressed: () {}),
          Expanded(
            child: TextField(
              controller: messageEditingController,
              textCapitalization: TextCapitalization.sentences,
              decoration:
                  InputDecoration.collapsed(hintText: 'Send message....'),
            ),
          ),
          IconButton(
              icon: Icon(
                Icons.send,
                color: deepOrangeColor,
                size: 25.0,
              ),
              onPressed: () {
                _sendMessage(groupProvider);
              }),
        ],
      ),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShowMemberPage(
                      groupid: widget.groupId,
                      groupname: widget.groupName,
                      members: memberlist,
                    )));
        break;
      case 1:
        final groupprovider =
            Provider.of<GroupProvider>(context, listen: false);
        groupprovider.removegroup(widget.groupId);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final groupprovider = Provider.of<GroupProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: deepOrangeColor,
        title: Text(
          widget.groupName,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 5.0,
        actions: [
          PopupMenuButton<int>(
            color: Colors.white,
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 0,
                child: Text('Participants'),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Text('Delete Group'),
              ),
              // PopupMenuDivider(),
              // PopupMenuItem<int>(
              //   value: 2,
              //   child: Row(
              //     children: [
              //       Icon(Icons.logout),
              //       const SizedBox(width: 8),
              //       Text('Sign Out'),
              //     ],
              //   ),
              // ),
            ],
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[150],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      )),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    child: _chatMessages(groupprovider),
                    // child: StreamBuilder(
                    //     stream: null,
                    //     builder: (context, snapshot) {
                    //       return ListView.builder(
                    //         padding: EdgeInsets.only(top: 15.0),
                    //         itemCount: messages.length,
                    //         itemBuilder: (BuildContext context, int index) {
                    //           final Message message = messages[index];
                    //           final bool isMe =
                    //               message.sender.id == currentuser.id;
                    //           return _buildMessage(message, isMe);
                    //         },
                    //       );
                    //     }),
                  ),
                ),
              ),
              _buildMessageComposer(groupprovider),
            ],
          ),
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
                  return _buildMessage(
                    message: chatData['message'],
                    sender: chatData['sender'],
                    isMe: widget.userName == chatData['sender'],
                    time: chatData['time'],
                  );
                })
            : Loading();
      },
    );
  }
}
