import 'package:Hunarmand_signIn_Ui/Models/user.dart';
import 'package:flutter/material.dart';

class Worker {
  final String workerId;
  final String name;
  final String email;
  final String cnic;
  final String location;
  final int totalJobs;
  final int completeJobs;
  final int pendingJobs;
  final String imageUrl;
  final String dBirth;
  final String level;
  final String mobileNo;
  final String groupId;
  final String skill;
  bool isSelected = false;

  Worker(
      {this.dBirth,
      this.location,
      this.name,
      this.email,
      this.cnic,
      this.mobileNo,
      this.imageUrl,
      this.totalJobs,
      this.pendingJobs,
      this.completeJobs,
      this.level,
      this.groupId,
      this.skill,
      this.isSelected = false,
      @required this.workerId});

  factory Worker.fromJson(Map<String, dynamic> json) {
    return Worker(
        dBirth: json['dateofbirth'] ?? 'your date of birth',
        location: json['location'] ?? 'your location',
        name: json['name'] ?? 'your name',
        email: json['email'] ?? 'your email',
        cnic: json['cninc'] ?? 'your cnic',
        mobileNo: json['mobileno'] ?? 'your phone',
        imageUrl: json['imageurl'] ??
            'https://w7.pngwing.com/pngs/639/452/png-transparent-computer-icons-avatar-user-profile-people-icon-child-face-heroes.png',
        totalJobs: json['totaljobs'] ?? 0,
        pendingJobs: json['pendingjobs'] ?? 0,
        completeJobs: json['completedjobs'] ?? 0,
        level: json['level'] ?? 'your level',
        skill: json['skill'] ?? 'your skill',
        groupId: json['groupid'] ?? 'groupid',
        isSelected: json['isselected'] ?? 'false',
        workerId: json['workerid']);
  }

  Map<String, dynamic> toMap() {
    return {
      'dateofbirth': dBirth,
      'location': location,
      'name': name,
      'email': email,
      'cnic': cnic,
      'mobileno': mobileNo,
      'imageurl': imageUrl,
      'totaljobs': totalJobs,
      'pendingjobs': pendingJobs,
      'completedjobs': completeJobs,
      'level': level,
      'skill': skill,
      'groupid': groupId,
      'workerid': workerId,
      'isselected': isSelected,
    };
  }
}
