import 'dart:developer';

import 'package:Hunarmand_signIn_Ui/Models/navigation_model.dart';
import 'package:Hunarmand_signIn_Ui/Screens/authenticate/login_screen.dart';
import 'package:Hunarmand_signIn_Ui/Screens/home/slider.dart';
import 'package:Hunarmand_signIn_Ui/Screens/job_services/plumber_service/service_detail_screen.dart';
import 'package:Hunarmand_signIn_Ui/Screens/job_services/plumber_service/services.dart';
import 'package:Hunarmand_signIn_Ui/Screens/sidebar/collapsing_list_tile_widget.dart';
import 'package:flutter/material.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  CollapsingNavigationDrawerState createState() {
    return new CollapsingNavigationDrawerState();
  }
}

class CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 210;
  double minWidth = 70;
  bool isCollapsed = true;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  int currentSelectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => getWidget(context, widget),
    );
  }

  Widget getWidget(context, widget) {
    return Material(
      elevation: 0.0,
      child: Container(
        //margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(top: 10.0),
        width: widthAnimation.value,
        color: Color.fromRGBO(50, 62, 72, 0.8),
        child: Column(
          children: <Widget>[
            // InkWell(
            //   onTap: () {
            //     setState(() {
            //       //Navigator.of(context).pop();
            //       isCollapsed = !isCollapsed;
            //       isCollapsed
            //           ? _animationController.forward()
            //           : _animationController.reverse();
            //     });
            //   },
            //   child: AnimatedIcon(
            //     icon: AnimatedIcons.close_menu,
            //     progress: _animationController,
            //     color: Colors.white,
            //     size: 50.0,
            //   ),
            // ),
            Divider(
              color: Colors.grey,
              height: 40.0,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, counter) {
                  return Divider(height: 12.0);
                },
                itemBuilder: (context, counter) {
                  return CollapsingListTile(
                    onTap: () {
                      setState(() {
                        currentSelectedIndex = counter;
                        // Navigator.of(context).pop(),
                      });
                      switch (counter) {
                        case 0:
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Services()));
                          break;
                        case 1:
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ServiceDetail()));
                          break;
                        case 2:
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                          break;
                        case 3:
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Cslider()));
                          break;
                      }
                    },
                    isSelected: currentSelectedIndex == counter,
                    title: navigationItems[counter].title,
                    icon: navigationItems[counter].icon,
                    animationController: _animationController,
                  );
                },
                itemCount: navigationItems.length,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
