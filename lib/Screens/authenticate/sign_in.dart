import 'package:Hunarmand_signIn_Ui/Screens/authenticate/otp.dart';
import 'package:Hunarmand_signIn_Ui/Screens/login_screen.dart';
import 'package:Hunarmand_signIn_Ui/Service/auth.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/header_widget.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String phone = "";
  String pin = "";
  //TextEditingController _controller = TextEditingController();
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    TapGestureRecognizer _gestureRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      };
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.grey[300],
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          padding: EdgeInsets.only(bottom: 30),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                HeaderContainer("Register"),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      // _textInput(
                      //     hint: "Fullname",
                      //     icon: Icons.person,
                      //     onchange: (value) {
                      //       setState(() {
                      //         _user.setfullName(value);
                      //       });
                      //     }),
                      // _textInput(
                      //     hint: "Email",
                      //     icon: Icons.email,
                      //     onchange: (value) {
                      //       setState(() {
                      //         _user.setemail(value);
                      //       });
                      //     }),
                      _textInput(
                          hint: "Phone Number",
                          icon: Icons.call,
                          onchange: (value) {
                            setState(() {
                              // _user.setphoneNo(value);
                              phone = value;
                              value = '';
                            });
                          }),
                      _textInput(
                          hint: "Enter 4 digit password",
                          icon: Icons.vpn_key,
                          onchange: (value) {
                            setState(() {
                              // _user.setpassword(value);
                            });
                          }),
                      SizedBox(
                        height: 80.0,
                      ),
                      Center(
                        child: ButtonWidget(
                          btnText: "REGISTER",
                          onClick: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => OTPScreen(phone)));
                            // dynamic result = await _auth.signInAnon();
                            // if (result == null) {
                            //   print("Error signin");
                            // } else {
                            //   print("sign In");
                            //   print(result);
                            // }
                            //Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Already a member ? ",
                                style: TextStyle(
                                    color: Colors.grey[900], fontSize: 18)),
                            TextSpan(
                              text: "Login",
                              style: TextStyle(
                                  color: bluegrayColors, fontSize: 14),
                              recognizer: _gestureRecognizer,
                            ),
                          ]),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textInput({controller, hint, icon, dynamic onchange(value)}) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.zero),
        color: Colors.grey[200],
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.phone,
        cursorColor: Colors.grey[900],

        decoration: InputDecoration(
          border: InputBorder.none,
          // enabledBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.white, width: 2.0),
          // ),

          hintText: hint,

          prefixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
        ),
        //keyboardType: TextInputType.emailAddress,

        onChanged: onchange,
      ),
    );
  }
}
