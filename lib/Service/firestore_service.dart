import 'package:Hunarmand_signIn_Ui/Models/job_models/joboffer_model.dart';
import 'package:Hunarmand_signIn_Ui/Models/job_models/posted_job_m.dart';
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
  Stream<List<PostedJobs>> getJobs() {
    return _db
        .collection('postedjobs')
        .where('postedby', isEqualTo: currentUser.displayName)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => PostedJobs.fromJson(doc.data()))
            .toList());
  }

  Stream<List<PostedJobs>> getfixedjobs() {
    return _db
        .collection('postedjobs')
        .where('postedby', isEqualTo: currentUser.displayName)
        .where('jobtype', isEqualTo: 'Fixed')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => PostedJobs.fixfromJson(doc.data()))
            .toList());
  }

  Stream<List<PostedJobs>> getotherjobs() {
    return _db
        .collection('postedjobs')
        .where('postedby', isEqualTo: currentUser.displayName)
        .where('jobtype', isEqualTo: 'Other')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => PostedJobs.fromJson(doc.data()))
            .toList());
  }

  //Upsert
  Future<void> setjob(PostedJobs jobs) {
    var options = SetOptions(merge: true);

    return _db
        .collection('postedjobs')
        .doc(jobs.jobId)
        .set(jobs.toMap(), options);
  }

  //set fixed job without image
  Future<void> setfixjob(PostedJobs jobs) {
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

  // Future<String> getuserEmail() async {

  //   return userEmail;
  // }

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

  //worker backend with firestore....
  Stream<List<Worker>> getworkers() {
    return _db.collection('workerusers').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Worker.fromJson(doc.data())).toList());
  }

  Stream<QuerySnapshot> getUserStream(String uid) {
    // final uid = await  _authService.getUserid();
    return _db
        .collection('workerusers')
        .where('workerid', isEqualTo: uid)
        .snapshots();
  }

  void updateworkerfeild(String uid, bool val) {
    _db.collection('workerusers').doc(uid).update({'isselected': val});
  }

  void updateworkergroupid(String uid, String groupid) {
    _db.collection('workerusers').doc(uid).update({'groupid': groupid});
  }

  Stream<List<Worker>> getsingleWorker(String workerid) {
    return _db
        .collection('workers')
        .where(FieldPath.documentId, isEqualTo: workerid)
        .limit(1)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Worker.fromJson(doc.data())).toList());
  }

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

  // Future<String> getuserEmail() async {
  //   User user = await _auth.currentUser;
  //   String userEmail = user.email;
  //   return userEmail;
  // }
}
