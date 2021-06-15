import 'package:Hunarmand_signIn_Ui/Models/group_modle.dart';
import 'package:Hunarmand_signIn_Ui/Service/auth.dart';
import 'package:Hunarmand_signIn_Ui/Service/groupmanagement_services/group_dbservice.dart';
import 'package:Hunarmand_signIn_Ui/controllers/group_provider.dart';
import 'package:Hunarmand_signIn_Ui/helper/helper_function.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/group_screen/groupwidgets/group_tiles.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/group_screen/pages/create_groups.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/group_screen/pages/profile_page.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/group_screen/pages/search_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // data
  final AuthService _auth = AuthService();
  User _user;
  String _groupName;
  String _userName = '';
  String _email = '';
  Stream _groups;

  // initState
  @override
  void initState() {
    super.initState();
    _getUserAuthAndJoinedGroups();
  }

  // widgets
  Widget noGroupWidget(GroupProvider groupProvider) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  // _popupDialog(context, groupProvider);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CreateGroup()));
                },
                child: Icon(Icons.add_circle,
                    color: Colors.grey[700], size: 75.0)),
            SizedBox(height: 20.0),
            Text(
                "You've not joined any group, tap on the 'add' icon to create a group or search for groups by tapping on the search button below."),
          ],
        ));
  }

  Widget groupsList(GroupProvider groupProvider) {
    return StreamBuilder<List<Groups>>(
      stream: groupProvider.groups,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            // print(snapshot.data['groups'].length);
            if (snapshot.data.length != 0) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    // int reqIndex = snapshot.data.length - index - 1;
                    return GroupTile(
                        userName: snapshot.data[index].admin,
                        groupId: snapshot.data[index].groupId,
                        groupName:
                            _destructureName(snapshot.data[index].title));
                  });
            } else {
              return noGroupWidget(groupProvider);
            }
          } else {
            return noGroupWidget(groupProvider);
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  // functions
  _getUserAuthAndJoinedGroups() async {
    _user = FirebaseAuth.instance.currentUser;
    await HelperFunctions.getUserNameSharedPreference().then((value) {
      setState(() {
        _userName = _user.displayName;
      });
    });
    GroupDatabaseService(uid: _user.uid).getUserGroups().then((snapshots) {
      print(snapshots);
      setState(() {
        _groups = snapshots;
      });
    });
    await HelperFunctions.getUserEmailSharedPreference().then((value) {
      setState(() {
        _email = value;
      });
    });
  }

  String _destructureId(String res) {
    // print(res.substring(0, res.indexOf('_')));
    return res.substring(0, res.indexOf('_'));
  }

  String _destructureName(String res) {
    // print(res.substring(res.indexOf('_') + 1));
    return res.substring(res.indexOf('_') + 1);
  }

  void _popupDialog(BuildContext context, GroupProvider groupProvider) {
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget createButton = FlatButton(
      child: Text("Create"),
      onPressed: () async {
        if (_groupName != null) {
          // await HelperFunctions.getUserNameSharedPreference().then((val) {
          // });

          groupProvider.changeadmin = _userName;
          groupProvider.changetitle = _groupName;
          groupProvider.savegroup();
          // .createGroup(_userName, _groupName);

          Navigator.of(context).pop();
        }
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Create a group"),
      content: TextField(
          onChanged: (val) {
            setState(() {
              _groupName = val;
            });
          },
          style: TextStyle(fontSize: 15.0, height: 2.0, color: Colors.black)),
      actions: [
        cancelButton,
        createButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  // Building the HomePage widget
  @override
  Widget build(BuildContext context) {
    final groupprovider = Provider.of<GroupProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Groups',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        elevation: 5.0,
        actions: <Widget>[
          IconButton(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              icon: Icon(Icons.search, color: Colors.white, size: 25.0),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SearchPage()));
              })
        ],
      ),

      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.symmetric(vertical: 50.0),
      //     children: <Widget>[
      //       Icon(Icons.account_circle, size: 150.0, color: Colors.grey[700]),
      //       SizedBox(height: 15.0),
      //       Text(_userName,
      //           textAlign: TextAlign.center,
      //           style: TextStyle(fontWeight: FontWeight.bold)),
      //       SizedBox(height: 7.0),
      //       ListTile(
      //         onTap: () {},
      //         selected: true,
      //         contentPadding:
      //             EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      //         leading: Icon(Icons.group),
      //         title: Text('Groups'),
      //       ),
      //       ListTile(
      //         onTap: () {
      //           Navigator.of(context).pushReplacement(MaterialPageRoute(
      //               builder: (context) =>
      //                   ProfilePage(userName: _userName, email: _email)));
      //         },
      //         contentPadding:
      //             EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      //         leading: Icon(Icons.account_circle),
      //         title: Text('Profile'),
      //       ),
      //       ListTile(
      //         // onTap: () async {
      //         //   await _auth.signOut();
      //         //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => AuthenticatePage()), (Route<dynamic> route) => false);
      //         // },
      //         contentPadding:
      //             EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      //         leading: Icon(Icons.exit_to_app, color: Colors.red),
      //         title: Text('Log Out', style: TextStyle(color: Colors.red)),
      //       ),
      //     ],
      //   ),
      // ),
      body: groupsList(groupprovider),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CreateGroup()));
        },
        child: Icon(Icons.add, color: Colors.white, size: 30.0),
        backgroundColor: Colors.deepOrange,
        elevation: 0.0,
      ),
    );
  }
}
