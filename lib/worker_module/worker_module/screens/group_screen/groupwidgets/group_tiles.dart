import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/group_screen/chat_screen.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/group_screen/chat_screencopy.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/group_screen/pages/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:Hunarmand_signIn_Ui/controllers/group_provider.dart';
import 'package:provider/provider.dart';

class GroupTile extends StatefulWidget {
  final String userName;
  final String groupId;
  final String groupName;

  GroupTile({this.userName, this.groupId, this.groupName});

  @override
  _GroupTileState createState() => _GroupTileState();
}

class _GroupTileState extends State<GroupTile> {
  @override
  Widget build(BuildContext context) {
    final gprovider = Provider.of<GroupProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        gprovider.changeicon = widget.groupId;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatScreenCopy(
                      groupId: widget.groupId,
                      userName: widget.userName,
                      groupName: widget.groupName,
                    )));
        // ChatScreen()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30.0,
            backgroundColor: Colors.deepOrange,
            child: Text(widget.groupName.substring(0, 1).toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white)),
          ),
          title: Text(widget.groupName,
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text("created by ${widget.userName}",
              style: TextStyle(fontSize: 13.0)),
        ),
      ),
    );
  }
}
