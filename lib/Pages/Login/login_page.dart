// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lunarestate/Admin/Pages/adminHome.dart';
import 'package:lunarestate/Config/config.dart';
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

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  image: AssetImage('assets/images/tower.jpg'),
                  opacity: 0.2,
                  fit: BoxFit.fill),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Image.asset('assets/icons/icon.png'),
                  width: size.width,
                  height: 75,
                ),
                SizedBox(
                  height: 25,
                ),
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      'Login Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    textBox(
                        icon: Icons.email_outlined,
                        emailController: _emailController,
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
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    roundButton(
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
                          var res = await backend().loginAccount({
                            'email': _emailController.text,
                            'password': _passwordController.text,
                            'token': TOKEN,
                          });

                          if (res['status'] == 'success') {
                            // List<dynamic> data = res["user"];
                            debugPrint(res['user']["name"]);
                            sharedPref().saveuserData(res['user']);
                            sharedPref()
                                .storeVal('email', _emailController.text);
                            Utils().showSnackbar(
                                res['msg'], Colors.green, context);
                            await Provider.of<UserData>(context, listen: false)
                                .initUserData();
                            FLoading.hide();

                            switch (res['user']['role']) {
                              case 'admin':
                                Navigator.of(context)
                                    .popUntil((route) => route.isFirst);
                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        child: AdminHome(),
                                        isIos: true,
                                        duration: Duration(milliseconds: 600),
                                        type: PageTransitionType.bottomToTop));
                                break;
                              default:
                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        child: MyNavigation(),
                                        isIos: true,
                                        duration: Duration(milliseconds: 600),
                                        type: PageTransitionType.bottomToTop));
                            }
                          } else {
                            FLoading.hide();
                            Utils()
                                .showSnackbar(res['msg'], Colors.red, context);
                          }
                        }
                      }),
                      text: 'LOGIN',
                    ),
                    SizedBox(
                      height: 25,
                    ),
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
                      child: RichText(
                        text:
                            TextSpan(text: "Don't have an Account?", children: [
                          TextSpan(
                              text: ' SignUp',
                              style: TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold)),
                        ]),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
