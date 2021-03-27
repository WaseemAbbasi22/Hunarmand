import 'package:Hunarmand_signIn_Ui/Models/posted_job_m.dart';
import 'package:Hunarmand_signIn_Ui/Service/firestore_service.dart';
import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';

class PostedJobProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  DateTime _date;
  String _jobId;
  String _title;
  String _detail;
  String _location;
  int _offers;
  String _imageUrl;
  String _status;
  String _budget;
  var uuid = Uuid();

  //Getters
  DateTime get date => _date;
  String get jobtitle => _title;
  String get jobdetail => _detail;
  String get joblocation => _location;
  int get joboffers => _offers;
  String get jobbudget => _budget;
  String get jobimgurl => _imageUrl;
  String get jobstatus => _status;

  Stream<List<PostedJobs>> get jobs => firestoreService.getJobs();

  //Setters
  set changeDate(DateTime date) {
    _date = date;
    notifyListeners();
  }

  set changetitle(String title) {
    _title = title;
    notifyListeners();
  }

  set changedetail(String detial) {
    _detail = detial;
    notifyListeners();
  }

  set changeloction(String location) {
    _location = location;
    notifyListeners();
  }

  set changebudget(String budget) {
    _budget = budget;
    notifyListeners();
  }

  set changeimageurl(String imgurl) {
    _imageUrl = imgurl;
    notifyListeners();
  }

  set changeoffers(int offers) {
    _offers = offers;
    notifyListeners();
  }

  set changestatus(String status) {
    _status = status;
    notifyListeners();
  }

  //Functions
  loadAll(PostedJobs jobs) {
    if (jobs != null) {
      // _date = DateTime.parse(entry.date);
      _title = jobs.title;
      _jobId = jobs.jobId;
      _detail = jobs.detail;
      _budget = jobs.budget;
      _location = jobs.location;
      _offers = jobs.offers;
      _status = jobs.status;
      _imageUrl = jobs.imageUrl;
    } else {
      // _date = DateTime.now();
      _title = null;
      _jobId = null;
      _detail = null;
      _budget = null;
      _location = null;
      _offers = null;
      _status = null;
      _imageUrl = null;
    }
  }

  savejobs() {
    if (_jobId == null) {
      //Add
      var newjob = PostedJobs(
          title: _title,
          location: _location,
          budget: _budget,
          imageUrl: _imageUrl,
          offers: _offers,
          status: _status,
          detail: _detail,
          jobId: uuid.v1());
      print(newjob.title);
      firestoreService.setjob(newjob);
    } else {
      //Edit
      var updtedjob = PostedJobs(
          title: _title,
          location: _location,
          budget: _budget,
          imageUrl: _imageUrl,
          offers: _offers,
          status: _status,
          detail: _detail,
          jobId: uuid.v1());

      firestoreService.setjob(updtedjob);
    }
  }

  removejob(String jobId) {
    firestoreService.removejob(jobId);
  }
}
