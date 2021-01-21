import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  //hintText: 'Email',
  //focusColor: Colors.white,
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    //borderRadius: BorderRadius.circular(20.0),
    //borderRadius: BorderRadius.circular(10.0),
  ),
  enabled: true,
);
