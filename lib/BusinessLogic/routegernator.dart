import 'dart:developer';

import 'package:Hunarmand_signIn_Ui/Models/service_model.dart';
import 'package:Hunarmand_signIn_Ui/Screens/HomeScreen.dart';
import 'package:Hunarmand_signIn_Ui/Screens/service_detail_screen.dart';
import 'package:Hunarmand_signIn_Ui/Screens/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteGernator {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    final arg = setting.arguments;
    switch (setting.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => Home());
      case '/services':
        return MaterialPageRoute(builder: (_) => ServiceDetail());
      default:
        return MaterialPageRoute(builder: (_) => Error());
    }
  }
}

class Error extends StatelessWidget {
  const Error({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Error while loading page:',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
