// import 'package:flutter/material.dart';

// class FixedJobs {
//   final String jobId;
//   final String detail;
//   final String location;
//   final int offers;
//   final String status;
//   final double price;
//   final double quantity;
//   final String postedBy;
//   final String postedDate;

//   FixedJobs(
//       {this.title,
//       this.location,
//       this.detail,
//       this.budget,
//       this.offers,
//       this.imageUrl,
//       this.status,
//       this.postedBy,
//       this.posterImgurl,
//       this.postedDate,
//       @required this.jobId});

//   factory FixedJobs.fromJson(Map<String, dynamic> json) {
//     return FixedJobs(
//         title: json['title'],
//         location: json['location'],
//         detail: json['detail'],
//         budget: json['budget'],
//         offers: json['offers'],
//         imageUrl: json['imageurl'],
//         postedBy: json['postedby'],
//         posterImgurl: json['posterimgurl'],
//         status: json['status'],
//         postedDate: json['posteddate'],
//         jobId: json['jobId']);
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'title': title ?? '',
//       'location': location ?? '',
//       'detail': detail ?? '',
//       'budget': budget ?? '',
//       'offers': offers ?? 0,
//       'imageurl': imageUrl ?? '',
//       'status': status ?? '',
//       'postedby': postedBy ?? '',
//       'posterimgurl': posterImgurl ?? '',
//       'posteddate': postedDate ?? '',
//       'jobId': jobId,
//     };
//   }
// }
