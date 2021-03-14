import 'package:Hunarmand_signIn_Ui/Screens/authenticate/components/input_card.dart';
import 'package:Hunarmand_signIn_Ui/Screens/home/dashborad.dart';
import 'package:Hunarmand_signIn_Ui/Service/auth.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
import 'package:Hunarmand_signIn_Ui/animation/fade_amination.dart';
import 'package:Hunarmand_signIn_Ui/utils/constant.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/home/dashboard.dart';
import 'package:flutter/material.dart';

class ALogin extends StatefulWidget {
  final String _showScreen;
  ALogin(this._showScreen);

  @override
  _ALoginState createState() => _ALoginState();
}

class _ALoginState extends State<ALogin> {
  final authUser = new AuthService();
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: kBoxDecoration,
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
                        style: kAuthTitleStyle,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                    1.3,
                    Text(
                      "Welcome Back",
                      style: kAuthTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: kContainerBoxDecoration,
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
                                InputCard(
                                  hintText: 'Enter Eamil',
                                  onChange: (val) {
                                    email = val;
                                  },
                                  icon: Icons.phone,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                InputCard(
                                  onChange: (val) {
                                    password = val;
                                  },
                                  hintText: 'Enter Password',
                                  icon: Icons.vpn_key,
                                ),
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
                                onClick: () async {
                                  final user = authUser.signInWithEmail(
                                      email: email, password: password);
                                  if (user != null) {
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
                                  }
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
}
