// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import 'package:lunarestate/Widgets/roundbutton.dart';
import 'package:floading/floading.dart';

import '../../Config/config.dart';
import '../../Service/backend.dart';
import '../../Service/sharedPref.dart';
import '../../Widgets/Utils.dart';
import '../../Widgets/textBox.dart';

// ignore: must_be_immutable
class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _number = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: BgOne(
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              75.height,
              Container(
                child: Image.asset(
                  'assets/icons/homeLogo.png',
                  fit: BoxFit.contain,
                ),
                width: 175,
                height: 106,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  25.height,
                  Text(
                    'SIGN UP',
                    style: TextStyle(
                      color: AppThemes.primaryColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      // letterSpacing:
                      letterSpacing: 3.2,
                    ),
                  ),
                  Text(
                    'Create your account',
                    style: TextStyle(
                      color: AppThemes.whiteColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  40.height,
                  textBox(
                      icon: Icons.person,
                      emailController: _nameController,
                      Ktype: TextInputType.name,
                      hint: 'Username'),
                  SizedBox(
                    height: 25,
                  ),
                  textBox(
                      icon: Icons.email_outlined,
                      Ktype: TextInputType.emailAddress,
                      emailController: _emailController,
                      hint: 'Email here'),
                  SizedBox(
                    height: 25,
                  ),
                  textBox(
                      icon: Icons.numbers,
                      emailController: _number,
                      Ktype: TextInputType.number,
                      hint: 'Phone number'),
                  SizedBox(
                    height: 25,
                  ),
                  passTextBox(
                      passwordController: _passwordController,
                      hint: 'Enter Password'),
                  SizedBox(
                    height: 25,
                  ),
                  passTextBox(
                      passwordController: _confirmPasswordController,
                      hint: 'Confirm Password'),
                  SizedBox(
                    height: 25,
                  ),
                  roundButton(
                    onClick: (() async {
                      if (_emailController.text.trim().isEmpty ||
                          _passwordController.text.trim().isEmpty ||
                          _nameController.text.trim().isEmpty) {
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
                        var res = await backend().signUpAccount({
                          'email': _emailController.text,
                          'password': _passwordController.text,
                          'phone': _number.text,
                          'name': _nameController.text,
                          'token': TOKEN,
                        });

                        if (res['status'] == 'success') {
                          // List<dynamic> data = res["user"];
                          sharedPref().storeVal('email', _emailController.text);
                          FLoading.hide();
                          Utils()
                              .showSnackbar(res['res'], Colors.green, context);
                          Navigator.pop(context, _emailController.text);
                        } else {
                          FLoading.hide();
                          Utils().showSnackbar(res['res'], Colors.red, context);
                        }
                      }
                    }),
                    text: 'SIGN UP',
                  ),
                  30.height,
                  GestureDetector(
                    onTap: () async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                            text: "Already have an account?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                            children: [
                              TextSpan(
                                  text: ' SIGN IN',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppThemes.primaryColor,
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
