import 'package:Hunarmand_signIn_Ui/Models/user.dart';
import 'package:Hunarmand_signIn_Ui/Screens/duplicate/dashborad.dart';
import 'package:Hunarmand_signIn_Ui/Screens/duplicate/login.dart';
import 'package:Hunarmand_signIn_Ui/Service/auth.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
import 'package:Hunarmand_signIn_Ui/animation/fade_amination.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

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
                        "SignUp",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                      1.3,
                      Text(
                        "Create Account here",
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
                            Form(
                              key: _formkey,
                              child: Column(
                                children: <Widget>[
                                  _inputcard(
                                      hintText: 'Enter your Email',
                                      icon: Icons.email,
                                      onChange: (val) {
                                        setState(() => email = val);
                                        print(email);
                                      }),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  _inputcard(
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
                                      print(authUser.email);
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
                                // onClick: () async {
                                //   if (_formkey.currentState.validate()) {
                                //     dynamic result = await _authService
                                //         .registerWithEmailandPassword(
                                //             email, password);
                                //     if (result == null) {
                                //       setState(() {
                                //         error =
                                //             'Please enter valid information';
                                //         // loading = false;
                                //       });
                                //     }
                                //     // print(_user.getEmail());
                                //     // print(_user.getPass());
                                //   }}
                              ),
                            )),
                        OrDivider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SocalIcon(
                              iconSrc: "assets/icons/facebook.svg",
                              press: () {},
                            ),
                            SocalIcon(
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

  Widget _inputcard(
      {String hintText, IconData icon, var validate, Function onChange}) {
    return Container(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        //margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
        child: TextFormField(
          validator: validate,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(20),
            //enabled: true,
            //filled: true,
            prefixIcon: Icon(icon, color: Colors.deepOrange),
          ),
          onChanged: onChange,
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
