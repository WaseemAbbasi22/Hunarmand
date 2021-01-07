import 'package:Hunarmand_signIn_Ui/Models/user.dart';
//import 'package:Hunarmand_signIn_Ui/Screens/login_screen.dart';
import 'package:Hunarmand_signIn_Ui/Screens/verify_screen.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/header_widget.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegPage extends StatefulWidget {
  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  final _user = new MyUser();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            HeaderContainer("Register"),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _textInput(
                        hint: "Fullname",
                        icon: Icons.person,
                        onchange: (value) {
                          setState(() {
                            _user.setfullName(value);
                          });
                        }),
                    _textInput(
                        hint: "Email",
                        icon: Icons.email,
                        onchange: (value) {
                          setState(() {
                            _user.setemail(value);
                          });
                        }),
                    _textInput(
                        hint: "Phone Number",
                        icon: Icons.call,
                        onchange: (value) {
                          setState(() {
                            _user.setphoneNo(value);
                          });
                        }),
                    _textInput(
                        hint: "Password",
                        icon: Icons.vpn_key,
                        onchange: (value) {
                          setState(() {
                            _user.setpassword(value);
                          });
                        }),
                    Expanded(
                      child: Center(
                        child: ButtonWidget(
                          btnText: "REGISTER",
                          onClick: () {
                            _auth.createUserWithEmailAndPassword(
                                email: _user.getemail(),
                                password: _user.getpassword());
                            //Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VerifyScreen()));
                          },
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Already a member ? ",
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                          text: "Login",
                          style: TextStyle(color: orangeColors),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textInput({controller, hint, icon, dynamic onchange(value)}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
        //keyboardType: TextInputType.emailAddress,
        onChanged: onchange,
      ),
    );
  }
}
