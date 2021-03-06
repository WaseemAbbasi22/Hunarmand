import 'package:Hunarmand_signIn_Ui/Screens/home/starter.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/notifications.dart';
import 'package:Hunarmand_signIn_Ui/controllers/appstate_controller.dart';
import 'package:Hunarmand_signIn_Ui/enum/appstate.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/group_screen/mygroup_screen.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/group_screen/pages/home_page.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/myorders.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/mypostedjobs/my_orderhome.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/mypostedjobs/my_fixedorders.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/verification/ids_verification.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/workerProfile/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
String userEamil;
String userPhone;
String uid;
String uname;

class MainDrawer extends StatefulWidget {
  final String showscreen;
  MainDrawer({this.showscreen});

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  // var document = FirebaseFirestore.instance
  //     .collection('clients')
  //     .doc(_auth.currentUser.uid);

  // String userName =  document[''];
  @override
  void initState() {
    print('show screen is');
    print(widget.showscreen);
    uid = _auth.currentUser.uid;
    setState(() {
      userEamil = _auth.currentUser.email;
      userPhone = _auth.currentUser.phoneNumber;
      uname = _auth.currentUser.displayName;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final stateprovider =
        Provider.of<AppStateController>(context, listen: false);
    String uimage = 'assets/images/user_avatar.png';
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
              // color: Colors.orange[700],
              color: deepOrangeColor,

              child: Column(
                // mainAxisAlignment: .s,
                children: [
                  stateprovider.viewState == ViewState.Busy
                      ? CircularProgressIndicator(
                          backgroundColor: Colors.deepOrange,
                          semanticsLabel: "Loading Data",
                        )
                      : Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(uimage),
                                  fit: BoxFit.cover)),
                        ),
                  SizedBox(height: 10.0),
                  Text(
                    uname ?? " user name",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    userPhone ?? "user phone",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0.0),
            _containerWidget(),
            // SizedBox(
            //   height: 5.0,
            // ),

            _containersecondWidget(),
            // SizedBox(
            //   height: 10.0,
            // ),

            if (show) ...[
              Container(
                color: Colors.white,
                child: _listtiles(
                    text: 'LogOut',
                    icon: FontAwesomeIcons.arrowLeft,
                    onClick: () {
                      _auth.signOut();
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StarterScreen()));
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfilePage(
                              uid: uid,
                            )));
              }),
          Divider(
            color: dcolor,
            indent: 20.0,
          ),
          widget.showscreen == 'client'
              ? _listtiles(
                  text: 'My Jobs',
                  icon: FontAwesomeIcons.box,
                  onClick: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        //  MaterialPageRoute(builder: (context) => SignIn()));

                        MaterialPageRoute(builder: (context) => Orderstate()));
                  })
              : _listtiles(
                  text: 'My Orders',
                  icon: FontAwesomeIcons.box,
                  onClick: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        //  MaterialPageRoute(builder: (context) => SignIn()));

                        MaterialPageRoute(builder: (context) => MyOrders()));
                  }),
          Divider(
            color: dcolor,
            indent: 20.0,
          ),
          _listtiles(
              text: 'Notifications',
              icon: FontAwesomeIcons.solidBell,
              onClick: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationPage()));
                // Navigator.pop(context);
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => ALogin()));
              }),
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
          // _listtiles(
          //     text: 'Register',
          //     icon: FontAwesomeIcons.userLock,
          //     onClick: () {
          //       Navigator.pop(context);
          //       Navigator.push(
          //           context,
          //           //  MaterialPageRoute(builder: (context) => SignIn()));

          //           MaterialPageRoute(builder: (context) => Authenticate()));
          //     }),
          Divider(
            color: dcolor,
            indent: 20.0,
            //endIndent: 20.0,
          ),
          _listtiles(
              text: 'Verification',
              icon: Icons.verified_user_sharp,
              onClick: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    //  MaterialPageRoute(builder: (context) => SignIn()));

                    MaterialPageRoute(
                        builder: (context) => IdVerification(
                              uid: uid,
                            )));
              }),

          Divider(
            color: dcolor,
            indent: 20.0,
            //endIndent: 20.0,
          ),
          _listtiles(
              text: 'MY Groups',
              icon: Icons.group,
              onClick: () {
                Navigator.pop(context);
                Navigator.push(
                    // context, MaterialPageRoute(builder: (context) => SignUp()));

                    context,
                    // MaterialPageRoute(builder: (context) => MyGroups()));
                    MaterialPageRoute(builder: (context) => HomePage()));
              }),
          Divider(
            color: dcolor,
            indent: 20.0,
            endIndent: 20.0,
          ),
        ],
      ),
    );
  }

  Widget _listtiles({String text, IconData icon, Function onClick}) {
    double iSize = 20.0;
    //Color iColor = Colors.orange;
    Color iColor = deepOrangelightColor;
    Color fcolor = Colors.white;
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
