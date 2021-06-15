import 'package:Hunarmand_signIn_Ui/Screens/authenticate/loggedin_screen.dart';
import 'package:Hunarmand_signIn_Ui/Screens/authenticate/register_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:Hunarmand_signIn_Ui/Service/auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyOTP = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController numberController = new TextEditingController();
  final TextEditingController otpController = new TextEditingController();
  String phoneNo, verificationId, smsCode;
  var isLoading = false;
  var isResend = false;
  var isLoginScreen = true;
  var isOTPScreen = false;
  var verificationCode = '';

  //Form controllers
  // @override
  // void initState() {
  //   if (_auth.currentUser != null) {
  //     Navigator.pushAndRemoveUntil(
  //       context,
  //       MaterialPageRoute(
  //         builder: (BuildContext context) => LoggedInScreen(),
  //       ),
  //       (route) => false,
  //     );
  //   }
  //   super.initState();
  // }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isOTPScreen ? returnOTPScreen() : returnLoginScreen();
  }

  Widget returnLoginScreen() {
    return Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
          title: Text('Login Screen'),
        ),
        body: ListView(children: [
          new Column(
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        child: TextFormField(
                          enabled: !isLoading,
                          controller: numberController,
                          keyboardType: TextInputType.phone,
                          onChanged: (val) {
                            this.phoneNo = '+92' + val.trim();
                          },
                          decoration:
                              InputDecoration(labelText: 'Phone Number'),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter phone number';
                            }
                          },
                        ),
                      )),
                      Container(
                          margin: EdgeInsets.only(top: 40, bottom: 5),
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: !isLoading
                                  ? new ElevatedButton(
                                      onPressed: () async {
                                        if (!isLoading) {
                                          if (_formKey.currentState
                                              .validate()) {
                                            displaySnackBar('Please wait...');
                                            // await verifyPhone(phoneNo);
                                            signInWithPhoneNumber();
                                          }
                                        }
                                      },
                                      child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 15.0,
                                            horizontal: 15.0,
                                          ),
                                          child: new Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Expanded(
                                                  child: Text(
                                                "Sign In",
                                                textAlign: TextAlign.center,
                                              )),
                                            ],
                                          )),
                                    )
                                  : CircularProgressIndicator(
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                    ))),
                      Container(
                          margin: EdgeInsets.only(top: 15, bottom: 5),
                          alignment: AlignmentDirectional.center,
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        "No Account ?",
                                      )),
                                  InkWell(
                                    child: Text(
                                      'Sign up',
                                    ),
                                    onTap: () => {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisterScreen()))
                                    },
                                  ),
                                ],
                              )))
                    ],
                  ))
            ],
          )
        ]));
  }

  Widget returnOTPScreen() {
    return Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
          title: Text('OTP Screen'),
        ),
        body: ListView(children: [
          Form(
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
                    ? Container(
                        margin: EdgeInsets.only(top: 40, bottom: 5),
                        child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: new ElevatedButton(
                              onPressed: () async {
                                if (_formKeyOTP.currentState.validate()) {
                                  // If the form is valid, we want to show a loading Snackbar
                                  // If the form is valid, we want to do firebase signup...
                                  setState(() {
                                    isResend = false;
                                    isLoading = true;
                                  });
                                  try {
                                    await _auth
                                        .signInWithCredential(
                                            PhoneAuthProvider.credential(
                                                verificationId:
                                                    verificationCode,
                                                smsCode: otpController.text
                                                    .toString()))
                                        .then((user) async => {
                                              //sign in was success
                                              if (user != null)
                                                {
                                                  //store registration details in firestore database
                                                  setState(() {
                                                    isLoading = false;
                                                    isResend = false;
                                                  }),
                                                  Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          LoggedInScreen(),
                                                    ),
                                                    (route) => false,
                                                  )
                                                }
                                            })
                                        .catchError((error) => {
                                              setState(() {
                                                isLoading = false;
                                                isResend = true;
                                              }),
                                            });
                                    setState(() {
                                      isLoading = true;
                                    });
                                  } catch (e) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                                }
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
                                        "Submit",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )))
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
                                // await login();
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
          )
        ]));
  }

  displaySnackBar(text) {
    final snackBar = SnackBar(content: Text(text));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  // Future login() async {
  //   setState(() {
  //     isLoading = true;
  //   });

  //   var phoneNumber = '+92' + numberController.text.trim();

  //   //first we will check if a user with this cell number exists
  //   var isValidUser = true;
  // var number = numberController.text.trim();
  // try {
  //   await _firestore
  //       .collection('workers')
  //       .where('mobileno', isEqualTo: number)
  //       .get()
  //       .then((querySnapshot) {
  //     querySnapshot.docs.forEach((result) {
  //       if (result.data().length > 0) {
  //         isValidUser = true;
  //       }
  //       print(result.data());
  //     });
  //     //.doc(_auth.currentUser.uid)
  //     //.where('cellnumber', isEqualTo: number)
  //     //.get()
  //     //.then((result) {
  //     //if (result.docs.length > 0) {
  //     // isValidUser = true;
  //     //}
  //   });
  // } catch (e) {
  //   print("Error is ${e.toString()}");
  // }
  //
  void signInWithPhoneNumber() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationCode,
        smsCode: otpController.text,
      );

      final User user = (await _auth.signInWithCredential(credential)).user;
      if (user != null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => LoggedInScreen(),
          ),
          (route) => false,
        );

        showSnackbar("Successfully signed in UID: ${user.uid}");
      } else {
        showSnackbar("Failed to sign in: ");
      }
    } catch (e) {
      showSnackbar("Failed to sign in: " + e.toString());
    }
  }

  void showSnackbar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  // if (isValidUser) {
  // Future<void> verifyPhone(phoneNo) async {
  //   final PhoneVerificationCompleted verified = (AuthCredential authResult) {
  //     AuthService().phonesignIn(authResult);
  //   };

  //   final PhoneVerificationFailed verificationfailed =
  //       (Exception authException) {
  //     print('${authException.toString()}');
  //   };

  //   final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
  //     this.verificationId = verId;
  //     setState(() {
  //       // this.codeSent = true;
  //     });
  //   };

  //   final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
  //     this.verificationId = verId;
  //   };

  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //       phoneNumber: phoneNo,
  //       timeout: const Duration(seconds: 5),
  //       verificationCompleted: verified,
  //       verificationFailed: verificationfailed,
  //       codeSent: smsSent,
  //       codeAutoRetrievalTimeout: autoTimeout);
  // }

  //ok, we have a valid user, now lets do otp verification
  //   var verifyPhoneNumber = _auth.verifyPhoneNumber(
  //     phoneNumber: phoneNumber,
  //     verificationCompleted: (phoneAuthCredential) {
  //       //auto code complete (not manually)
  //       _auth.signInWithCredential(phoneAuthCredential).then((user) async => {
  //             if (user != null)
  //               {
  //                 //redirect
  //                 setState(() {
  //                   isLoading = false;
  //                   isOTPScreen = false;
  //                 }),
  //                 Navigator.pushAndRemoveUntil(
  //                   context,
  //                   MaterialPageRoute(
  //                     builder: (BuildContext context) => LoggedInScreen(),
  //                   ),
  //                   (route) => false,
  //                 )
  //               }
  //           });
  //     },
  //     verificationFailed: (FirebaseAuthException error) {
  //       displaySnackBar('Validation error, please try again later');
  //       setState(() {
  //         isLoading = false;
  //       });
  //     },
  //     codeSent: (verificationId, [forceResendingToken]) {
  //       setState(() {
  //         isLoading = false;
  //         verificationCode = verificationId;
  //         isOTPScreen = true;
  //       });
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {
  //       setState(() {
  //         isLoading = false;
  //         verificationCode = verificationId;
  //       });
  //     },
  //     timeout: Duration(seconds: 60),
  //   );
  //   await verifyPhoneNumber;
  // var verifyphone = _auth.verifyPhoneNumber(
  //     phoneNumber: phoneNumber,
  //     timeout: Duration(seconds: 60),
  //     codeAutoRetrievalTimeout: (String verificationId) {
  //       setState(() {
  //         isLoading = false;
  //         verificationCode = verificationId;
  //       });
  //     },
  //     verificationCompleted: (AuthCredential credential) async {
  //       Navigator.of(context).pop();

  //       dynamic result = await _auth.signInWithCredential(credential);

  //       User user = result.user;

  //       if (user != null) {
  //         Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => LoginScreen(),
  //             ));
  //       } else {
  //         print("Error");
  //       }

  //       //This callback would gets called when verification is done auto maticlly
  //     });
  // } else {
  //   //non valid user
  //   setState(() {
  //     isLoading = false;
  //   });
  // displaySnackBar('Number not found, please sign up first');
  // }
  // }
}
