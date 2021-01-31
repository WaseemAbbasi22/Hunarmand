import 'package:flutter/material.dart';

class FormInputFeild extends StatelessWidget {
  //const FormInputFeild({Key key}) : super(key: key);
  final String hintText;
  var ontap;
  var onvalchange;
  int feildHeight;
  String labelText;
  FormInputFeild(
      {this.hintText,
      this.ontap,
      this.onvalchange,
      this.feildHeight,
      this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: TextField(
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                letterSpacing: 1.5),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.blueGrey,
              fontSize: 18.0,
            ),
            fillColor: Colors.white,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          ),
          maxLines: feildHeight,
        ),
      ),
    );
  }
}
