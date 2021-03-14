import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

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
}
