import 'package:flutter/material.dart';

class JobOffers {
  final String offerId;
  final String jobId;
  final String detail;
  final String senderImageUrl;
  final String sender;

  JobOffers(
      {@required this.offerId,
      this.sender,
      this.detail,
      this.senderImageUrl,
      this.jobId});

  factory JobOffers.fromJson(Map<String, dynamic> json) {
    return JobOffers(
        detail: json['detail'] ?? 'offer detail',
        senderImageUrl: json['imageurl'] ??
            'https://w7.pngwing.com/pngs/639/452/png-transparent-computer-icons-avatar-user-profile-people-icon-child-face-heroes.png',
        sender: json['sender'] ?? 'sender name',
        offerId: json['offerid'],
        jobId: json['jobId']);
  }

  Map<String, dynamic> toMap() {
    return {
      'detail': detail,
      'sender': sender,
      'offerid': offerId,
      'imageurl': senderImageUrl,
      'jobId': jobId,
    };
  }
}
