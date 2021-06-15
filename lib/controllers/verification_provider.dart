// import 'package:Hunarmand_signIn_Ui/Models/job_models/posted_job_m.dart';
import 'package:Hunarmand_signIn_Ui/Models/verificationmodel.dart';
import 'package:Hunarmand_signIn_Ui/Service/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:uuid/uuid.dart';

class VerificationProvider with ChangeNotifier {
  final firestoreService = FirestoreService();

  String _userId;
  String _cnicfronturl;
  String _cnicbackurl;
  String _selfiurl;

  //Getters
  String get userid => _userId;
  String get cnicfronturl => _cnicfronturl;
  String get cnicbackurl => _cnicbackurl;
  String get selfiurl => _selfiurl;

  Stream<List<IdVerification>> get verification =>
      firestoreService.getverifications();

  //Setters

  set changeuserId(String userid) {
    _userId = userid;
    notifyListeners();
  }

  set changecnicfront(String front) {
    _cnicfronturl = front;
    notifyListeners();
  }

  set changecnicback(String back) {
    _cnicbackurl = back;
    notifyListeners();
  }

  set changeselfe(String selfi) {
    _selfiurl = selfi;
    notifyListeners();
  }

  saveverification() {
    // if (_userId == null) {
      //Add
      var newObj = IdVerification(
        cnicfronturl: _cnicfronturl,
        cnicbackurl: _cnicbackurl,
        selfiurl: _selfiurl,
        userId: _userId,
      );
      firestoreService.setverification(newObj, _userId);
    // } else {
    //   //Edit
    //   var updateverification = IdVerification(
    //       cnicfronturl: _cnicfronturl,
    //       cnicbackurl: _cnicbackurl,
    //       selfiurl: _selfiurl,
    //       userId: _userId);

    //   firestoreService.setverification(updateverification, _userId);
    // }
  }

  // removeverification(String jobId) {
  //   firestoreService.removejob(jobId);
  // }

}
