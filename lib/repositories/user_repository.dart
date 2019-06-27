import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserRepository with ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _user;
  GoogleSignIn _googleSignIn;
  Status _status = Status.Uninitialized;
  String _message = 'Мессеж хүлээж байна...';

  UserRepository.instance()
      : _auth = FirebaseAuth.instance,
        _googleSignIn = GoogleSignIn() {
    _auth.onAuthStateChanged.listen(_onAuthStateChanged);
  }

  Status get status => _status;
  FirebaseUser get user => _user;
  String get message => _message;

 
  Future<bool> signIn(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future<bool> signInWithGoogle() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _auth.signInWithCredential(credential);
      return true;
    } catch (e) {
      print(e);
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }

  }

  Future verifyPhoneNumber(String verifyId, String phoneNum) async {
   
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) {
      _message = "Амжилттай";
      notifyListeners();
      _auth.signInWithCredential(phoneAuthCredential);
      
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
    _message = "Амжилтгүй";
    notifyListeners();
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      verifyId = verificationId;
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      verifyId = verificationId;
    };

    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNum,
        timeout: const Duration(seconds: 1),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }
  
  Future<bool> signInWithPhone( String verifyId, String smsCode ) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: verifyId,
      smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
      return true;
    } catch (e) {
      print(e);
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }

  }

  Future signOut() async {
    _auth.signOut();
    _googleSignIn.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> _onAuthStateChanged(FirebaseUser firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
    }
    notifyListeners();
  }
}