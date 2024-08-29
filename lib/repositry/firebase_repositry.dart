// ignore_for_file: constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' show debugPrint;

enum AuthenticationState {
  UserNotFound,
  WrongPassword,
  ValidUser,
  UnidentifiedIssue,
}

AuthenticationState? currentState;
var verificationID = 'null';

class FirebaseAuthenticationInstance {
  final _firebaseInstance = FirebaseAuth.instance;
  int? _forceResendingToken;

  Future<bool> verifyOtp(String otpCode) async {
    debugPrint("=====> OTP Code $verificationID & $otpCode");
    try {
      // ignore: unused_local_variable
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID,
        smsCode: otpCode.trim(),
      );
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint("Failed to verify OTP: ${e.message}");
      return false;
    }
  }

  Future sendOtp(
      String phoneNumber, Function onError, Function onSuccess, Function onSent,
      {bool resend = false}) async {
    await _firebaseInstance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 120),
      forceResendingToken: resend ? _forceResendingToken : null,
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
        debugPrint("code Success ! ${phoneAuthCredential.smsCode}");
        phoneAuthCredential.smsCode;
        onSuccess();
      },
      verificationFailed: (FirebaseAuthException error) {
        onError(error.message);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      codeSent: (String verificationId, int? forceResendingToken) {
        verificationID = verificationId;
        _forceResendingToken = forceResendingToken;
        debugPrint("code sent !");
        onSent();
      },
    );
    debugPrint("Code sent OTP $verificationID");
  }
}
