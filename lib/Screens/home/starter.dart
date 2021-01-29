//import 'package:Hunarmand_signIn_Ui/Screens/HomeScreen.dart';
import 'package:Hunarmand_signIn_Ui/Screens/duplicate/clipper_screen.dart';
import 'package:Hunarmand_signIn_Ui/Screens/duplicate/dashborad.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/awesome_button.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/home/dashboard.dart';
// import 'package:Hunarmand_signIn_Ui/Screens/duplicate/dashborad.dart';
// import 'package:Hunarmand_signIn_Ui/Widgets/drawer.dart';
// import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:flutter/material.dart';

class StarterScreen extends StatelessWidget {
  const StarterScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    onpress: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => WorkerDashboard()));
                    }),
                SizedBox(
                  height: 30.0,
                ),
                AwesomeButton(
                    text: 'Client',
                    icon: Icons.dashboard,
                    cColor: Colors.deepOrange,
                    onpress: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => HomeDashboard()));
                    }),
                SizedBox(
                  height: 30.0,
                ),
                AwesomeButton(
                    text: 'Guest',
                    icon: Icons.dashboard,
                    cColor: Colors.indigoAccent,
                    onpress: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => HomeDashboard()));
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
