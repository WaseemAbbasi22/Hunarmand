import 'package:Hunarmand_signIn_Ui/Models/workermodel.dart';
import 'package:Hunarmand_signIn_Ui/Service/firestore_service.dart';
import 'package:Hunarmand_signIn_Ui/Service/groupmanagement_services/group_dbservice.dart';
import 'package:Hunarmand_signIn_Ui/controllers/group_provider.dart';
import 'package:Hunarmand_signIn_Ui/controllers/worker_provider.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/models/chatmodel.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/group_screen/pages/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Hunarmand_signIn_Ui/Models/workermodel.dart';
import 'package:Hunarmand_signIn_Ui/Service/firestore_service.dart';
import 'package:Hunarmand_signIn_Ui/Service/groupmanagement_services/group_dbservice.dart';
import 'package:Hunarmand_signIn_Ui/controllers/group_provider.dart';
import 'package:Hunarmand_signIn_Ui/controllers/worker_provider.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/models/chatmodel.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/group_screen/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowMemberPage extends StatefulWidget {
  final String groupid;
  final String groupname;
  final List<dynamic> members;

  //
  ShowMemberPage({this.groupid, this.groupname, this.members});
  @override
  _ShowMemberPageState createState() => _ShowMemberPageState();
}

// @override
// void initState() {
//   super.initState();
//   //print(widget.groupname);
// }
class _ShowMemberPageState extends State<ShowMemberPage> {
  // List<dynamic> groupmember = [];
  // FirestoreService firestoreService = FirestoreService();

  // void showmembers() async {
  //   GroupDatabaseService groupDatabaseService = GroupDatabaseService();
  //   groupmember = await groupDatabaseService.getgroupmemberid(widget.groupid);
  //   print(groupmember.length);
  // }

