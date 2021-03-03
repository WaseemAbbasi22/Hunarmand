// import 'package:Hunarmand_signIn_Ui/Models/user.dart';
// import 'package:Hunarmand_signIn_Ui/Screens/authenticate/login_screen.dart';
// import 'package:Hunarmand_signIn_Ui/Screens/authenticate/verify_screen.dart';
// import 'package:Hunarmand_signIn_Ui/Service/auth.dart';
// import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
// import 'package:Hunarmand_signIn_Ui/Widgets/feild_decoration.dart';
// import 'package:Hunarmand_signIn_Ui/Widgets/header_widget.dart';
// import 'package:Hunarmand_signIn_Ui/Widgets/loading.dart';
// import 'package:Hunarmand_signIn_Ui/utils/color.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';

// class RegPage extends StatefulWidget {
//   @override
//   _RegPageState createState() => _RegPageState();
// }

// class _RegPageState extends State<RegPage> {
//   final _user = new MyUser();
//   AuthService _authService = AuthService();
//   final _formkey = GlobalKey<FormState>();
//   String error = '';
//   String email = '';
//   String password = '';
//   bool loading = false;
//   //final _auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     TapGestureRecognizer _gestureRecognizer = TapGestureRecognizer()
//       ..onTap = () {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => LoginScreen()));
//       };
//     return Scaffold(
//       //resizeToAvoidBottomPadding: false,
//       backgroundColor: Colors.grey[300],
//       body: GestureDetector(
//         onTap: () {
//           FocusScope.of(context).requestFocus(FocusNode());
//         },
//         child: Container(
//           padding: EdgeInsets.only(bottom: 30),
//           child: SingleChildScrollView(
//             child: Column(
//               children: <Widget>[
//                 HeaderContainer("Register"),
//                 Container(
//                   margin: EdgeInsets.only(left: 20, right: 20, top: 30),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     children: <Widget>[
//                       Form(
//                         key: _formkey,
//                         child: Column(
//                           children: <Widget>[
//                             SizedBox(
//                               height: 20.0,
//                             ),
//                             TextFormField(
//                                 decoration: textInputDecoration.copyWith(
//                                     hintText: 'Enter Email'),
//                                 validator: (val) =>
//                                     val.isEmpty ? 'Enter Email ' : null,
//                                 onChanged: (val) {
//                                   setState(() => email = val);
//                                 }),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20.0,
//                       ),
//                       TextFormField(
//                         decoration: textInputDecoration.copyWith(
//                             hintText: 'Enter Password'),
//                         obscureText: true,
//                         validator: (val) => val.isEmpty || val.length < 4
//                             ? 'Enter password more than 4 digits '
//                             : null,
//                         onChanged: (val) {
//                           setState(() => password = val);
//                         },
//                       ),
//                       // _textInput(
//                       //     hint: "Fullname",
//                       //     icon: Icons.person,
//                       //     onchange: (value) {
//                       //       setState(() {
//                       //         _user.setfullName(value);
//                       //       });
//                       //     }),
//                       // _textInput(
//                       //     hint: "Email",
//                       //     icon: Icons.email,
//                       //     onchange: (value) {
//                       //       setState(() {
//                       //         _user.setemail(value);
//                       //       });
//                       //     }),
//                       // _textInput(
//                       //     hint: "Phone Number",
//                       //     icon: Icons.call,
//                       //     onchange: (value) {
//                       //       setState(() {
//                       //         _user.setphoneNo(value);
//                       //       });
//                       //     }),
//                       // _textInput(
//                       //     hint: "Enter password",
//                       //     icon: Icons.vpn_key,
//                       //     onchange: (value) {
//                       //       setState(() {
//                       //         _user.setpassword(value);
//                       //       });
//                       //     }),
//                       SizedBox(
//                         height: 80.0,
//                       ),
//                       Center(
//                         child: ButtonWidget(
//                             btnText: "REGISTER",
//                             onClick: () async {
//                               if (_formkey.currentState.validate()) {
//                                 setState(() {
//                                   loading = true;
//                                 });
//                                 dynamic result = await _authService
//                                     .registerWithEmailandPassword(
//                                         email, password);
//                                 if (result == null) {
//                                   setState(() {
//                                     error = 'Please enter valid information';
//                                     loading = false;
//                                   });
//                                 }
//                                 // print(_user.getEmail());
//                                 // print(_user.getPass());
//                               }
//                             }),
//                       ),
//                       SizedBox(
//                         height: 20.0,
//                       ),
//                       GestureDetector(
//                         child: RichText(
//                           text: TextSpan(children: [
//                             TextSpan(
//                                 text: "Already a member ? ",
//                                 style: TextStyle(
//                                     color: Colors.grey[900], fontSize: 18)),
//                             TextSpan(
//                               text: "Login",
//                               style: TextStyle(
//                                   color: bluegrayColors, fontSize: 14),
//                               recognizer: _gestureRecognizer,
//                             ),
//                           ]),
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _textInput({controller, hint, icon, dynamic onchange(value)}) {
//     return Container(
//       margin: EdgeInsets.only(top: 20),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.zero),
//         color: Colors.grey[200],
//       ),
//       padding: EdgeInsets.only(left: 10),
//       child: TextField(
//         controller: controller,
//         keyboardType: TextInputType.phone,
//         cursorColor: Colors.grey[900],
//         decoration: InputDecoration(
//           border: InputBorder.none,
//           // enabledBorder: OutlineInputBorder(
//           //   borderSide: BorderSide(color: Colors.white, width: 2.0),
//           // ),
//           hintText: hint,

//           prefixIcon: Icon(
//             icon,
//             color: Colors.grey,
//           ),
//         ),
//         //keyboardType: TextInputType.emailAddress,
//         onChanged: onchange,
//       ),
//     );
//   }
// }

// // () {
// //                             _auth.createUserWithEmailAndPassword(
// //                                 email: _user.getemail(),
// //                                 password: _user.getpassword());
// //                             //Navigator.pop(context);
// //                             Navigator.push(
// //                                 context,
// //                                 MaterialPageRoute(
// //                                     builder: (context) => VerifyScreen()));
// //                           },
