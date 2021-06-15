import 'package:Hunarmand_signIn_Ui/Models/job_models/joboffer_model.dart';
import 'package:Hunarmand_signIn_Ui/Service/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class JobOfferProvider with ChangeNotifier {
  final firestoreService = FirestoreService();

  String _jobId;
  String _detail;
  String _offerId;
  String _sender;
  String _senderImgUrl;
  int _budget;
  var uuid = Uuid();

  //Getters
  String get offerdetail => _detail;
  int get offerbudget => _budget;
  String get offerid => _offerId;
  String get offersender => _sender;
  String get offersenderimgurl => _senderImgUrl;
  String get jobid => _jobId;

  Stream<List<JobOffers>> get offers => firestoreService.getoffers(_jobId);

  //Setters

  // String setUseruser() {
  //   String userEmail = firestoreService.getuserEmail().toString();
  //   return userEmail;
  // }

  set changeoffersender(String sender) {
    _sender = sender;
    notifyListeners();
  }

  set changeofferbudget(int budget) {
    _budget = budget;
    notifyListeners();
  }

  set changedetail(String detial) {
    _detail = detial;
    notifyListeners();
  }

  set changesenderurl(String senderurl) {
    _senderImgUrl = senderurl;
    notifyListeners();
  }

  set changejobid(String jobid) {
    _jobId = jobid;
    notifyListeners();
  }

  //Functions
  loadAll(JobOffers offers) {
    if (offers != null) {
      // _date = DateTime.parse(entry.date);
      _sender = offers.sender;
      _jobId = offers.jobId;
      _detail = offers.detail;
      _senderImgUrl = offers.senderImageUrl;
    } else {
      // _date = DateTime.now();
      _sender = null;
      _jobId = null;
      _detail = null;
      _senderImgUrl = null;
    }
  }

  saveoffers() {
    if (_offerId == null) {
      //Add
      var newoffer = JobOffers(
          senderImageUrl: _senderImgUrl,
          sender: _sender,
          jobId: _jobId,
          detail: _detail,
          budget: _budget,
          offerId: uuid.v1());
      firestoreService.setoffer(newoffer);
    } else {
      //Edit
      var updateoffer = JobOffers(
          senderImageUrl: _senderImgUrl,
          sender: _sender,
          jobId: _jobId,
          detail: _detail,
          budget: _budget,
          offerId: uuid.v1());

      firestoreService.setoffer(updateoffer);
    }
  }

  removeoffer(String offerid) {
    firestoreService.removeoffer(offerid);
  }
}
