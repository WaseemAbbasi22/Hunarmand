import 'package:flutter/material.dart';

class PostedJobs {
  final String jobId;
  final String title;
  final String detail;
  final String location;
  final int offers;
  final String imageUrl;
  final String status;
  final String budget;

  PostedJobs(
      {this.title,
      this.location,
      this.detail,
      this.budget,
      this.offers,
      this.imageUrl,
      this.status,
      @required this.jobId});

  factory PostedJobs.fromJson(Map<String, dynamic> json) {
    return PostedJobs(
        title: json['title'],
        location: json['location'],
        detail: json['detail'],
        budget: json['budget'],
        offers: json['offers'],
        imageUrl: json['imageurl'],
        status: json['status'],
        jobId: json['jobId']);
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'location': location,
      'detail': detail,
      'budget': budget,
      'offers': offers,
      'imageurl': imageUrl,
      'status': status,
      'jobId': jobId
    };
  }
}
