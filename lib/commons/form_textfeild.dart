import 'package:flutter/material.dart';

class FormInputFeild extends StatelessWidget {
  //const FormInputFeild({Key key}) : super(key: key);
  final String hintText;
  var ontap;
  var onvalchange;
  int feildHeight;
  FormInputFeild(
      {this.hintText, this.ontap, this.onvalchange, this.feildHeight});

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
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey,
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
