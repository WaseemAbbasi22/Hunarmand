import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
  Future signInWithPhone(String phone) async {
    _auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: const Duration(seconds: 60),
      verificationCompleted: null,
      verificationFailed: null,
      codeAutoRetrievalTimeout: null,
      codeSent: null,
    );
  }

// sign in with email..
  Future registerWithEmailandPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      print(user);
      // await DatabaseService(uid: user.uid)
      //     .updateUserData('0', 'new crew member', 100);
      // return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// register

// logout..

}
