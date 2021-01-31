import 'package:Hunarmand_signIn_Ui/Models/user.dart';
import 'package:Hunarmand_signIn_Ui/Screens/authenticate/testscreen.dart';
import 'package:Hunarmand_signIn_Ui/Screens/duplicate/dashborad.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
import 'package:Hunarmand_signIn_Ui/animation/fade_amination.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/home/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ALogin extends StatefulWidget {
  //ALogin({Key key}) : super(key: key);
  final String _showScreen;
  ALogin(this._showScreen);

  @override
  _ALoginState createState() => _ALoginState();
}

class _ALoginState extends State<ALogin> {
  final _auth = FirebaseAuth.instance;
  final _user = new MyUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.deepOrange[700],
          //Colors.deepOrange[800],
          Colors.deepOrange[400]
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                      1.3,
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 80,
                        ),
                        FadeAnimation(
                            1.4,
                            Column(
                              children: <Widget>[
                                _inputcard(
                                    hintText: 'Enter Phone Number',
                                    icon: Icon(
                                      Icons.phone,
                                      color: Colors.deepOrange,
                                    )),
                                SizedBox(
                                  height: 10.0,
                                ),
                                _inputcard(
                                    hintText: 'Enter Password',
                                    icon: Icon(
                                      Icons.vpn_key,
                                      color: Colors.deepOrange,
                                    )),
                              ],
                            )),
                        SizedBox(
                          height: 40,
                        ),
                        FadeAnimation(
                            1.5,
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 16.0),
                              ),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        FadeAnimation(
                            1.6,
                            Center(
                              child: ButtonWidget(
                                onClick: () {
                                  if (widget._showScreen == 'worker') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WorkerDashboard()),
                                    );
                                  } else if (widget._showScreen == 'client') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomeDashboard()),
                                    );
                                  }
                                  //
                                  // _auth.signInWithEmailAndPassword(
                                  //     email: _user.email,
                                  //     password: _user.password);
                                },
                                btnText: "Login",
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _inputcard({String hintText, Icon icon}) {
    return Container(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        //margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(20),
            //enabled: true,
            //filled: true,
            prefixIcon: icon,

            //suffixIcon: Icon(Icons.filter_list),
          ),
        ),
      ),
    );
  }
}

class SocalIcon extends StatelessWidget {
  final String iconSrc;
  final Function press;
  const SocalIcon({
    Key key,
    this.iconSrc,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.deepOrange,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          iconSrc,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "OR",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: Colors.grey,
        height: 3,
      ),
    );
  }
}
