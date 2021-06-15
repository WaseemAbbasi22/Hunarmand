import 'package:Hunarmand_signIn_Ui/Service/groupmanagement_services/group_dbservice.dart';
import 'package:Hunarmand_signIn_Ui/helper/helper_function.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/group_screen/pages/chat_page.dart';
import 'package:Hunarmand_signIn_Ui/Models/group_modle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Hunarmand_signIn_Ui/controllers/group_provider.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // data
  TextEditingController searchEditingController = new TextEditingController();
  Stream<List<Groups>> searchResultstream;
  bool isLoading = false;
  bool hasUserSearched = false;
  bool _isJoined = false;
  String _userName = '';
  User _user;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // initState()
  @override
  void initState() {
    super.initState();
    _getCurrentUserNameAndUid();
  }

  // functions
  _getCurrentUserNameAndUid() async {
    _userName = _user.displayName;
    _user = FirebaseAuth.instance.currentUser;
  }

  _initiateSearch(BuildContext context) async {
    final groupprovider = Provider.of<GroupProvider>(context, listen: false);
    if (searchEditingController.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      searchResultstream = groupprovider.groupsearch;

      // await GroupDatabaseService()
      //     .searchByName(searchEditingController.text)
      //     .then((snapshot) {

      //print("$searchResultSnapshot");
      setState(() {
        isLoading = false;
        hasUserSearched = true;
      });
    }
  }

  void _showScaffold(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      backgroundColor: Colors.blueAccent,
      duration: Duration(milliseconds: 1500),
      content: Text(message,
          textAlign: TextAlign.center, style: TextStyle(fontSize: 17.0)),
    ));
  }

  _joinValueInGroup(
      String userName, String groupId, String groupName, String admin) async {
    bool value = await GroupDatabaseService(uid: _user.uid)
        .isUserJoined(groupId, groupName, userName);
    setState(() {
      _isJoined = value;
    });
  }

  // widgets
  Widget groupList(GroupProvider gprovider) {
    return hasUserSearched
        ? StreamBuilder<List<Groups>>(
            stream: gprovider.groupsearch,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return groupTile(
                        _userName,
                        snapshot.data[index].groupId,
                        // .data["groupId"],
                        snapshot.data[index].title,
                        snapshot.data[index].admin,
                      );
                    });
              } else {
                return Center(
                  child: Text('no result found'),
                );
              }
            })
        : Container();
  }

  Widget groupTile(
      String userName, String groupId, String groupName, String admin) {
    _joinValueInGroup(userName, groupId, groupName, admin);
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      leading: CircleAvatar(
          radius: 30.0,
          backgroundColor: Colors.deepOrange,
          child: Text(groupName.substring(0, 1).toUpperCase(),
              style: TextStyle(color: Colors.white))),
      title: Text(groupName, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text("Admin: $admin"),
      trailing: InkWell(
        onTap: () async {
          await GroupDatabaseService(uid: _user.uid)
              .togglingGroupJoin(groupId, groupName, userName);
          if (_isJoined) {
            setState(() {
              _isJoined = !_isJoined;
            });
            // await DatabaseService(uid: _user.uid).userJoinGroup(groupId, groupName, userName);
            _showScaffold('Successfully joined the group "$groupName"');
            Future.delayed(Duration(milliseconds: 2000), () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChatPage(
                      groupId: groupId,
                      userName: userName,
                      groupName: groupName)));
            });
          } else {
            setState(() {
              _isJoined = !_isJoined;
            });
            _showScaffold('Left the group "$groupName"');
          }
        },
        child: _isJoined
            ? Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black87,
                    border: Border.all(color: Colors.white, width: 1.0)),
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Text('Joined', style: TextStyle(color: Colors.white)),
              )
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.deepOrange,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Text('Join', style: TextStyle(color: Colors.white)),
              ),
      ),
    );
  }

  // building the search page widget
  @override
  Widget build(BuildContext context) {
    final groupprovider = Provider.of<GroupProvider>(context, listen: false);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Search Group',
            style: TextStyle(
              color: Colors.white,
            )),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        elevation: 5.0,
        // actions: <Widget>[
        //   IconButton(
        //       padding: EdgeInsets.symmetric(horizontal: 20.0),
        //       icon: Icon(Icons.search, color: Colors.white, size: 25.0),
        //       onPressed: () {
        //         Navigator.of(context).push(
        //             MaterialPageRoute(builder: (context) => SearchPage()));
        //       })
        // ],
      ),
      body: // isLoading ? Container(
          //   child: Center(
          //     child: CircularProgressIndicator(),
          //   ),
          // )
          // :
          Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              color: Colors.grey[700],
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchEditingController,
                      onChanged: (val) {
                        setState(() {
                          groupprovider.changegroupnamesearch = val;
                        });
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: "Enter Group name...",
                          hintStyle: TextStyle(
                            color: Colors.white38,
                            fontSize: 16,
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        _initiateSearch(context);
                      },
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(40)),
                          child: Icon(Icons.search, color: Colors.white)))
                ],
              ),
            ),
            isLoading
                ? Container(child: Center(child: CircularProgressIndicator()))
                : groupList(groupprovider)
          ],
        ),
      ),
    );
  }
}
