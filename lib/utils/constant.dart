import 'package:flutter/material.dart';

final kAuthTextStyle =
    TextStyle(color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold);
final kImportantTextStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Quicksand',
);
final kNormalTextStyle = TextStyle(
  color: Colors.grey[900],
  fontWeight: FontWeight.w700,
  fontSize: 14.0,
  letterSpacing: 1.5,
  //fontWeight: FontWeight.bold,
);
final kTabBarTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 18.0,
    fontFamily: 'avenir',
    fontWeight: FontWeight.w600);
final kBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    colors: [
      Colors.deepOrange[700],
      Colors.deepOrange[400],
    ],
  ),
);
final kAuthTitleStyle = TextStyle(color: Colors.white, fontSize: 40);
final kContainerBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(60),
    topRight: Radius.circular(60),
  ),
);
