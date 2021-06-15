import 'package:Hunarmand_signIn_Ui/Models/group_modle.dart';
import 'package:Hunarmand_signIn_Ui/Models/workermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore _db = FirebaseFirestore.instance;
FirebaseAuth _auth = FirebaseAuth.instance;
User currentUser = _auth.currentUser;
List<dynamic> memberlist = List();

class GroupDatabaseService {
  final String uid;

  GroupDatabaseService({this.uid});

  // Collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('workerusers');
  final CollectionReference groupCollection = _db.collection('groups');

  // update userdata
  Future<void> updateUserData(String uId, String groupId) {
    userCollection.doc(_auth.currentUser.uid).update({'groupid': groupId});
  }

  List<String> addtolist(String id) {
    memberlist.add(id);
    return memberlist;
  }

  void updategroupmembers(String gid, List members) {
    print(gid);
    groupCollection.doc(gid).update({'members': members});
  }

// get group list..
  Stream<List<Groups>> getgroups() {
    return groupCollection
        .where('admin', isEqualTo: currentUser.displayName)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Groups.fromJson(doc.data())).toList());
  }

  Future<List<dynamic>> getgroupmemberid(String groupId) async {
    DocumentReference docRef = groupCollection.doc(groupId);
    DocumentSnapshot document = await docRef.get();
    memberlist = document.data()['members'];
    return memberlist;
  }

  Stream<List<Worker>> getmembers() {
    // getgroupmemberid(groupId);
    // List<dynamic> members = await getgroupmemberid();
    // for (int i = 0; i < memberlist.length; i++) {
    return _db
        .collection('workerusers')
        .where('workerid', whereIn: memberlist)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Worker.fromJson(doc.data())).toList());
    // }
  }

  //  Stream<List<Groups>> getmembers() {
  //   return groupCollection.doc().then((querySnapshot){
  //     querySnapshot.documents.forEach((element){
  //       List value = element.data["favourites"];
  //       .where('admin', isEqualTo: currentUser.displayName)
  //       .snapshots()
  //       .map((snapshot) =>
  //           snapshot.docs.map((doc) => Groups.fromJson(doc.data())).toList());
  // }

  // create groups:
  Future<void> setgroup(Groups groups) {
    // List<String> memberlist = addtolist(_auth.currentUser.uid);
    // groups.members = memberlist;
    var options = SetOptions(merge: true);
    userCollection
        .doc(_auth.currentUser.uid)
        .update({'groupid': groups.groupId});
    return groupCollection.doc(groups.groupId).set(groups.toMap(), options);
  }

  //remove group:
  Future<void> removegroup(String groupid) {
    return groupCollection.doc(groupid).delete();
  }

  // create group
  Future createGroup(String userName, String groupName) async {
    DocumentReference groupDocRef = await groupCollection.add({
      'groupName': groupName,
      'groupIcon': '',
      'admin': userName,
      'members': [],
      //'messages': ,
      'groupId': '',
      'recentMessage': '',
      'recentMessageSender': ''
    });

    await groupDocRef.update({
      'members': FieldValue.arrayUnion([uid + '_' + userName]),
      'groupId': groupDocRef.id
    });

    DocumentReference userDocRef = userCollection.doc(uid);
    return await userDocRef.update({
      'groups': FieldValue.arrayUnion([groupDocRef.id + '_' + groupName])
    });
  }

  // toggling the user group join
  Future togglingGroupJoin(
      String groupId, String groupName, String userName) async {
    DocumentReference userDocRef = userCollection.doc(uid);
    DocumentSnapshot userDocSnapshot = await userDocRef.get();

    DocumentReference groupDocRef = groupCollection.doc(groupId);

    List<dynamic> groups = await userDocSnapshot.get('groups');
    // .data['groups'];

    if (groups.contains(groupId + '_' + groupName)) {
      //print('hey');
      await userDocRef.update({
        'groups': FieldValue.arrayRemove([groupId + '_' + groupName])
      });

      await groupDocRef.update({
        'members': FieldValue.arrayRemove([uid + '_' + userName])
      });
    } else {
      //print('nay');
      await userDocRef.update({
        'groups': FieldValue.arrayUnion([groupId + '_' + groupName])
      });

      await groupDocRef.update({
        'members': FieldValue.arrayUnion([uid + '_' + userName])
      });
    }
  }

  // has user joined the group
  Future<bool> isUserJoined(
      String groupId, String groupName, String userName) async {
    DocumentReference userDocRef = userCollection.doc(uid);
    DocumentSnapshot userDocSnapshot = await userDocRef.get();

    // List<dynamic> groups = await userDocSnapshot.data().entries.toList();
    List<dynamic> groups = await userDocSnapshot.get('groups');

    if (groups.contains(groupId + '_' + groupName)) {
      //print('he');
      return true;
    } else {
      //print('ne');
      return false;
    }
  }

  // get user data
  Future getUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where('email', isEqualTo: email).get();
    print(snapshot.docs[0].data);
    return snapshot;
  }

  // get user groups
  getUserGroups() async {
    // return await Firestore.instance.collection("users").where('email', isEqualTo: email).snapshots();
    return FirebaseFirestore.instance.collection("workerusers").snapshots();
  }

  // send message
  sendMessage(GroupMessage groupMessage, String groupId) {
    // var options = SetOptions(merge: true);

    groupCollection
        .doc(groupId)
        .collection('message')
        .add(groupMessage.toMap());

    // FirebaseFirestore.instance
    //     .collection('groups')
    //     .doc(groupId)
    //     .collection('messages')
    //     .add(chatMessageData);
    FirebaseFirestore.instance.collection('groups').doc(groupId).update({
      'recentMessage': groupMessage.message,
      'recentMessageSender': groupMessage.sender,
      'recentMessageTime': groupMessage.time.toString(),
    });
  }

  // get chats of a particular group
  Stream<List<GroupMessage>> getchats(String groupId) {
    return FirebaseFirestore.instance
        .collection('groups')
        .doc(groupId)
        .collection('message')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => GroupMessage.fromJson(doc.data()))
            .toList());
  }

  // Stream<List<Groups>> getgroups() {
  //   return groupCollection
  //       .where('admin', isEqualTo: currentUser.displayName)
  //       .snapshots()
  //       .map((snapshot) =>
  //           snapshot.docs.map((doc) => Groups.fromJson(doc.data())).toList());
  // }
  // search groups
  searchByName(String groupName) {
    return FirebaseFirestore.instance
        .collection("groups")
        .where('groupName', isEqualTo: groupName)
        .get();
  }

  Stream<List<Groups>> getgroupsbyname(String groupName) {
    return groupCollection.where('title', isEqualTo: groupName).snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => Groups.fromJson(doc.data())).toList());
  }
}
