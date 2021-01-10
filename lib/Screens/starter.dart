//import 'package:Hunarmand_signIn_Ui/Screens/HomeScreen.dart';
import 'package:Hunarmand_signIn_Ui/Screens/HomeScreen.dart';
import 'package:Hunarmand_signIn_Ui/Screens/duplicate/Home2.dart';
import 'package:Hunarmand_signIn_Ui/Screens/duplicate/clipper_screen.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/drawer.dart';
import 'package:Hunarmand_signIn_Ui/sidebar/collapsing_navigation_drawer_widget.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:flutter/material.dart';

class StarterScreen extends StatelessWidget {
  const StarterScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Color(0xFF81F2836),
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          elevation: 0,
          title: Text("HUNARMAND"),
          centerTitle: true,
        ),
        drawer: MainDrawer(),

        // drawer: Drawer(
        //   child: CollapsingNavigationDrawer(),
        //   elevation: 0.0,
        // ),
        body: Stack(
          children: <Widget>[
            //,
            ClipperDesign(),
            //Home(),
            // HomeS(),

            //CollapsingNavigationDrawer(),
          ],
        ),
      ),
    );
  }
}
