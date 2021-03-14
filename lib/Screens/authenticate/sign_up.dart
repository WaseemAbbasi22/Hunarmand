import 'package:Hunarmand_signIn_Ui/Screens/authenticate/components/input_card.dart';
import 'package:Hunarmand_signIn_Ui/Screens/authenticate/components/ordivider.dart';
import 'package:Hunarmand_signIn_Ui/Screens/authenticate/components/socila_icon.dart';
import 'package:Hunarmand_signIn_Ui/Screens/authenticate/login.dart';
import 'package:Hunarmand_signIn_Ui/Screens/home/dashborad.dart';
import 'package:Hunarmand_signIn_Ui/Service/auth.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
import 'package:Hunarmand_signIn_Ui/animation/fade_amination.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:Hunarmand_signIn_Ui/utils/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  // SignUp({Key key}) : super(key: key);
  final String _showScreen;
  SignUp(this._showScreen);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  final authservice = new AuthService();
  String error = '';
  String email = '';
  String password = '';
  bool isSpin = false;
  @override
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
                        "SignUp",
                        style: kAuthTitleStyle,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                      1.3,
                      Text(
                        "Create Account here",
                        style: kAuthTextStyle,
                      )),
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
                            Form(
                              key: _formkey,
                              child: Column(
                                children: <Widget>[
                                  InputCard(
                                      hintText: 'Enter your Email',
                                      icon: Icons.email,
                                      onChange: (val) {
                                        setState(() => email = val);
                                        print(email);
                                      }),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  InputCard(
                                      hintText: 'Enter 6 digit Password',
                                      icon: Icons.email,
                                      onChange: (val) {
                                        setState(() => password = val);
                                        print(password);
                                      }),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 40,
                        ),
                        FadeAnimation(
                          1.5,
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => ALogin('')),
                              // );
                            },
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ALogin(widget._showScreen)));
                              },
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "Already a member ? ",
                                        style: TextStyle(
                                            color: Colors.grey[900],
                                            fontSize: 16)),
                                    TextSpan(
                                      text: "Login",
                                      style: TextStyle(
                                          color: deepOrangeColor, fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        FadeAnimation(
                            1.6,
                            Center(
                              child: ButtonWidget(
                                btnText: "Register",
                                onClick: () async {
                                  try {
                                    User authUser = await authservice
                                        .registerWithEmailandPassword(
                                            email: email, password: password);
                                    if (authUser != null) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeDashboard(
                                                  useremail: authUser.email,
                                                )),
                                      );
                                    }
                                  } catch (e) {
                                    print(e);
                                  }
                                },
                              ),
                            )),
                        OrDivider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SocialIcon(
                              iconSrc: "assets/icons/facebook.svg",
                              press: () {},
                            ),
                            SocialIcon(
                              iconSrc: "assets/icons/google-plus.svg",
                              press: () {},
                            ),
                          ],
                        )
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
