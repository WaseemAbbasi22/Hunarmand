import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HeaderContainer extends StatelessWidget {
  var text = "";

  HeaderContainer(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [bluegrayColors, bluegrayLightColor],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
      child: Stack(
        children: <Widget>[
          Positioned(
              bottom: 20,
              right: 20,
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
          Center(
            child: Image.asset("assets/logo.png"),
          ),
        ],
      ),
    );
  }
}