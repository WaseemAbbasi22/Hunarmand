import 'package:Hunarmand_signIn_Ui/Screens/authenticate/components/input_card.dart';
import 'package:Hunarmand_signIn_Ui/Service/auth.dart';
import 'package:Hunarmand_signIn_Ui/controllers/group_provider.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/models/chatmodel.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/group_screen/pages/addmembes_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateGroup extends StatefulWidget {
  final String groupid;

  CreateGroup({this.groupid});

  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final AuthService _auth = AuthService();
  User _user;
  String _groupName;
  String _userName = '';
  final _formkey = GlobalKey<FormState>();
  final groupTitleController = TextEditingController();
  final groupDecriptionController = TextEditingController();
  final groupCategoryController = TextEditingController();
  @override
  void initState() {
    _user = FirebaseAuth.instance.currentUser;
    _userName = _user.displayName;
    super.initState();
  }

  @override
  void dispose() {
    groupTitleController.dispose();
    groupDecriptionController.dispose();
    groupCategoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final groupprovider = Provider.of<GroupProvider>(context, listen: false);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create Group",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Add GroupInfo",
              style: TextStyle(
                fontSize: 13,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          onPressed: () {
            if (_groupName != null) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => AddMemberPage(
                        groupname: _groupName,
                        //groupid:_
                        admin: _userName,
                        adminid: _user.uid,
                      )));
            } else {
              _scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text('Title is Required'),
                backgroundColor: Colors.grey,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                duration: Duration(seconds: 3),
              ));
            }
          },
          child: Icon(Icons.arrow_forward)),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  InputCard(
                    hintText: 'Enter Group title',
                    controller: groupTitleController,
                    onChange: (String val) {
                      _groupName = val;
                      groupprovider.changetitle = val;
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  InputCard(
                    hintText: 'Enter Group description',
                    controller: groupDecriptionController,
                    onChange: (String val) {
                      groupprovider.changedecription = val;
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  InputCard(
                    controller: groupCategoryController,
                    hintText: 'Enter Group Categroy ',
                    onChange: (String val) {
                      groupprovider.changecategory = val;
                      groupprovider.changeadmin = _userName;
                    },

                    // print(budget);
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
