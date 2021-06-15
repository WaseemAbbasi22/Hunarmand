import 'dart:math';
import 'package:Hunarmand_signIn_Ui/Screens/authenticate/login_screen.dart';
import 'package:Hunarmand_signIn_Ui/controllers/appstate_controller.dart';
import 'package:Hunarmand_signIn_Ui/controllers/client_provider.dart';
import 'package:Hunarmand_signIn_Ui/controllers/user_provider.dart';
import 'package:Hunarmand_signIn_Ui/controllers/worker_provider.dart';
import 'package:Hunarmand_signIn_Ui/enum/appstate.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/home/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Hunarmand_signIn_Ui/Screens/home/dashborad.dart';

class AuthService extends AppStateController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final WorkerProvider _workerProvider = WorkerProvider();
  final UserProvider _userProvider = UserProvider();
  final ClientProvider _clientProvider = ClientProvider();
  String _verificationId;
  String _phoneNo = '';
  void setverId(String vid) {
    _verificationId = vid;
  }

  String getverId() {
    return _verificationId;
  }

  //GET CURRENT USERID..
  Future<String> getCurrentUID() async {
    return await _auth.currentUser.uid;
  }

  Stream<String> get onAuthStateChanged => _auth.authStateChanges().map(
        (User user) => user?.uid,
      );
  // GET CURRENT USER
  Future<User> getCurrentUser() async {
    return _auth.currentUser;
  }

  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return WorkerDashboard();
          } else {
            return LoginScreen();
          }
        });
  }

  checkAuthentication(String screen, BuildContext context) async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        if (screen == 'worker') {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => WorkerDashboard()));
        } else if (screen == 'client') {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => HomeDashboard()));
        }
        // Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

//sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// sign in with phone number
  // Future signInWithPhone(String phone) async {
  //   _auth.verifyPhoneNumber(
  //     phoneNumber: phone,
  //     timeout: const Duration(seconds: 60),
  //     verificationCompleted: null,
  //     verificationFailed: null,
  //     codeAutoRetrievalTimeout: null,
  //     codeSent: null,
  //   );
  // }

// Register with email..
  Future registerWithEmailandPassword({String email, String password}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      // getUserid(user);
      _workerProvider.saveworker(user.uid, user.email);
      // await DataBaseService(uid: user.uid).createUserCollection(
      //     'user name',
      //     'user id no',
      //     'https://w7.pngwing.com/pngs/639/452/png-transparent-computer-icons-avatar-user-profile-people-icon-child-face-heroes.png',
      //     'useraddress');
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future registerWithPhoneNo({String phonenumber}) async {
    try {
      setViewState(ViewState.Busy);
      _phoneNo = "+92" + phonenumber;
      //call on successful complete verification
      PhoneVerificationCompleted verificationCompleted =
          (PhoneAuthCredential phoneAuthCredential) async {
        await _auth.signInWithCredential(phoneAuthCredential);
        setViewState(ViewState.Ideal);

        // showSnackbar("Phone number automatically verified and user signed in: ${_auth.currentUser.uid}");
      };

//call when verifaction faild...
      PhoneVerificationFailed verificationFailed =
          (FirebaseAuthException authException) {
        print(authException.message.toString());
        // showSnackbar('Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
      };

//call when code is send to device ...
      PhoneCodeSent codeSent =
          (String verificationId, [int forceResendingToken]) async {
        // showSnackbar('Please check your phone for the verification code.');
        setverId(verificationId);
      };

//call for phone auto retrival timeout ...
      PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
          (String verificationId) {
        // showSnackbar("verification code: " + verificationId);
        setverId(verificationId);
      };
//now its time to call all these methods..

      try {
        await _auth.verifyPhoneNumber(
            phoneNumber: _phoneNo,
            timeout: const Duration(seconds: 5),
            verificationCompleted: verificationCompleted,
            verificationFailed: verificationFailed,
            codeSent: codeSent,
            codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
      } catch (e) {
        // showSnackbar("Failed to Verify Phone Number: ${e}");
      }

      //User user = userCredential.user;
      // getUserid(user);
      // await DataBaseService(uid: user.uid).createUserCollection(
      //     'user name',
      //     'user id no',
      //     'https://w7.pngwing.com/pngs/639/452/png-transparent-computer-icons-avatar-user-profile-people-icon-child-face-heroes.png',
      //     'useraddress');

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

// void showSnackbar(String message,var key) {
//   _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
// }

//Phone signIn...
  Future<User> signInWithPhoneNumber(
      String smscode, String name, String type, String skill) async {
    print(_verificationId);
    try {
      setViewState(ViewState.Busy);
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smscode,
      );
      setViewState(ViewState.Ideal);

      final User user = (await _auth.signInWithCredential(credential)).user;
      _userProvider.saveuser(user.uid, name, _phoneNo, type);
      if (type == 'worker') {
        _workerProvider.saveworkers(user.uid, name, _phoneNo, skill);
      } else if (type == 'client') {
        _clientProvider.saveclinet(user.uid, name, _phoneNo);
      }

      await _auth.currentUser.updateProfile(displayName: name);

      // showSnackbar("Successfully signed in UID: ${user.uid}");
      print(user.uid);
      return user;
    } catch (e) {
      print(e.toString());
      return null; // showSnackbar("Failed to sign in: " + e.toString());
    }
  }

  Future<String> getUserid() async {
    User user = _auth.currentUser;
    String uid = user.uid.toString();
    return uid;
  }
// Login with eamil and password

  Future<User> signInWithEmail({String email, String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential != null) {
        User user = userCredential.user;
        return user;
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    }
  }

// logout..

  void logOut() async {
    return await _auth.signOut();
  }

  phonesignIn(AuthCredential authCreds) {
    _auth.signInWithCredential(authCreds);
  }

//SignIn with OTP...
  signInWithOTP(smsCode, verId) {
    AuthCredential authCreds =
        PhoneAuthProvider.credential(verificationId: verId, smsCode: smsCode);
    phonesignIn(authCreds);
  }
}
