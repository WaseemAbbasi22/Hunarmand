// import 'package:Hunarmand_signIn_Ui/Models/posted_job_m.dart';
// import 'package:Hunarmand_signIn_Ui/Models/posted_job_model.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// // final _firestore = FirebaseFirestore.instance;
// // final _auth = FirebaseAuth.instance;
// // User _loginUser = _auth.currentUser;
// PostedJobM _postedjob;

// class PostJobController extends ChangeNotifier {
//   addJob(
//       {String title,
//       String detail,
//       String location,
//       int offers,
//       double budget,
//       String status}) {
//     _postedjob = new PostedJobM(
//       title: title,
//       detail: detail,
//       location: location,
//       offers: offers,
//       status: status,
//       budget: budget,
//     );

//     notifyListeners();
//   }

//   dynamic getObj() {
//     return _postedjob;
//   }

//   void setUrl(String imgeUrl) {
//     _postedjob.jobImageUrl(imgeUrl);
//     print(imgeUrl);
//     notifyListeners();
//   }
// }
