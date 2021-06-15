import 'package:flutter/material.dart';

class Client {
  final String clientId;
  final String name;
  final String cnic;
  final String email;
  final String address;
  final String picture;
  final String mobileNo;

  Client(
      {this.name,
      this.cnic,
      this.email,
      this.mobileNo,
      this.picture,
      this.address,
      @required this.clientId});

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
        name: json['name'] ?? 'your name',
        cnic: json['cnic'] ?? 'your cnic',
        email: json['email'] ?? 'your email',
        mobileNo: json['mobileno'] ?? 'your phone',
        picture: json['picture'] ??
            'https://w7.pngwing.com/pngs/639/452/png-transparent-computer-icons-avatar-user-profile-people-icon-child-face-heroes.png',
        address: json['address'] ?? 'your location',
        clientId: json['userid']);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'cnic': cnic,
      'email': email,
      'mobileno': mobileNo,
      'picture': picture,
      'address': address,
      'userid': clientId,
    };
  }
}
