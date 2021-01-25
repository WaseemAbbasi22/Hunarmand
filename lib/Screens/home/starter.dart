//import 'package:Hunarmand_signIn_Ui/Screens/HomeScreen.dart';
import 'package:Hunarmand_signIn_Ui/Screens/duplicate/clipper_screen.dart';
import 'package:Hunarmand_signIn_Ui/Screens/duplicate/dashborad.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/drawer.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:flutter/material.dart';

class StarterScreen extends StatelessWidget {
  const StarterScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFF81F2836),
      appBar: AppBar(
        backgroundColor: deepOrangeColor,
        elevation: 0,
        title: Text("HUNARMAND"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () => {},
          ),
        ],
      ),
      drawer: MainDrawer(),

      // drawer: Drawer(
      //   child: CollapsingNavigationDrawer(),
      //   elevation: 0.0,
      // ),
      body: Stack(
        children: <Widget>[
          //,
          //ClipperDesign(),
          HomeDashboard(),
          //Home(),
          // HomeS(),

          //CollapsingNavigationDrawer(),
        ],
      ),
    );
  }
}
