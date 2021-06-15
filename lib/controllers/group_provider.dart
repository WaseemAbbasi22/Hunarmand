import 'package:Hunarmand_signIn_Ui/Models/group_modle.dart';
import 'package:Hunarmand_signIn_Ui/Models/workermodel.dart';
import 'package:Hunarmand_signIn_Ui/Service/firestore_service.dart';
import 'package:Hunarmand_signIn_Ui/Service/groupmanagement_services/group_dbservice.dart';
import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';

class GroupProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  final groupdbservice = GroupDatabaseService();

  String _icon;
  String _title;
  String _groupdescription;
  String _groupcategory;
  String _admin;
  String _groupId;
  List<String> _members;
  String _recentMessage;
  String _recentMessageSender;
  String _groupnamesearch;
  String _groupqueryid;
  String _messagebody;
  String _messagesender;
  String _messagetime;
  String _messageId;
  var uuid = Uuid();

  //Getters
  String get grouptitle => _title;
  String get groupicon => _icon;
  String get groupadmin => _admin;
  String get groupdecription => _groupdescription;
  String get groupcategroy => _groupcategory;
  String get recentmessage => _recentMessage;
  List get groupmembers => _members;
  String get recentmessagesender => _recentMessageSender;
  String get groupid => _groupId;
  String get groupqueryid => _groupqueryid;
  String get groupnamesearch => _groupnamesearch;
  String get messagesender => _messagesender;
  String get messageid => _messageId;
  String get messagetime => _messagetime;
  String get messagebody => _messagebody;
  Stream<List<Worker>> get members => groupdbservice.getmembers();

  Stream<List<Groups>> get groups => groupdbservice.getgroups();
  Stream<List<Groups>> get groupsearch =>
      groupdbservice.getgroupsbyname(_groupnamesearch);
  Stream<List<GroupMessage>> get chats => groupdbservice.getchats(_icon);
  // void removegroup(String id) {
  //   groupdbservice.removegroup(id);
  // }

  set addtolist(String id) {
    groupdbservice.addtolist(id);
    notifyListeners();
  }

  void updategroupinfo(String gid, List members) {
    groupdbservice.updategroupmembers(gid, members);
  }
  //Setters

  set changetitle(String title) {
    _title = title;
    notifyListeners();
  }

  set changedecription(String decription) {
    _groupdescription = decription;
    notifyListeners();
  }

  set changecategory(String category) {
    _groupcategory = category;
    notifyListeners();
  }

  set changegroupid(String groupid) {
    _groupqueryid = groupid;
    notifyListeners();
  }

  set changeicon(String icon) {
    _icon = icon;
    notifyListeners();
  }

  set changegroupnamesearch(String tosearch) {
    _groupnamesearch = tosearch;
    notifyListeners();
  }

  set changeadmin(String admin) {
    _admin = admin;
    notifyListeners();
  }

  set changerecentmessage(String recentmessage) {
    _recentMessage = recentmessage;
    notifyListeners();
  }

  set changerecentmessagesender(String recentmessagesender) {
    _recentMessageSender = recentmessagesender;
    notifyListeners();
  }

  set changemembers(List members) {
    _members = members;
    notifyListeners();
  }

  set changemessagebody(String body) {
    _messagebody = body;
    notifyListeners();
  }

  set changemessageid(String messageid) {
    _messageId = messageid;
    notifyListeners();
  }

  set changemessagetime(String time) {
    _messagetime = time;
    notifyListeners();
  }

  set changemessagesender(String sender) {
    _messagesender = sender;
    notifyListeners();
  }

  // void setgroupid(String id) {
  //  this.changegroupid(id);
  // }

  //Functions
  loadAll(Groups groups) {
    if (groups != null) {
      // _date = DateTime.parse(entry.date);
      _title = groups.title;
      _icon = groups.icon;
      _admin = groups.admin;
      _recentMessage = groups.recentMessage;
      _recentMessageSender = groups.recentMessageSender;
      _members = groups.members;
      _groupId = groups.groupId;
    } else {
      // _date = DateTime.now();
      _title = null;
      _icon = null;
      _admin = null;
      _recentMessage = null;
      _recentMessageSender = null;
      _members = null;
      _groupId = null;
    }
  }

  savegroup() {
    if (_groupId == null) {
      //Add
      var newgroup = Groups(
          title: _title,
          icon: _icon,
          admin: _admin,
          members: _members,
          category: _groupcategory,
          description: _groupdescription,
          recentMessage: _recentMessage,
          recentMessageSender: _recentMessageSender,
          groupId: uuid.v1());
      print(newgroup.title);
      groupdbservice.setgroup(newgroup);
    } else {
      //Edit
      var updtedgroup = Groups(
        groupId: uuid.v1(),
        icon: _icon,
        admin: _admin,
        category: _groupcategory,
        description: _groupdescription,
        recentMessage: _recentMessage,
        members: _members,
        recentMessageSender: _recentMessageSender,
      );
      groupdbservice.setgroup(updtedgroup);
    }
  }

  removegroup(String groupid) {
    groupdbservice.removegroup(groupid);
  }

  savemessage() {
    if (_messageId == null) {
      //Add
      var newmessage = GroupMessage(
          message: _messagebody,
          sender: _messagesender,
          time: _messagetime,
          messageId: uuid.v1());

      groupdbservice.sendMessage(newmessage, _icon);
    }
  }
}
