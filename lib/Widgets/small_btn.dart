import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SmallButton extends StatelessWidget {
  var btnText = "";
  var onClick;

  SmallButton({this.btnText, this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        width: 170,
        height: 50,
        decoration: BoxDecoration(
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
