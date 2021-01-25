import 'package:Hunarmand_signIn_Ui/Models/user.dart';
import 'package:Hunarmand_signIn_Ui/Screens/authenticate/testscreen.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/header_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  final _user = new MyUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      // resizeToAvoidBottomPadding: false,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              HeaderContainer("Login"),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _inputcard(hintText: 'Email', icon: Icon(Icons.email)),
                    _inputcard(hintText: "Password", icon: Icon(Icons.vpn_key)),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          //password reset screen....
                        },
                        child: Text(
                          "Forget Password",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                    Center(
                      child: ButtonWidget(
                        onClick: () {
                          _auth.signInWithEmailAndPassword(
                              email: _user.email, password: _user.password);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Logout()),
                          );
                        },
                        btnText: "Login",
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Don't have an account ? ",
                            style: TextStyle(
                                color: Colors.grey[900], fontSize: 16)),
                        TextSpan(
                            text: "Register",
                            style: TextStyle(color: deepOrangeColor)),
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
          //controller: controller,
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

  // ignore: unused_element
  // Widget _textInput({controller, hint, icon}) {
  //   return Container(
  //     margin: EdgeInsets.only(top: 20),
  //     decoration: BoxDecoration(
  //       //color: Colors.white,
  //       borderRadius: BorderRadius.all(Radius.zero),
  //       color: Colors.grey[200],
  //     ),
  //     child: TextFormField(
  //       decoration: InputDecoration(
  //         border: InputBorder.none,
  //         hintText: hint,
  //         // contentPadding: EdgeInsets.only(left: 20),
  //         prefixIcon: Icon(icon),
  //       ),
  //     ),
  //   );
  // }
}
