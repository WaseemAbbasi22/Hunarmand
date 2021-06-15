import 'package:flutter/material.dart';
import 'dart:convert';

class Groups {
  final String icon;
  final String title;
  final String admin;
  final String description;
  final String category;
  final String groupId;
  List<String> members;
  final String recentMessage;
  final String recentMessageSender;
  // final var members[];

  Groups(
      {this.title,
      this.admin,
      this.icon,
      this.description,
      this.category,
      this.recentMessage,
      this.recentMessageSender,
      this.members,
      @required this.groupId});
  void setmembers(List member) {
    this.members = member;
  }

  factory Groups.fromJson(Map<String, dynamic> json) {
    return Groups(
        title: json['title'] ?? 'Group title',
        icon: json['icon'] ?? '',
        admin: json['admin'] ?? 'Group Admin',
        description: json['description'] ?? 'group Description',
        category: json['category'] ?? 'group Category',
        recentMessage: json['recentmessage'] ?? '',
        // members: List<String>.from(json['members']),
        recentMessageSender: json['recentmessagesender'] ?? '',
        groupId: json['groupid']);
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'icon': icon,
      'admin': admin,
      'category': category,
      'description': description,
      'recentmessage': recentMessage,
      'recentmessagesender': recentMessageSender,
      'groupid': groupId,
      'members': members,
    };
  }
}

class GroupMessage {
  final String message;
  final String sender;
  final String time;
  final String messageId;
  GroupMessage({this.message, this.sender, this.time, this.messageId});
  factory GroupMessage.fromJson(Map<String, dynamic> json) {
    return GroupMessage(
        message: json['message'] ?? 'message text',
        sender: json['sender'] ?? '',
        time: json['time'] ?? 'time',
        messageId: json['messageid']);
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'sender': sender,
      'time': time,
      'messageid': messageId,
    };
  }
}
