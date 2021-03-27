import 'package:Hunarmand_signIn_Ui/Models/posted_job_m.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //Get Entries
  Stream<List<PostedJobs>> getJobs() {
    return _db.collection('postedjobs').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => PostedJobs.fromJson(doc.data())).toList());
  }

  //Upsert
  Future<void> setjob(PostedJobs jobs) {
    var options = SetOptions(merge: true);

    return _db
        .collection('postedjobs')
        .doc(jobs.jobId)
        .set(jobs.toMap(), options);
  }

  //Delete
  Future<void> removejob(String jobId) {
    return _db.collection('postedjobs').doc(jobId).delete();
  }
}
