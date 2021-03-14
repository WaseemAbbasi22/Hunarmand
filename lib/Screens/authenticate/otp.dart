// import 'package:Hunarmand_signIn_Ui/Screens/authenticate/login.dart';
// import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
// import 'package:Hunarmand_signIn_Ui/utils/color.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:pinput/pin_put/pin_put.dart';

// class OTPScreen extends StatefulWidget {
//   //OTPScreen({Key key}) : super(key: key);
//   final String _phoneNo;
//   final String _showScreen;
//   OTPScreen(this._phoneNo, this._showScreen);

//   @override
//   OTPScreenState createState() => OTPScreenState();
// }

// class OTPScreenState extends State<OTPScreen> {
//   String _verificationCode;
//   final TextEditingController _pinPutController = TextEditingController();
//   final FocusNode _pinPutFocusNode = FocusNode();
//   final BoxDecoration pinPutDecoration = BoxDecoration(
//     color: Colors.grey,
//     borderRadius: BorderRadius.circular(10.0),
//     border: Border.all(
//       color: Colors.grey,
//     ),
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(children: [
//         Container(
//           decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage('assets/icons/otp_bg.JPG'),
//                   fit: BoxFit.contain)),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 50.0,
//                 ),
//                 Text(
//                   'Verify phone ',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: deepOrangeColor,
//                       fontSize: 26),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 80),
//                   child: Center(
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 250.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SizedBox(height: 20.0),
//                           Text(
//                             'please Enter verification code send to',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                                 fontSize: 18),
//                           ),
//                           SizedBox(
//                             height: 10.0,
//                           ),
//                           Text(
//                             '+92-${widget._phoneNo}',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                                 fontSize: 20),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(30.0),
//                   child: PinPut(
//                     fieldsCount: 6,
//                     textStyle:
//                         const TextStyle(fontSize: 25.0, color: Colors.white),
//                     eachFieldWidth: 40.0,
//                     eachFieldHeight: 55.0,
//                     focusNode: _pinPutFocusNode,
//                     controller: _pinPutController,
//                     submittedFieldDecoration: pinPutDecoration,
//                     selectedFieldDecoration: pinPutDecoration,
//                     followingFieldDecoration: pinPutDecoration,
//                     pinAnimationType: PinAnimationType.fade,
//                     // onSubmit: (pin) async {
//                     //   try {
//                     //     await FirebaseAuth.instance
//                     //         .signInWithCredential(PhoneAuthProvider.credential(
//                     //             verificationId: _verificationCode, smsCode: pin))
//                     //         .then((value) async {
//                     //       if (value.user != null) {
//                     //         Navigator.pushAndRemoveUntil(
//                     //             context,
//                     //             MaterialPageRoute(builder: (context) => Home()),
//                     //             (route) => false);
//                     //       }
//                     //     });
//                     //   } catch (e) {
//                     //     FocusScope.of(context).unfocus();
//                     // _scaffoldkey.currentState
//                     //     .showSnackBar(SnackBar(content: Text('invalid OTP')));
//                     // }
//                     // },
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 ButtonWidget(
//                     btnText: 'Verify',
//                     onClick: () {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => ALogin(widget._showScreen)),
//                       );
//                     })
//               ],
//             ),
//           ),
//         ),
//       ]),
//     );
//   }

//   _verifyPhone() async {
//     await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: '+9${widget._phoneNo}',
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           await FirebaseAuth.instance
//               .signInWithCredential(credential)
//               .then((value) async {
//             if (value.user != null) {
//               Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(builder: (context) => Home()),
//                   (route) => false);
//             }
//           });
//         },
//         verificationFailed: (FirebaseAuthException e) {
//           print(e.message);
//         },
//         codeSent: (String verficationID, int resendToken) {
//           setState(() {
//             _verificationCode = verficationID;
//           });
//         },
//         codeAutoRetrievalTimeout: (String verificationID) {
//           setState(() {
//             _verificationCode = verificationID;
//           });
//         },
//         timeout: Duration(seconds: 120));
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _verifyPhone();
//   }
// }
