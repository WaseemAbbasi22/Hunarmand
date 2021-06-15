import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  var btnText = "";
  var onClick;
  var serviceType;

  ButtonWidget({this.btnText, this.onClick, this.serviceType});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 10.0, color: Colors.grey)],
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
              colors: [deepOrangeColor, deepOrangelightColor],
              end: Alignment.centerLeft,
              begin: Alignment.centerRight),
          // borderRadius: BorderRadius.all(
          //   Radius.circular(20),
          // ),
        ),
        alignment: Alignment.center,
        child: Text(
          btnText,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
