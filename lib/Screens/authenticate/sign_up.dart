import 'package:Hunarmand_signIn_Ui/Models/user.dart';
import 'package:Hunarmand_signIn_Ui/Screens/authenticate/otp.dart';
import 'package:Hunarmand_signIn_Ui/Screens/authenticate/testscreen.dart';
import 'package:Hunarmand_signIn_Ui/Screens/duplicate/login.dart';
import 'package:Hunarmand_signIn_Ui/Service/auth.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
import 'package:Hunarmand_signIn_Ui/animation/fade_amination.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUp extends StatefulWidget {
  // SignUp({Key key}) : super(key: key);
  final String _showScreen;
  SignUp(this._showScreen);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  AuthService _authService = AuthService();
  String error = '';
  String phone = '';
  String password = '';
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
                                      hintText: 'Enter your Phone No',
                                      icon: Icon(
                                        Icons.phone,
                                        color: Colors.deepOrange,
                                      ),
                                      validate: (val) =>
                                          val.isEmpty ? 'Enter phone ' : null,
                                      onChange: (val) {
                                        setState(() => phone = val);
                                      }),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  _inputcard(
                                      hintText: 'Enter 4 digit Password',
                                      icon: Icon(
                                        Icons.vpn_key,
                                        color: Colors.deepOrange,
                                      ),
                                      validate: (val) => val.isEmpty ||
                                              val.length < 4
                                          ? 'Enter password more than 4 digits '
                                          : null,
                                      onChange: (val) {
                                        setState(() => password = val);
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
                        SizedBox(
                          height: 30,
                        ),
                        FadeAnimation(
                            1.6,
                            Center(
                              child: ButtonWidget(
                                btnText: "Register",
                                onClick: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OTPScreen(
                                            phone, widget._showScreen)),
                                  );
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

  Widget _inputcard({String hintText, Icon icon, var validate, var onChange}) {
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
            prefixIcon: icon,

            //suffixIcon: Icon(Icons.filter_list),
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