import 'package:Hunarmand_signIn_Ui/Screens/duplicate/clipper_screen.dart';
import 'package:Hunarmand_signIn_Ui/Screens/registration_screen.dart';
import 'package:Hunarmand_signIn_Ui/Screens/services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainDrawer extends StatefulWidget {
  MainDrawer({Key key}) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    String uimage = 'assets/user_img.jpg';
    Color dcolor = Colors.grey[600];
    bool show = true;
    return Drawer(
      child: Container(
        color: Colors.grey[300],
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10.0),
              color: Colors.orange[700],
              child: Column(
                // mainAxisAlignment: .s,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(uimage), fit: BoxFit.cover)),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'username',
                    style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                  ),
                  Text(
                    'username@gmail.com',
                    style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0.0),
            _containerWidget(),
            SizedBox(
              height: 5.0,
            ),
            _containersecondWidget(),
            SizedBox(
              height: 10.0,
            ),
            if (show) ...[
              Container(
                color: Colors.white,
                child: _listtiles(
                    text: 'LogOut',
                    icon: FontAwesomeIcons.arrowLeft,
                    onClick: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClipperDesign()));
                    }),
              ),
            ] else ...[
              Text('Login'),
            ],
          ],
        ),
      ),
    );
  }

  Widget _containerWidget() {
    Color dcolor = Colors.grey[600];
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 5.0),
      //padding: EdgeInsets.symmetric(horizontal: 10.0),
      color: Colors.white,
      child: Column(
        children: [
          _listtiles(
              text: 'Profile',
              icon: FontAwesomeIcons.userAlt,
              onClick: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Services()));
              }),
          Divider(
            color: dcolor,
            indent: 20.0,
          ),
          _listtiles(
            text: 'Orders',
            icon: FontAwesomeIcons.box,
          ),
          Divider(
            color: dcolor,
            indent: 20.0,
          ),
          _listtiles(text: 'Notifications', icon: FontAwesomeIcons.solidBell),
          // Divider(
          //   color: dcolor,
          //   indent: 20.0,
          //   endIndent: 20.0,
          // ),
        ],
      ),
    );
  }

  Widget _containersecondWidget() {
    Color dcolor = Colors.grey[600];
    return Container(
      //margin: EdgeInsets.symmetric(horizontal: 5.0),
      //padding: EdgeInsets.symmetric(horizontal: 10.0),
      color: Colors.white,
      child: Column(
        children: [
          _listtiles(
              text: 'Register',
              icon: FontAwesomeIcons.userLock,
              onClick: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegPage()));
              }),
          Divider(
            color: dcolor,
            indent: 20.0,
            //endIndent: 20.0,
          ),
          _listtiles(text: 'Tasks', icon: FontAwesomeIcons.tasks),
          Divider(
            color: dcolor,
            indent: 20.0,
            //endIndent: 20.0,
          ),
          _listtiles(text: 'Feedback', icon: FontAwesomeIcons.solidIdBadge),
          // Divider(
          //   color: dcolor,
          //   indent: 20.0,
          //   endIndent: 20.0,
          // ),
        ],
      ),
    );
  }

  Widget _listtiles({String text, IconData icon, Function onClick}) {
    double iSize = 20.0;
    Color iColor = Colors.orange;
    return ListTile(
      leading: FaIcon(
        icon,
        size: iSize,
        color: iColor,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: Colors.grey[700],
          fontSize: 18,
        ),
      ),
      onTap: onClick,
    );
  }
}
