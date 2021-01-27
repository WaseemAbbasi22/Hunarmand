import 'dart:async';
//import 'package:Hunarmand_signIn_Ui/Screens/registration_screen.dart';
import 'package:Hunarmand_signIn_Ui/Screens/home/starter.dart';
import 'package:Hunarmand_signIn_Ui/Screens/splash/body.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   Timer(const Duration(milliseconds: 2000), () {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => StarterScreen()));
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

// Container(
//         decoration: BoxDecoration(
//           // borderRadius: BorderRadius.circular(20.0),
//           image: DecorationImage(
//             image: AssetImage('assets/home_bg.JPG'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Center(
//           child: Image.asset("assets/logo.png"),
//         ),
//       ),
