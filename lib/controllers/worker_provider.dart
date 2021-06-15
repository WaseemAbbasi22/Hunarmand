import 'package:Hunarmand_signIn_Ui/Models/job_models/posted_job_m.dart';
import 'package:Hunarmand_signIn_Ui/Models/workermodel.dart';
import 'package:Hunarmand_signIn_Ui/Service/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';

class WorkerProvider with ChangeNotifier {
  final firestoreService = FirestoreService();

  String _workerId = '';
  String _name = '';
  String _email = '';
  String _cnic = '';
  String _phoneNo = '';
  String _location = '';
  int _totalJobs = 0;
  int _pendingJobs = 0;
  int _completedJobs = 0;
  String _imageUrl = '';
  String _level = '';
  String _dBirth = '';
  String _skill = '';
  var uuid = Uuid();

  //Getters
  String get workername => _name;
  String get workeremail => _email;
  String get workercnic => _cnic;
  String get workerlocation => _location;
  String get workerphoneno => _phoneNo;
  int get totaljobs => _totalJobs;
  int get completedjobs => _completedJobs;
  int get pendingjobs => _pendingJobs;
  String get workerimageurl => _imageUrl;
  String get workerskill => _skill;
  String get workerlevel => _level;
  String get workerdbirth => _dBirth;
  String get workerid => _workerId;

  Stream<List<Worker>> get workers => firestoreService.getworkers();
  Stream<List<Worker>> get singleworker =>
      firestoreService.getsingleWorker(_workerId);
  Stream<QuerySnapshot> get worker =>
      firestoreService.getWorkerStream(_workerId);

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

  set changecnic(String cnic) {
    _cnic = cnic;
    notifyListeners();
  }

  set changephoneno(String phone) {
    _phoneNo = phone;
    notifyListeners();
  }

  set changeloction(String location) {
    _location = location;
    notifyListeners();
  }

  set changetotaljobs(int tjobs) {
    _totalJobs = tjobs;
    notifyListeners();
  }

  set changependingjobs(int pjobs) {
    _pendingJobs = pjobs;
    notifyListeners();
  }

  set changecompletedjobs(int cjobs) {
    _completedJobs = cjobs;
    notifyListeners();
  }

  set changelevel(String level) {
    _level = level;
    notifyListeners();
  }

  set changedbirth(String dbirth) {
    _dBirth = dbirth;
    notifyListeners();
  }

  set changeimgurl(String imgurl) {
    _imageUrl = imgurl;
    notifyListeners();
  }

  set changeskill(String skill) {
    _skill = skill;
    notifyListeners();
  }

  set changeworkerid(String uid) {
    _workerId = uid;
    notifyListeners();
  }

  //Functions
  loadAll(Worker workers) {
    if (workers != null) {
      // _date = DateTime.parse(entry.date);
      _name = workers.name;
      _email = workers.email;
      _phoneNo = workers.mobileNo;
      _location = workers.location;
      _totalJobs = workers.totalJobs;
      _pendingJobs = workers.pendingJobs;
      _completedJobs = workers.completeJobs;
      _imageUrl = workers.imageUrl;
      _level = workers.level;
      _dBirth = workers.dBirth;
    } else {
      // _date = DateTime.now();
      _name = null;
      _email = null;
      _phoneNo = null;
      _level = null;
      _location = null;
      _totalJobs = null;
      _pendingJobs = null;
      _completedJobs = null;
      _imageUrl = null;
      _level = null;
      _dBirth = null;
    }
  }

  saveworker(String workeruid, String email) {
    if (_workerId == null) {
      //Add
      var newworker = Worker(
        name: _name,
        email: email,
        mobileNo: _phoneNo,
        location: _location,
        level: _level,
        imageUrl: _imageUrl,
        totalJobs: _totalJobs,
        pendingJobs: _pendingJobs,
        completeJobs: _completedJobs,
        dBirth: _dBirth,
        workerId: workeruid,
      );
      firestoreService.setworker(newworker);
    } else {
      //Edit
      var updatedworker = Worker(
        name: _name,
        email: email,
        mobileNo: _phoneNo,
        location: _location,
        level: _level,
        imageUrl: _imageUrl,
        totalJobs: _totalJobs,
        pendingJobs: _pendingJobs,
        completeJobs: _completedJobs,
        dBirth: _dBirth,
        workerId: workeruid,
      );
      firestoreService.setworker(updatedworker);
    }
  }

  saveworkers(String workeruid, String name, String phoneNo, String skill) {
    if (_workerId == null) {
      changeworkerid = workeruid;
      changename = name;
      changephoneno = phoneNo;
      changeskill = skill;
      //Add
      var newworker = Worker(
        name: _name,
        email: _email,
        mobileNo: _phoneNo,
        location: _location,
        level: _level,
        skill: _skill,
        imageUrl: _imageUrl,
        totalJobs: _totalJobs,
        pendingJobs: _pendingJobs,
        completeJobs: _completedJobs,
        dBirth: _dBirth,
        workerId: _workerId,
      );
      firestoreService.setworkers(newworker);
    } else {
      //Edit
      var updatedworker = Worker(
        name: _name,
        email: _email,
        mobileNo: _phoneNo,
        location: _location,
        level: _level,
        skill: _skill,
        imageUrl: _imageUrl,
        totalJobs: _totalJobs,
        pendingJobs: _pendingJobs,
        completeJobs: _completedJobs,
        dBirth: _dBirth,
        workerId: workeruid,
      );
      firestoreService.setworkers(updatedworker);
    }
  }

  updateworkers(String workeruid) {
    if (workeruid != null) {
      //Edit
      var updatedworker = Worker(
        name: _name,
        email: _email,
        mobileNo: _phoneNo,
        location: _location,
        level: _level,
        skill: _skill,
        imageUrl: _imageUrl,
        totalJobs: _totalJobs,
        pendingJobs: _pendingJobs,
        completeJobs: _completedJobs,
        dBirth: _dBirth,
        workerId: workeruid,
      );
      firestoreService.setworkers(updatedworker);
    }
  }

  removeworker(String workerId) {
    firestoreService.removeworker(workerId);
  }
}
