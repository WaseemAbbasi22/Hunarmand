import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/group_screen/components/category_selector.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/group_screen/components/favorite_contacts.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/group_screen/components/recent_chat.dart';
import 'package:flutter/material.dart';

class GroupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: deepOrangeColor,
        appBar: AppBar(
          backgroundColor: deepOrangeColor,
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back),
          //   iconSize: 20.0,
          //   color: Colors.white,
          //   onPressed: () {},
          // ),
          title: Text(
            "Group Chats",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          //elevation: 0.0,
        ),
        body: Column(
          children: <Widget>[
            CategorySelector(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )),
                child: Column(
                  children: <Widget>[
                    FavoriteContacts(),
                    RecentChats(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
