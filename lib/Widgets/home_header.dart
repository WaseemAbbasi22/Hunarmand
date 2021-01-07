import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeHeaderContainer extends StatelessWidget {
  //var text = "Login";

  //HeaderContainer(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.19,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.blue],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(400),
              bottomRight: Radius.circular(400))),
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 50),
              height: 300,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Kia kaam karvana Chaty han?"),
                  ),
                ),
              ),
            ),
          )
          // Text(
          //   text,
          //   style: TextStyle(color: Colors.white, fontSize: 20),
          // ),
          // Center(
          //   child: Image.asset("assets/logo.png"),
          // ),
        ],
      ),
    );
  }
}
