// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import 'package:lunarestate/Pages/Login/login_page.dart';
import 'package:lunarestate/Pages/OTPVerification/verify_phone.dart';
import 'package:lunarestate/Widgets/roundbutton.dart';
import 'package:floading/floading.dart';
import 'package:page_transition/page_transition.dart';
import '../../Config/config.dart';
import '../../Service/backend.dart';
import '../../Widgets/Utils.dart';
import '../../Widgets/textBox.dart';

// ignore: must_be_immutable
class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  TextEditingController _confirmPasswordController = TextEditingController();

  TextEditingController _nameController = TextEditingController();

  TextEditingController _number = TextEditingController();
  String countryCode = '+1';
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: BgOne(
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                  'assets/icons/logo.png',
                  fit: BoxFit.contain,
                ),
                width: 220,
                height: 220,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  25.height,
                  Text(
                    'SIGN UP',
                    style: TextStyle(
                      fontFamily: 'Outfit',

                      color: AppThemes.secondarycolor,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                      // letterSpacing:
                    ),
                  ),
                  Text(
                    'Create your account',
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      color: AppThemes.whiteColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  40.height,
                  Text(
                    'User Info',
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      color: AppThemes.whiteColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  10.height,
                  textBox(
                      icon: null,
                      validator: (p0) {
                        return null;
                      },
                      controller: _nameController,
                      Ktype: TextInputType.name,
                      hint: 'Username'),
                  SizedBox(
                    height: 25,
                  ),
                  textBox(
                      // icon: Icons.email_outlined,
                      icon: null,
                      isSvg: true,
                      validator: (p0) {
                        return null;
                      },
                      Ktype: TextInputType.emailAddress,
                      controller: _emailController,
                      hint: 'Email here'),
                  SizedBox(
                    height: 25,
                  ),
                  textBox(
                      // icon: Icons.numbers,
                      isSvg: true,
                      icon: CountryCodePicker(
                        onChanged: (c) {
                          setState(() {
                            countryCode = c.dialCode!;
                          });
                        },
                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                        initialSelection: 'US',
                        textStyle: TextStyle(
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.zero,
                        // optional. Shows only country name and flag
                        showCountryOnly: false,
                        // optional. Shows only country name and flag when popup is closed.
                        showOnlyCountryWhenClosed: false,
                        // optional. aligns the flag and the Text left
                        alignLeft: false,
                      ),
                      controller: _number,
                      validator: (p0) {
                        return null;
                      },
                      Ktype: TextInputType.number,
                      hint: 'Phone number'),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Set Your Credential',
                    style: TextStyle(
                        fontFamily: 'Outfit',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  PassTextBox(
                      passwordController: _passwordController,
                      hint: 'Enter Password'),
                  SizedBox(
                    height: 25,
                  ),
                  PassTextBox(
                      passwordController: _confirmPasswordController,
                      hint: 'Confirm Password'),
                  SizedBox(
                    height: 25,
                  ),
                  roundButton(
                    height: 64,
                    // height: context.screenHeight * 0.057,
                    horizontalPadding: 0,
                    circleBorder: 12,
                    onClick: (() async {
                      if (_emailController.text.trim().isEmpty ||
                          _passwordController.text.trim().isEmpty ||
                          _nameController.text.trim().isEmpty) {
                        Utils.showSnackbar(
                            'Enter Details!', Colors.red, context);
                      } else {
                        FLoading.show(
                          context,
                          loading: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/icons/logo/s.png",
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

                        var res = await backend().signUpAccount({
                          'email': _emailController.text,
                          'password': _passwordController.text,
                          'phone': "$countryCode ${_number.text.trim()}",
                          'name': _nameController.text,
                          'token': TOKEN,
                        });
                        FLoading.hide();
                        log('Response $res');
                        try {
                          if (res['status'] == 'success') {
                            debugPrint("success");

                            Utils.showSnackbar(
                                res['msg'], Colors.green, context);
                            debugPrint("success 22222");
                            Navigator.pushReplacement(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: VerifyPhoneNumber(
                                  phoneNumber:
                                      "$countryCode ${_number.text.trim()}",
                                  Userid: res['user']['id'].toString(),
                                  email: _emailController.text,
                                ),
                                // isIos: true,
                                duration: Duration(milliseconds: 800),
                              ),
                            );
                          } else {
                            Utils.showSnackbar(res['res'], Colors.red, context);
                          }
                        } catch (e) {
                          debugPrint("ERRROR ${e.toString()}");
                        }
                      }
                      FLoading.hide();
                    }),
                    text: 'SIGN UP',
                  ),
                  30.height,
                  GestureDetector(
                    onTap: () async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      Navigator.push(
                          context,
                          PageTransition(
                              child: LoginPage(),
                              isIos: true,
                              duration: Duration(milliseconds: 700),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                            text: "Already have an account?",
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                            children: [
                              TextSpan(
                                  text: ' SIGN IN',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Outfit',
                                      color: AppThemes.secondarycolor,
                                      fontWeight: FontWeight.w400)),
                            ]),
                      ),
                    ),
                  ),
                  30.height,
                ],
              ).addPadding(horizontal: 25),
            ],
          ),
        ),
      ),
    );
  }
}
