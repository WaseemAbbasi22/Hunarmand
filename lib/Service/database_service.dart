import 'package:Hunarmand_signIn_Ui/Models/posted_job_model.dart';
import 'package:Hunarmand_signIn_Ui/controllers/postjob_controller.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

final _firestore = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;
User _loginUser = _auth.currentUser;

class DataBaseService {
  final String uid;
  DataBaseService({this.uid});

  final CollectionReference clientCollection =
      FirebaseFirestore.instance.collection('clients');

  Future createUserCollection(
      String name, String cnic, String imageurl, String address) async {
    return await clientCollection.doc(uid).set({
      'name': name,
      'cinic': cnic,
      'imageurl': imageurl,
      'address': address
    });
  }

  void addJobToDb(BuildContext context) {
    PostedJob _postedJob =
        Provider.of<PostJobController>(context, listen: false).getObj();
    try {
      _firestore
          .collection('posted_projects')
          .add({
            'title': _postedJob.title,
            'location': _postedJob.location,
            'budget': _postedJob.budget,
            'detail': _postedJob.detail,
            'imageurl': _postedJob.imageUrl,
            'posted_by': _loginUser.email,
            'posterurl': "nill",
            'offer': _postedJob.offers,
            'status': _postedJob.status,
          })
          .then((value) => print("job added with title ${_postedJob.budget}"))
          .catchError((error) => print("Failed to add job: $error"));
    } catch (e) {
      print(e);
    }
  }
}
