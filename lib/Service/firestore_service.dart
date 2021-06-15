import 'package:Hunarmand_signIn_Ui/Models/clientmodel.dart';
import 'package:Hunarmand_signIn_Ui/Models/job_models/joboffer_model.dart';
import 'package:Hunarmand_signIn_Ui/Models/job_models/posted_job_m.dart';
import 'package:Hunarmand_signIn_Ui/Models/user.dart';
import 'package:Hunarmand_signIn_Ui/Models/verificationmodel.dart';
import 'package:Hunarmand_signIn_Ui/Models/workermodel.dart';
import 'package:Hunarmand_signIn_Ui/Service/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
AuthService _authService = AuthService();
User currentUser = _auth.currentUser;
String userEmail = currentUser.email;

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  final String uid;
  FirestoreService({this.uid});

  //Get Entries
  Stream<List<Jobs>> getJobs() {
    return _db
        .collection('postedjobs')
        .where('postedby', isEqualTo: currentUser.displayName)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Jobs.fromJson(doc.data())).toList());
  }

  // get Single job
  Stream<List<Jobs>> getsinglejob(String jobId) {
    return _db
        .collection('workerusers')
        .where('workerid', isEqualTo: jobId)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Jobs.fromJson(doc.data())).toList());
  }

  Stream<List<Jobs>> getfixedjobs() {
    return _db
        .collection('postedjobs')
        .where('postedby', isEqualTo: currentUser.displayName)
        .where('jobtype', isEqualTo: 'Fixed')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Jobs.fixfromJson(doc.data())).toList());
  }

  Stream<List<Jobs>> getallfixedjobs() {
    return _db
        .collection('postedjobs')
        .where('jobtype', isEqualTo: 'Fixed')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Jobs.fixfromJson(doc.data())).toList());
  }

  Stream<List<Jobs>> getotherjobs() {
    return _db
        .collection('postedjobs')
        .where('postedby', isEqualTo: currentUser.displayName)
        .where('jobtype', isEqualTo: 'Other')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Jobs.fromJson(doc.data())).toList());
  }

  Stream<List<Jobs>> getallotherjobs() {
    return _db
        .collection('postedjobs')
        .where('jobtype', isEqualTo: 'Other')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Jobs.fromJson(doc.data())).toList());
  }

  //Upsert
  Future<void> setjob(Jobs jobs) {
    var options = SetOptions(merge: true);

    return _db
        .collection('postedjobs')
        .doc(jobs.jobId)
        .set(jobs.toMap(), options);
  }

  //set fixed job without image
  Future<void> setfixjob(Jobs jobs) {
    var options = SetOptions(merge: true);

    return _db
        .collection('postedjobs')
        .doc(jobs.jobId)
        .set(jobs.fixtoMap(), options);
  }

  //Delete
  Future<void> removejob(String jobId) {
    return _db.collection('postedjobs').doc(jobId).delete();
  }

  sendjobMessage(JobMessage jobMessage, String jobId) {
    // var options = SetOptions(merge: true);

    _db
        .collection('postedjobs')
        .doc(jobId)
        .collection('message')
        .add(jobMessage.toMap());
  }

  //job offers backend
  Stream<List<JobOffers>> getoffers(String jobid) {
    print(jobid);
    return _db
        .collection('joboffers')
        .where('jobId', isEqualTo: jobid)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => JobOffers.fromJson(doc.data()))
            .toList());
  }

  //Upsert
  Future<void> setoffer(JobOffers offers) {
    var options = SetOptions(merge: true);

    return _db
        .collection('joboffers')
        .doc(offers.offerId)
        .set(offers.toMap(), options);
  }

  //Delete
  Future<void> removeoffer(String jobId) {
    return _db.collection('joboffers').doc(jobId).delete();
  }
  //.....................User backend with firestore...................//

  Stream<List<Client>> getusers() {
    return _db.collection('users').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Client.fromJson(doc.data())).toList());
  }

  Stream<QuerySnapshot> getUserStream(String uid) {
    // final uid = await  _authService.getUserid();
    return _db.collection('users').where('userid', isEqualTo: uid).snapshots();
  }

  Stream<Worker> get userData {
    return _db
        .collection('workerusers')
        .doc(uid)
        .snapshots()
        .map(_userDataFromSnapShot);
  }

  Worker _userDataFromSnapShot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data();

    return Worker(
        workerId: uid,
        name: data['name'] ?? '',
        location: data['location'],
        cnic: data['cnic'],
        email: data['email'],
        mobileNo: data['mobileno'],
        skill: data['skill'],
        imageUrl: data['imageurl']);
  }
  //Upsert

  Future<void> setusers(MyUser user) {
    var options = SetOptions(merge: true);

    return _db.collection('users').doc(user.userId).set(user.toMap(), options);
  }

  //Delete
  Future<void> removeuser(String userid) {
    return _db.collection('users').doc(userid).delete();
  }

  Future<void> setverification(IdVerification idVerification, String userId) {
    // var options = SetOptions(merge: true);

    return _db
        .collection('workerusers')
        .doc(userId)
        .collection('verification')
        .add(idVerification.toMap());
  }

  Stream<List<IdVerification>> getverifications() {
    return _db.collection('workerusers').snapshots().map((snapshot) => snapshot
        .docs
        .map((doc) => IdVerification.fromJson(doc.data()))
        .toList());
  }

  //client backend with firestore....
  Stream<List<Client>> getclientstream() {
    return _db.collection('client').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Client.fromJson(doc.data())).toList());
  }

  Stream<QuerySnapshot> getclient(String uid) {
    // final uid = await  _authService.getUserid();
    return _db
        .collection('client')
        .where('clientid', isEqualTo: uid)
        .snapshots();
  }

  Stream<List<Client>> getsingleclient(String uid) {
    // final uid = await  _authService.getUserid();
    return _db
        .collection('client')
        .where('clientid', isEqualTo: uid)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Client.fromJson(doc.data())).toList());
  }

  //Upsert
  Future<void> setclient(Client client) {
    var options = SetOptions(merge: true);

    return _db
        .collection('client')
        .doc(client.clientId)
        .set(client.toMap(), options);
  }

  //Delete
  Future<void> removerclient(String clientid) {
    return _db.collection('client').doc(clientid).delete();
  }

  //.........................worker backend with firestore....
  Stream<List<Worker>> getworkers() {
    return _db.collection('workerusers').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Worker.fromJson(doc.data())).toList());
  }

  Stream<QuerySnapshot> getWorkerStream(String uid) {
    // final uid = await  _authService.getUserid();
    return _db
        .collection('workerusers')
        .where('workerid', isEqualTo: uid)
        .snapshots();
  }

  Stream<List<Worker>> getsingleWorker(String uid) {
    // final uid = await  _authService.getUserid();
    return _db
        .collection('workerusers')
        .where('workerid', isEqualTo: uid)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Worker.fromJson(doc.data())).toList());
    ;
  }

  void updateworkerfeild(String uid, bool val) {
    _db.collection('workerusers').doc(uid).update({'isselected': val});
  }

  void updateworkergroupid(String uid, String groupid) {
    _db.collection('workerusers').doc(uid).update({'groupid': groupid});
  }

  // Stream<List<Worker>> getsingleWorker(String workerid) {
  //   return _db
  //       .collection('workers')
  //       .where(FieldPath.documentId, isEqualTo: workerid)
  //       .limit(1)
  //       .snapshots()
  //       .map((snapshot) =>
  //           snapshot.docs.map((doc) => Worker.fromJson(doc.data())).toList());
  // }

  // getsingelworker(String workerid) {
  //   return _db.collection('workers').doc(workerid).get();
  // }

  //Upsert
  Future<void> setworker(Worker worker) {
    var options = SetOptions(merge: true);

    return _db
        .collection('workers')
        .doc(worker.workerId)
        .set(worker.toMap(), options);
  }

  Future<void> setworkers(Worker worker) {
    var options = SetOptions(merge: true);

    return _db
        .collection('workerusers')
        .doc(worker.workerId)
        .set(worker.toMap(), options);
  }

  //Delete
  Future<void> removeworker(String workerId) {
    return _db.collection('workers').doc(workerId).delete();
  }
}
