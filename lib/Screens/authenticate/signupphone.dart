import 'package:Hunarmand_signIn_Ui/Screens/authenticate/components/input_card.dart';
import 'package:Hunarmand_signIn_Ui/Screens/authenticate/components/ordivider.dart';
import 'package:Hunarmand_signIn_Ui/Screens/authenticate/components/socila_icon.dart';
import 'package:Hunarmand_signIn_Ui/Screens/authenticate/login.dart';
import 'package:Hunarmand_signIn_Ui/Screens/home/dashborad.dart';
import 'package:Hunarmand_signIn_Ui/Screens/authenticate/loggedin_screen.dart';

import 'package:Hunarmand_signIn_Ui/Service/auth.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
import 'package:Hunarmand_signIn_Ui/animation/fade_amination.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:Hunarmand_signIn_Ui/utils/constant.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/home/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/services.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class SignUpPhone extends StatefulWidget {
  // SignUp({Key key}) : super(key: key);
  final String _showScreen;
  SignUpPhone(this._showScreen);

  @override
  _SignUpPhoneState createState() => _SignUpPhoneState();
}

class _SignUpPhoneState extends State<SignUpPhone> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyOTP = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController cellnumberController =
      new TextEditingController();
  final TextEditingController otpController = new TextEditingController();

  var isLoading = false;
  var isResend = false;
  var isRegister = true;
  var isOTPScreen = false;
  var verificationCode = '';
  final _formkey = GlobalKey<FormState>();
  final authservice = new AuthService();
  String error = '';
  String phonenumber = '';
  String name = '';
  bool isSpin = false;

  @override
  void initState() {
    authservice.checkAuthentication(widget._showScreen, context);
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    nameController.dispose();
    cellnumberController.dispose();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isOTPScreen ? returnOTPScreen() : registerScreen();
  }

  Widget registerScreen() {
    final node = FocusScope.of(context);
    return Scaffold(
      key: _scaffoldKey,
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
                            //  autovalidateMode: ,
                            key: _formkey,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 10.0),
                                    child: TextFormField(
                                      enabled: !isLoading,
                                      controller: nameController,
                                      textInputAction: TextInputAction.next,
                                      onEditingComplete: () => node.nextFocus(),
                                      decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          labelText: 'Name'),
                                      onChanged: (val) {
                                        setState(() {
                                          name = val;
                                        });
                                      },
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please enter a name';
                                        } else {
                                          return 'name recorded';
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 10.0),
                                    child: TextFormField(
                                      enabled: !isLoading,
                                      keyboardType: TextInputType.phone,
                                      controller: cellnumberController,
                                      textInputAction: TextInputAction.done,
                                      onFieldSubmitted: (_) => node.unfocus(),
                                      decoration: InputDecoration(
                                          hintText: 'Cell Number',
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          labelText: 'Cell Number'),
                                      onChanged: (val) {
                                        setState(() {
                                          phonenumber = val;
                                        });
                                      },
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please enter a cell number';
                                        } else {
                                          return 'valid phonenumber';
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
                                  if (!isLoading) {
                                    setState(() {
                                      isRegister = false;
                                      isOTPScreen = true;
                                    });
                                    // if (_formKey.currentState.validate()) {
                                    final result =
                                        await authservice.registerWithPhoneNo(
                                            phonenumber:
                                                cellnumberController.text);

                                    // If the form is valid, we want to show a loading Snackbar

                                    // } else {
                                    //   print('validate not successfull');
                                    // }
                                  }
                                } catch (e) {
                                  print(e);
                                }
                              },
                            ),
                          ),
                        ),
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

  Widget returnOTPScreen() {
    return Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
          title: Text('Hunarmand'),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
        ),
        body: ListView(children: [
          Center(
            child: Form(
              key: _formKeyOTP,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          child: Text(
                              !isLoading
                                  ? "Enter OTP from SMS"
                                  : "Sending OTP code SMS",
                              textAlign: TextAlign.center))),
                  !isLoading
                      ? Container(
                          child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          child: TextFormField(
                            enabled: !isLoading,
                            controller: otpController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            initialValue: null,
                            autofocus: true,
                            decoration: InputDecoration(
                                labelText: 'OTP',
                                labelStyle: TextStyle(color: Colors.black)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter OTP';
                              }
                            },
                          ),
                        ))
                      : Container(),
                  !isLoading
                      ? FadeAnimation(
                          1.6,
                          Center(
                            child: ButtonWidget(
                              btnText: "Submit",
                              onClick: () async {
                                if (_formKeyOTP.currentState.validate()) {
                                  setState(() {
                                    isResend = false;
                                    isLoading = true;
                                  });
                                  try {
                                    final result =
                                        authservice.signInWithPhoneNumber(
                                            otpController.text,
                                            nameController.text);

                                    if (result != null) {
                                      if (widget._showScreen == 'worker') {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  WorkerDashboard()),
                                        );
                                      } else if (widget._showScreen ==
                                          'client') {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeDashboard()),
                                        );
                                      }
                                    }
                                  } catch (e) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                                }
                              },
                            ),
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  CircularProgressIndicator(
                                    backgroundColor: Colors.deepOrange,
                                  )
                                ].where((c) => c != null).toList(),
                              )
                            ]),
                  isResend
                      ? Container(
                          margin: EdgeInsets.only(top: 40, bottom: 5),
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: new ElevatedButton(
                                onPressed: () async {
                                  setState(() {
                                    isResend = false;
                                    isLoading = true;
                                  });
                                  await authservice.registerWithPhoneNo(
                                      phonenumber: cellnumberController.text);
                                },
                                child: new Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15.0,
                                    horizontal: 15.0,
                                  ),
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Expanded(
                                        child: Text(
                                          "Resend Code",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )))
                      : Column()
                ],
              ),
            ),
          )
        ]));
  }
}
