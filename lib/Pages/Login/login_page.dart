// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Admin/new/home_page.dart';
import 'package:lunarestate/Config/bc_ext.dart';
import 'package:lunarestate/Config/config.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/ForgetPass/ForgetPass.dart';
import 'package:lunarestate/Pages/SignUp/SignUpPage.dart';
import 'package:floading/floading.dart';
import 'package:lunarestate/main.dart';
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
                130.height,
                Container(
                  child: Image.asset('assets/icons/icon.png'),
                  width: size.width,
                  height: 75,
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
                          color: AppThemes.primaryColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 3.2,
                        ),
                      ),
                      Text(
                        'Login into your account',
                        style: TextStyle(
                          color: AppThemes.whiteColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      40.height,
                      textBox(
                          icon: SvgPicture.asset('assets/icons/email_icon.svg'),
                          controller: _emailController,
                          isSvg: true,
                          validator: (p0) {
                            return null;
                          },
                          Ktype: TextInputType.emailAddress,
                          hint: 'Enter Email'),
                      SizedBox(
                        height: 25,
                      ),
                      passTextBox(
                          passwordController: _passwordController,
                          hint: 'Enter Password'),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Checkbox(
                                  activeColor: AppThemes.primaryColor,
                                  value: isRememberMe,
                                  onChanged: (c) {
                                    setState(() {
                                      isRememberMe = c ?? false;
                                    });
                                  }),
                              Text(
                                "Remember",
                                style: TextStyle(
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
                                  child: ForgetMyPass(title: 'Forget Password'),
                                  isIos: true,
                                  duration: Duration(milliseconds: 800),
                                ),
                              );
                            },
                            child: Text(
                              'Forget Password?',
                              style: TextStyle(
                                color: Color(0xFFE2BC81),
                                fontWeight: FontWeight.w200,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      roundButton(
                        height: context.screenHeight * 0.057,
                        horizontalPadding: 0,
                        circleBorder: 31,
                        onClick: (() async {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (_emailController.text.trim().isEmpty ||
                              _passwordController.text.trim().isEmpty) {
                            Utils().showSnackbar(
                                'Enter Details!', Colors.red, context);
                          } else {
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
                            try {
                              var res = await backend().loginAccount({
                                'email': _emailController.text,
                                'password': _passwordController.text,
                                'token': TOKEN,
                              });

                              if (res['status'] == 'success') {
                                debugPrint(res['user']["name"]);
                                if (isRememberMe) {
                                  sharedPref().saveuserData(res['user']);
                                  debugPrint(
                                      "save Email ${_emailController.text}");
                                  sharedPref()
                                      .storeVal('email', _emailController.text);
                                }
                                Utils().showSnackbar(
                                    res['msg'], Colors.green, context);
                                await Provider.of<UserData>(context,
                                        listen: false)
                                    .initUserData();
                                FLoading.hide();

                                switch (res['user']['role']) {
                                  case 'admin':
                                    Navigator.of(context)
                                        .popUntil((route) => route.isFirst);
                                    Navigator.pushReplacement(
                                        context,
                                        PageTransition(
                                            child: HomePageAdmin(),
                                            isIos: true,
                                            duration:
                                                Duration(milliseconds: 600),
                                            type: PageTransitionType
                                                .bottomToTop));
                                    break;
                                  default:
                                    Navigator.pushReplacement(
                                        context,
                                        PageTransition(
                                            child: MyNavigation(),
                                            isIos: true,
                                            duration:
                                                Duration(milliseconds: 600),
                                            type: PageTransitionType
                                                .bottomToTop));
                                }
                              } else {
                                FLoading.hide();
                                Utils().showSnackbar(
                                    res['msg'], Colors.red, context);
                              }
                            } catch (e) {
                              debugPrint("Login Error: $e");

                              FLoading.hide();
                              Utils().showSnackbar(
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
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                                children: [
                                  TextSpan(
                                    text: ' SIGN UP',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppThemes.primaryColor,
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
