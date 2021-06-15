import 'package:flutter/material.dart';

class JobOffers {
  final String offerId;
  final String jobId;
  final String detail;
  final int budget;
  final String senderImageUrl;
  final String sender;

  JobOffers(
      {@required this.offerId,
      this.sender,
      this.detail,
      this.budget,
      this.senderImageUrl,
      this.jobId});

  factory JobOffers.fromJson(Map<String, dynamic> json) {
    return JobOffers(
        detail: json['detail'] ?? 'offer detail',
        budget: json['budget'] ?? 0,
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
      'budget': budget,
      'offerid': offerId,
      'imageurl': senderImageUrl,
      'jobId': jobId,
    };
  }
}
