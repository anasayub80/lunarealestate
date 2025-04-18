// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Config/config.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/ForgetPass/ForgetPass.dart';
import 'package:lunarestate/Pages/OTPVerification/verify_phone.dart';
import 'package:lunarestate/Pages/SignUp/SignUpPage.dart';
import 'package:floading/floading.dart';
import 'package:lunarestate/Pages/Splash/SplashPage.dart';
import 'package:provider/provider.dart';
import 'package:lunarestate/Service/sharedPref.dart';
import 'package:lunarestate/Widgets/Utils.dart';
import '../../Service/UserData.dart';
import '../../Service/backend.dart';
import '../../Widgets/roundbutton.dart';
import '../../Widgets/textBox.dart';
import 'package:page_transition/page_transition.dart';

import '../Background/bg_one.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();
  bool isRememberMe = false;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: BgOne(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                80.height,
                Container(
                  child: Image.asset('assets/icons/logo.png'),
                  width: size.width,
                  height: 152,
                ),
                30.height,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      40.height,
                      Text(
                        'SIGN IN',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          color: Color(0xffEFD397),
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Login into your account',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          color: AppThemes.whiteColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      40.height,
                      textBox(
                          icon: null,
                          controller: _emailController,
                          validator: (p0) {
                            return null;
                          },
                          Ktype: TextInputType.emailAddress,
                          hint: 'Email here'),
                      SizedBox(
                        height: 25,
                      ),
                      PassTextBox(
                          passwordController: _passwordController,
                          hint: 'Enter Password'),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Transform.scale(
                                scale: 1.2,
                                child: Checkbox(
                                    fillColor:
                                        WidgetStateProperty.resolveWith<Color?>(
                                      (Set<WidgetState> states) {
                                        // Return black color when unchecked
                                        if (states
                                            .contains(WidgetState.selected)) {
                                          return AppThemes
                                              .primaryColor; // Active state color
                                        }
                                        return Colors
                                            .black; // Inactive state color
                                      },
                                    ),
                                    activeColor: AppThemes.primaryColor,
                                    value: isRememberMe,
                                    onChanged: (c) {
                                      setState(() {
                                        isRememberMe = c ?? false;
                                      });
                                    }),
                              ),
                              Text(
                                "Remember",
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  color: AppThemes.whiteColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: ForgetMyPass(title: 'Forgot Password'),
                                  isIos: true,
                                  duration: Duration(milliseconds: 800),
                                ),
                              );
                            },
                            child: Text(
                              'Forget Password',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                color: Color(0xFFE2BC81),
                                fontWeight: FontWeight.w200,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      roundButton(
                        height: 62,
                        horizontalPadding: 0,
                        circleBorder: 12,
                        onClick: (() async {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (_emailController.text.trim().isEmpty ||
                              _passwordController.text.trim().isEmpty) {
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
                                    "assets/icons/logo.png",
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
                            try {
                              var res = await Backend().loginAccount({
                                'email': _emailController.text,
                                'password': _passwordController.text,
                                'token': TOKEN,
                              });

                              log('Response ${res['user']}');
                              if (res['status'] == 'success') {
                                debugPrint(res['user']["name"]);

                                Utils.showSnackbar(
                                    res['msg'], Colors.green, context);
                                await Provider.of<UserData>(context,
                                        listen: false)
                                    .initUserData();
                                FLoading.hide();
                                if (res['user']['phone_verified'].toString() ==
                                    '0') {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: VerifyPhoneNumber(
                                            phoneNumber:
                                                res['user']['phone'].toString(),
                                            Userid:
                                                res['user']['id'].toString(),
                                            email: _emailController.text,
                                          ),
                                          isIos: true,
                                          duration: Duration(milliseconds: 600),
                                          type:
                                              PageTransitionType.bottomToTop));
                                } else {
                                  sharedPref().saveuserData(res['user']);
                                  debugPrint(
                                      "save Email ${_emailController.text}");
                                  sharedPref()
                                      .storeVal('email', _emailController.text);
                                  if (isRememberMe) {
                                    sharedPref().storeBool('isLogin', true);
                                  }
                                  Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                        child: SplashPage(
                                          isFromLogin: true,
                                        ),
                                        isIos: true,
                                        duration: Duration(milliseconds: 600),
                                        type: PageTransitionType.bottomToTop,
                                      ));
                                }
                              } else {
                                FLoading.hide();
                                Utils.showSnackbar(
                                    res['msg'], Colors.red, context);
                              }
                            } catch (e) {
                              debugPrint("Login Error: $e");
                              FLoading.hide();
                              Utils.showSnackbar(
                                  e.toString(), Colors.red, context);
                            }
                          }
                        }),
                        text: 'SIGN IN',
                      ),
                      30.height,
                      GestureDetector(
                        onTap: () async {
                          FocusManager.instance.primaryFocus?.unfocus();
                          final res = await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: SignUpPage(),
                              isIos: true,
                              duration: Duration(milliseconds: 800),
                            ),
                          );
                          if (res != null) {
                            _emailController.text = res;
                          }
                        },
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                                text: "Don't have an Account?",
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                                children: [
                                  TextSpan(
                                    text: ' SIGN UP',
                                    style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontSize: 18,
                                      color: AppThemes.secondarycolor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ],
                  ).addPadding(horizontal: 25),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