  @override
  void initState() {
    // final groupprovider = Provider.of<GroupProvider>(context, listen: false);
    //groupprovider.changegroupid = widget.groupid;
    // showmembers();
    for (int i = 0; i < widget.members.length; i++) {
      print(widget.members[i]);
    }
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
              "Group Members",
              style: TextStyle(
                fontSize: 13,
              ),
            )
          ],
        ),
      ),
      body: StreamBuilder<List<Worker>>(
        stream: FirebaseFirestore.instance
            .collection('workerusers')
            .where('workerid', whereIn: widget.members)
            .snapshots()
            .map((snapshot) => snapshot.docs
                .map((doc) => Worker.fromJson(doc.data()))
                .toList()),
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
                    // ontap: () {
                    //   setState(() {
                    //     if (snapshot.data[index].isSelected == true) {
                    //       firestoreService.updateworkerfeild(
                    //           snapshot.data[index].workerId, false);
                    //       print(snapshot.data[index].isSelected);

                    //       groupmember.remove(snapshot.data[index].workerId);
                    //       snapshot.data[index].isSelected = false;
                    //     } else {
                    //       firestoreService.updateworkerfeild(
                    //           snapshot.data[index].workerId, true);
                    //       groupmember.add(snapshot.data[index].workerId);
                    //       snapshot.data[index].isSelected = true;
                    //     }
                    //   });
                    //   for (int i = 0; i < groupmember.length; i++) {
                    //     print(groupmember[i]);
                    //   }
                    // },
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

// class ShowMemberPage extends StatefulWidget {
//   final String groupid;
//   final String groupname;

//   //
//   ShowMemberPage({this.groupid, this.groupname});
//   @override
//   _ShowMemberPageState createState() => _ShowMemberPageState();
// }

// // @override
// // void initState() {
// //   super.initState();
// //   //print(widget.groupname);
// // }

// class _ShowMemberPageState extends State<ShowMemberPage> {
//   List<dynamic> groupmember = [];
//   FirestoreService firestoreService = FirestoreService();
//   void showmembers() async {
//     GroupDatabaseService groupDatabaseService = GroupDatabaseService();
//     groupmember = await groupDatabaseService.getgroupmemberid(widget.groupid);
//     print(groupmember.length);
//   }

//   @override
//   void initState() {
//     GroupDatabaseService groupDatabaseService = GroupDatabaseService();
//     showmembers();
//     // groupmember = await groupDatabaseService.getgroupmemberid(widget.groupid);
//     final groupprovider = Provider.of<GroupProvider>(context, listen: false);

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final groupprovider = Provider.of<GroupProvider>(context, listen: false);
//     final workerprovider = Provider.of<WorkerProvider>(context, listen: false);
//     return Scaffold(
//       appBar: AppBar(
//         title: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               widget.groupname,
//               style: TextStyle(
//                 fontSize: 19,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               "Group Members",
//               style: TextStyle(
//                 fontSize: 13,
//               ),
//             )
//           ],
//         ),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //     backgroundColor: Colors.deepOrange,
//       //     onPressed: () {
//       //       groupprovider.changemembers = groupmember;
//       //       groupprovider.savegroup();
//       //       for (int i = 0; i < groupmember.length; i++) {
//       //         firestoreService.updateworkerfeild(groupmember[i], false);
//       //       }
//       //       Navigator.of(context).pushReplacement(
//       //           MaterialPageRoute(builder: (context) => HomePage()));
//       //       // GroupDatabaseService groupDatabaseService = GroupDatabaseService();
//       //       // groupDatabaseService.updategroupmembers(
//       //       //     widget.groupid, groupmember);
//       //     },
//       //     child: Icon(Icons.arrow_forward)),
//       body: ListView.builder(
//           itemCount: groupmember.length,
//           shrinkWrap: true,
//           itemBuilder: (context, index) {
//             // int reqIndex = snapshot.data.length - index - 1;

//             return MemberTile(
//               id: groupmember[index].toString(),

//               // ontap: () {
//               //   setState(() {
//               //     if (snapshot.data[index].isSelected == true) {
//               //       firestoreService.updateworkerfeild(
//               //           snapshot.data[index].workerId, false);
//               //       print(snapshot.data[index].isSelected);

//               //       groupmember.remove(snapshot.data[index].workerId);
//               //       snapshot.data[index].isSelected = false;
//               //     } else {
//               //       firestoreService.updateworkerfeild(
//               //           snapshot.data[index].workerId, true);
//               //       groupmember.add(snapshot.data[index].workerId);
//               //       snapshot.data[index].isSelected = true;
//               //     }
//               //   });
//               //   for (int i = 0; i < groupmember.length; i++) {
//               //     print(groupmember[i]);
//               //   }
//               // },
//             );
//           }),
//     );
//   }
// }

// class MemberTile extends StatefulWidget {
//   final String userName;
//   final String mobileNo;
//   final String id;
//   final String groupid;
//   final Worker worker;
//   final Function ontap;

//   MemberTile(
//       {this.userName,
//       this.id,
//       this.mobileNo,
//       this.groupid,
//       this.ontap,
//       this.worker});

//   @override
//   _MemberTileState createState() => _MemberTileState();
// }

// class _MemberTileState extends State<MemberTile> {
//   @override
//   Widget build(BuildContext context) {
//     // final gprovider = Provider.of<GroupProvider>(context, listen: false);

//     return GestureDetector(
//       onTap: widget.ontap,
//       // onTap: () {
//       //   print('abc');
//       // GroupDatabaseService dbser = GroupDatabaseService();
//       // dbser.addtolist(widget.id);
//       // dbser.updategroupmembers(widget.groupid);
//       // Navigator.push(
//       //     context,
//       //     MaterialPageRoute(
//       //         builder: (context) => ChatScreenCopy(
//       //               groupId: widget.groupId,
//       //               userName: widget.userName,
//       //               groupName: widget.groupName,
//       //             )));
//       // ChatScreen()));
//       // },
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
//         child: ListTile(
//           leading: Container(
//             width: 50,
//             height: 53,
//             child: Stack(
//               children: [
//                 CircleAvatar(
//                   radius: 30.0,
//                   backgroundColor: Colors.deepOrange,
//                   child: Text(widget.id.substring(0, 1).toUpperCase(),
//                       textAlign: TextAlign.center,
//                       style: TextStyle(color: Colors.white)),
//                 ),
//               ],
//             ),
//           ),
//           title: Text(widget.id, style: TextStyle(fontWeight: FontWeight.bold)),
//           // subtitle: Text("workerid ${widget.id}",
//           // style: TextStyle(fontSize: 13.0)),
//         ),
//       ),
//     );
//   }
// }
