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
  final String postedBy;
  final String posterImgurl;
  final String postedDate;
  final String servicetype;
  final String jobtype;

  PostedJobs(
      {this.title,
      this.location,
      this.detail,
      this.budget,
      this.offers,
      this.imageUrl,
      this.status,
      this.postedBy,
      this.posterImgurl,
      this.postedDate,
      this.servicetype,
      this.jobtype,
      @required this.jobId});

  factory PostedJobs.fromJson(Map<String, dynamic> json) {
    return PostedJobs(
        title: json['title'],
        location: json['location'],
        detail: json['detail'],
        budget: json['budget'],
        offers: json['offers'],
        imageUrl: json['imageurl'],
        postedBy: json['postedby'],
        posterImgurl: json['posterimgurl'],
        status: json['status'],
        postedDate: json['posteddate'],
        servicetype: json['servicetype'],
        jobtype: json['jobtype'],
        jobId: json['jobId']);
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title ?? '',
      'location': location ?? '',
      'detail': detail ?? '',
      'budget': budget ?? '',
      'offers': offers ?? 0,
      'imageurl': imageUrl ?? '',
      'status': status ?? '',
      'postedby': postedBy ?? '',
      'posterimgurl': posterImgurl ?? '',
      'posteddate': postedDate ?? '',
      'servicetype': servicetype ?? '',
      'jobtype': jobtype,
      'jobId': jobId,
    };
  }

  factory PostedJobs.fixfromJson(Map<String, dynamic> json) {
    return PostedJobs(
        title: json['title'],
        location: json['location'],
        detail: json['detail'],
        budget: json['budget'],
        offers: json['offers'],
        // imageUrl: json['imageurl'],
        postedBy: json['postedby'],
        posterImgurl: json['posterimgurl'],
        status: json['status'],
        postedDate: json['posteddate'],
        servicetype: json['servicetype'],
        jobtype: json['jobtype'],
        jobId: json['jobId']);
  }

  Map<String, dynamic> fixtoMap() {
    return {
      'title': title ?? '',
      'location': location ?? '',
      'detail': detail ?? '',
      'budget': budget ?? '',
      'offers': offers ?? 0,
      'imageurl': imageUrl ?? '',
      'status': status ?? '',
      'postedby': postedBy ?? '',
      'posteddate': postedDate ?? '',
      'servicetype': servicetype ?? '',
      'jobtype': jobtype,
      'jobId': jobId,
    };
  }
}
