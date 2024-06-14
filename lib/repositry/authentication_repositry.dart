import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lunarestate/Pages/Login/login_page.dart';
import 'package:lunarestate/Widgets/Utils.dart';
import 'package:lunarestate/repositry/firebase_repositry.dart';

class AuthenticationRepositry {
  FirebaseAuthenticationInstance _firebaseAuthenticationInstance =
      FirebaseAuthenticationInstance();

  void sendOTP(BuildContext context, String phoneNumber) {
    debugPrint("phoneNumber $phoneNumber");
    _firebaseAuthenticationInstance.sendOtp(
      phoneNumber,
      (String message) {
        log("send otp on error: $message");
        Utils()
            .showSnackbar('Error sending OTP. $message', Colors.red, context);
      },
      () {},
      () {
        Utils().showSnackbar(
            'OTP sent successfully!', Colors.green.shade300, context);
      },
    );
  }

  submitOtp(BuildContext context, String otp,
      TextEditingController phoneNumberController) async {
    bool verified = await _firebaseAuthenticationInstance.verifyOtp(otp);
    if (verified) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Your account has been verified! Please log in again to continue.',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green.shade300,
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (c) => LoginPage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Error validating OTP.',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
