import 'package:Hunarmand_signIn_Ui/Models/workermodel.dart';
import 'package:Hunarmand_signIn_Ui/Service/firestore_service.dart';
import 'package:Hunarmand_signIn_Ui/Service/groupmanagement_services/group_dbservice.dart';
import 'package:Hunarmand_signIn_Ui/controllers/group_provider.dart';
import 'package:Hunarmand_signIn_Ui/controllers/worker_provider.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/models/chatmodel.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/group_screen/pages/home_page.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/group_screen/pages/show_groupmembers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddMemberPage extends StatefulWidget {
  final String groupid;
  final String groupname;
  final String admin;
  final String adminid;
  //
  AddMemberPage({this.groupid, this.groupname, this.admin, this.adminid});
  @override
  _AddMemberPageState createState() => _AddMemberPageState();
}

class _AddMemberPageState extends State<AddMemberPage> {
  List<String> groupmember = [];
  FirestoreService firestoreService = FirestoreService();
  @override
  void initState() {
    // final groupprovider = Provider.of<GroupProvider>(context, listen: false);
    // groupprovider.changeadmin = widget.admin;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final groupprovider = Provider.of<GroupProvider>(context, listen: false);
    final workerprovider = Provider.of<WorkerProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.groupname,
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Add participants",
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
            groupmember.add(widget.adminid);
            groupprovider.changemembers = groupmember;
            groupprovider.changeadmin = widget.admin;
            groupprovider.savegroup();
            for (int i = 0; i < groupmember.length; i++) {
              firestoreService.updateworkerfeild(groupmember[i], false);
            }

            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()));
            // GroupDatabaseService groupDatabaseService = GroupDatabaseService();
            // groupDatabaseService.updategroupmembers(
            //     widget.groupid, groupmember);
          },
          child: Icon(Icons.arrow_forward)),
      body: StreamBuilder<List<Worker>>(
        stream: workerprovider.workers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  // int reqIndex = snapshot.data.length - index - 1;

                  return MemberTile(
                    userName: snapshot.data[index].name,
                    mobileNo: snapshot.data[index].mobileNo,
                    id: snapshot.data[index].workerId,
                    worker: snapshot.data[index],
                    ontap: () {
                      print('group id is ');
                      print(widget.groupid);
                      print('group id is ');
                      print(groupprovider.groupid);
                      setState(() {
                        if (snapshot.data[index].isSelected == true) {
                          firestoreService.updateworkergroupid(
                              snapshot.data[index].workerId,
                              groupprovider.groupid);
                          firestoreService.updateworkerfeild(
                              snapshot.data[index].workerId, false);
                          print(snapshot.data[index].isSelected);

                          groupmember.remove(snapshot.data[index].workerId);
                          snapshot.data[index].isSelected = false;
                        } else {
                          firestoreService.updateworkerfeild(
                              snapshot.data[index].workerId, true);
                          groupmember.add(snapshot.data[index].workerId);
                          snapshot.data[index].isSelected = true;
                        }
                      });
                    },
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class MemberTile extends StatefulWidget {
  final String userName;
  final String mobileNo;
  final String id;
  final String groupid;
  final Worker worker;
  final Function ontap;

  MemberTile(
      {this.userName,
      this.id,
      this.mobileNo,
      this.groupid,
      this.ontap,
      this.worker});

  @override
  _MemberTileState createState() => _MemberTileState();
}

class _MemberTileState extends State<MemberTile> {
  @override
  Widget build(BuildContext context) {
    // final gprovider = Provider.of<GroupProvider>(context, listen: false);

    return GestureDetector(
      onTap: widget.ontap,
      // onTap: () {
      //   print('abc');
      // GroupDatabaseService dbser = GroupDatabaseService();
      // dbser.addtolist(widget.id);
      // dbser.updategroupmembers(widget.groupid);
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => ChatScreenCopy(
      //               groupId: widget.groupId,
      //               userName: widget.userName,
      //               groupName: widget.groupName,
      //             )));
      // ChatScreen()));
      // },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
        child: ListTile(
          leading: Container(
            width: 50,
            height: 53,
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.deepOrange,
                  child: Text(widget.userName.substring(0, 1).toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white)),
                ),
                widget.worker.isSelected
                    ? Positioned(
                        bottom: 4,
                        right: 5,
                        child: CircleAvatar(
                          backgroundColor: Colors.teal,
                          radius: 11,
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          title: Text(widget.userName,
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text("mobile No ${widget.mobileNo}",
              style: TextStyle(fontSize: 13.0)),
        ),
      ),
    );
  }
}
