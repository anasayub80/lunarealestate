import 'dart:developer';

import 'package:floading/floading.dart';
import 'package:flutter/material.dart';
import 'package:lunarestate/Pages/Login/login_page.dart';
import 'package:lunarestate/Widgets/Utils.dart';
import 'package:lunarestate/repositry/firebase_repositry.dart';

import '../Service/backend.dart';
import '../Service/sharedPref.dart';

class AuthenticationRepositry {
  FirebaseAuthenticationInstance _firebaseAuthenticationInstance =
      FirebaseAuthenticationInstance();

  void sendOTP(BuildContext context, String phoneNumber) {
    debugPrint("phoneNumber $phoneNumber");
    _firebaseAuthenticationInstance.sendOtp(
      phoneNumber,
      (String message) {
        log("send otp on error: $message");
        Utils.showSnackbar('Error sending OTP. $message', Colors.red, context);
      },
      () {},
      () {
        Utils.showSnackbar(
            'OTP sent successfully!', Colors.green.shade300, context);
      },
    );
  }

  submitOtp(
      BuildContext context, String otp, String Userid, String email) async {
    bool verified = await _firebaseAuthenticationInstance.verifyOtp(otp);
    if (verified) {
      try {
        FLoading.show(
          context,
          loading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/icon.png",
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 25,
              ),
              CircularProgressIndicator()
            ],
          ),
          closable: false,
          color: Colors.black.withOpacity(0.7),
        );
        // ?  Update user verify status here
        var res = await backend().update({
          'value': '1',
          'column': "phone_verified",
          'table': 'users',
          'id': Userid.toString(),
        });

        if (res['status'] == 'success') {
          debugPrint('success');
          sharedPref().storeVal('email', email);
          FLoading.hide();
        } else {
          FLoading.hide();
          // ignore: use_build_context_synchronously
          Utils.showSnackbar(res['msg'], Colors.red, context);
        }
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
      } catch (e) {
        throw Exception(e.toString());
      }
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
