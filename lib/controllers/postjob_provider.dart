import 'package:Hunarmand_signIn_Ui/Models/job_models/posted_job_m.dart';
import 'package:Hunarmand_signIn_Ui/Service/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:uuid/uuid.dart';

class PostedJobProvider with ChangeNotifier {
  final firestoreService = FirestoreService();

  String _jobId;
  String _title;
  String _detail;
  String _location;
  int _offers;
  String _imageUrl;
  String _status;
  String _budget;
  String _postedBy;
  String _posterImgurl;
  DateTime _postedDate;
  String _serviceType;
  String _jobType;
  var uuid = Uuid();

  //Getters
  String get jobtitle => _title;
  String get jobdetail => _detail;
  String get joblocation => _location;
  int get joboffers => _offers;
  String get jobbudget => _budget;
  String get jobimgurl => _imageUrl;
  String get jobstatus => _status;
  String get jobpostedby => _postedBy;
  String get jobposterimgurl => _posterImgurl;
  DateTime get jobposteddate => _postedDate;
  String get servicetype => _serviceType;
  String get jobtype => _jobType;

  Stream<List<PostedJobs>> get jobs => firestoreService.getJobs();
  Stream<List<PostedJobs>> get fixedjobs => firestoreService.getfixedjobs();
  Stream<List<PostedJobs>> get otherjobs => firestoreService.getotherjobs();

  //Setters
  set changeDate(DateTime date) {
    _postedDate = date;
    notifyListeners();
  }

  // String setUseruser() {
  //   String userEmail = firestoreService.getuserEmail().toString();
  //   return userEmail;
  // }

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

  set changepostedby(String poster) {
    _postedBy = poster;
    notifyListeners();
  }

  set changeposterUrl(String imgurl) {
    _posterImgurl = imgurl;
    notifyListeners();
  }

  set changeservicetype(String stype) {
    _serviceType = stype;
    notifyListeners();
  }

  set changejobtype(String jtype) {
    _jobType = jtype;
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
      _postedBy = jobs.postedBy;
      _posterImgurl = jobs.posterImgurl;
      _postedDate = DateTime.parse(jobs.postedDate);
      _serviceType = jobs.servicetype;
      _jobType = jobs.jobtype;
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
      _postedBy = null;
      _posterImgurl = null;
      _postedDate = DateTime.now();
      _serviceType = null;
      _jobType = null;
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
          postedBy: _postedBy,
          posterImgurl: _posterImgurl,
          postedDate: _postedDate.toString(),
          servicetype: _serviceType,
          jobtype: _jobType,
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
          postedBy: _postedBy,
          posterImgurl: _posterImgurl,
          postedDate: _postedDate.toIso8601String(),
          servicetype: _serviceType,
          jobtype: _jobType,
          jobId: uuid.v1());

      firestoreService.setjob(updtedjob);
    }
  }

  savefixjobs() {
    if (_jobId == null) {
      //Add
      var newjob = PostedJobs(
          title: _title,
          location: _location,
          budget: _budget,
          offers: _offers,
          status: _status,
          detail: _detail,
          postedBy: _postedBy,
          posterImgurl: _posterImgurl,
          postedDate: _postedDate.toString(),
          servicetype: _serviceType,
          jobtype: _jobType,
          jobId: uuid.v1());
      print(newjob.title);
      firestoreService.setfixjob(newjob);
    } else {
      //Edit
      var updtedjob = PostedJobs(
          title: _title,
          location: _location,
          budget: _budget,
          offers: _offers,
          status: _status,
          detail: _detail,
          postedBy: _postedBy,
          posterImgurl: _posterImgurl,
          postedDate: _postedDate.toIso8601String(),
          servicetype: _serviceType,
          jobtype: _jobType,
          jobId: uuid.v1());

      firestoreService.setfixjob(updtedjob);
    }
  }

  removejob(String jobId) {
    firestoreService.removejob(jobId);
  }
}
