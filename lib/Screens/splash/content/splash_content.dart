import 'package:Hunarmand_signIn_Ui/commons/screen_size.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Spacer(
        //   flex: 5,
        // ),
        SizedBox(
          height: 80.0,
        ),
        Text(
          "Welcom to HUNARMAND",
          style: TextStyle(
            fontSize: 20,
            color: deepOrangeColor,
            fontWeight: FontWeight.bold,
          ),
        ),

        // Spacer(flex: 4),
        Center(
          child: Image.asset(
            image,
            height: getScreenHeight(200),
            width: getScreenWidth(235),
          ),
        ),
        SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              //letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
              height: 1.5,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
