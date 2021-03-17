import 'package:Hunarmand_signIn_Ui/Models/posted_job_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// final _firestore = FirebaseFirestore.instance;
// final _auth = FirebaseAuth.instance;
// User _loginUser = _auth.currentUser;
PostedJob _postedjob;

class PostJobController extends ChangeNotifier {
  addJob(
      {String title,
      String detail,
      String location,
      int offers,
      String imageUrl,
      String budget,
      String status}) {
    _postedjob = PostedJob(
        title: title,
        detail: detail,
        location: location,
        offers: offers,
        imageUrl: imageUrl,
        status: status);

    notifyListeners();
  }

  dynamic getObj() {
    return _postedjob;
  }

  void setUrl(String imgeUrl) async {
    _postedjob.imageUrl = imgeUrl;
    notifyListeners();
  }
}
