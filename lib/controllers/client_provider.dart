import 'package:Hunarmand_signIn_Ui/Models/clientmodel.dart';
import 'package:Hunarmand_signIn_Ui/Service/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ClientProvider with ChangeNotifier {
  final firestoreService = FirestoreService();

  String _clientId = '';
  String _name = '';
  String _email = '';
  String _phoneNo = '';
  String _address = '';
  String _picture = '';
  String _cnic = '';
  // String _password = '';
  // String _type = '';
  var uuid = Uuid();

  //Getters
  String get username => _name;
  String get useremail => _email;
  String get useraddress => _address;
  String get userphoneno => _phoneNo;
  String get userpicture => _picture;
  String get usercnci => _cnic;
  // String get userpassword => _password;
  // String get usertype => _type;
  String get userid => _clientId;

  Stream<List<Client>> get clientstream => firestoreService.getclientstream();
  // Stream<List<MyUser>> get singleuser =>
  //     firestoreService.gets(_userId);
  Stream<QuerySnapshot> get worker => firestoreService.getclient(_clientId);

  //Setters
  set changename(String name) {
    _name = name;
    notifyListeners();
  }

  // String setUseruser() {
  //   String userEmail = firestoreService.getuserEmail().toString();
  //   return userEmail;
  // }

  set changeemail(String email) {
    _email = email;
    notifyListeners();
  }

  set changephoneno(String phone) {
    _phoneNo = phone;
    notifyListeners();
  }

  set changeaddress(String location) {
    _address = location;
    notifyListeners();
  }

  set changecnic(String cnic) {
    _cnic = cnic;
    notifyListeners();
  }

  // set changedpassword(String password) {
  //   _password = password;
  //   notifyListeners();
  // }

  set changepicture(String picture) {
    _picture = picture;
    notifyListeners();
  }

  // set changetype(String type) {
  //   _picture = type;
  //   notifyListeners();
  // }

  set changeuserid(String uid) {
    _clientId = uid;
    notifyListeners();
  }

  //Functions
  loadAll(Client users) {
    if (users != null) {
      // _date = DateTime.parse(entry.date);
      _name = users.name;
      _email = users.email;
      _phoneNo = users.mobileNo;
      _address = users.address;
      _picture = users.picture;
      _cnic = users.cnic;
      // _password = users.password;
      // _type = users.type;
    } else {
      // _date = DateTime.now();
      _name = null;
      _email = null;
      _phoneNo = null;
      _cnic = null;
      _address = null;
      _picture = null;
      _cnic = null;
      // _password = null;
      // _type = null;
    }
  }

  saveclinet(
    String clientuid,
    String name,
    String phone,
  ) {
    if (clientuid == null) {
      // Add
      var newclient = Client(
        name: name,
        email: _email,
        mobileNo: phone,
        address: _address,
        cnic: _cnic,
        // type: type,
        picture: _picture,
        // password: _password,
        clientId: clientuid,
      );
      firestoreService.setclient(newclient);
    } else {
      // Edit
      var updatedclient = Client(
          name: _name,
          email: _email,
          mobileNo: _phoneNo,
          address: _address,
          cnic: _cnic,
          picture: _picture,
          // password: _password,
          clientId: clientuid);
      firestoreService.setclient(updatedclient);
    }
  }

  removeclinet(String clientId) {
    firestoreService.removerclient(clientId);
  }
}
