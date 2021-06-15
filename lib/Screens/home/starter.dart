//import 'package:Hunarmand_signIn_Ui/Screens/HomeScreen.dart'

import 'package:Hunarmand_signIn_Ui/Screens/authenticate/login_screen.dart';
import 'package:Hunarmand_signIn_Ui/Screens/authenticate/phone_auth/sceens/getphone.dart';
import 'package:Hunarmand_signIn_Ui/Screens/authenticate/register_screen.dart';
import 'package:Hunarmand_signIn_Ui/Screens/authenticate/sign_up.dart';
import 'package:Hunarmand_signIn_Ui/Screens/authenticate/signupphone.dart';

import 'package:Hunarmand_signIn_Ui/Screens/home/dashborad.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/awesome_button.dart';
import 'package:connectivity/connectivity.dart';

// import 'package:Hunarmand_signIn_Ui/Screens/duplicate/dashborad.dart';
// import 'package:Hunarmand_signIn_Ui/Widgets/drawer.dart';
// import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:flutter/material.dart';

class StarterScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            //height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/app_bg_2.JPG'), fit: BoxFit.fill),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AwesomeButton(
                    text: 'Worker',
                    icon: Icons.dashboard,
                    cColor: Colors.greenAccent,
                    onpress: () async {
                      bool res = await _checkInternetConnectivity(context);
                      if (!res) {
                        _showDialoge('No internet...',
                            'Check your connection and try again', context);
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => SignUpPhone('worker')));
                      }

                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (_) => SignUpPhone('worker')));
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (_) => PhoneAuthGetPhone()));
                    }),
                SizedBox(
                  height: 30.0,
                ),
                AwesomeButton(
                    text: 'Client',
                    icon: Icons.dashboard,
                    cColor: Colors.deepOrange,
                    onpress: () async {
                      bool res = await _checkInternetConnectivity(context);
                      if (!res) {
                        _showDialoge('No internet...',
                            'Check your connection and try again', context);
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => SignUpPhone('client')));
                      }
                    }),
                SizedBox(
                  height: 30.0,
                ),
                // AwesomeButton(
                //     text: 'Guest',
                //     icon: Icons.dashboard,
                //     cColor: Colors.indigoAccent,
                //     onpress: () {
                //       Navigator.pushReplacement(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => HomeDashboard()));
                //     }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> _checkInternetConnectivity(BuildContext context) async {
    var result = await Connectivity().checkConnectivity();
    // String res;
    if (result == ConnectivityResult.none) {
      // res = 'No internet';
      // Scaffold.of(context).showSnackBar(SnackBar(
      //   content: Text('No internet... Please check your connection'),
      //   duration: Duration(seconds: 3),
      // ));
      return false;
    } else {
      // res = 'connected';
      // Scaffold.of(context).showSnackBar(SnackBar(
      //   content: Text('connected'),
      //   duration: Duration(seconds: 3),
      // ));
      return true;
    }
  }

  _showDialoge(title, text, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(text),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Ok'))
            ],
          );
        });
  }
}
