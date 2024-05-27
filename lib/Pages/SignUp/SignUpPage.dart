// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
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
  TextEditingController _nameController = TextEditingController();
  TextEditingController _number = TextEditingController();
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
                      'Sign Up',
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
                        icon: Icons.person,
                        emailController: _nameController,
                        Ktype: TextInputType.name,
                        hint: 'Enter Full Name'),
                    SizedBox(
                      height: 25,
                    ),
                    textBox(
                        icon: Icons.email_outlined,
                        Ktype: TextInputType.emailAddress,
                        emailController: _emailController,
                        hint: 'Enter Email'),
                    SizedBox(
                      height: 25,
                    ),
                    textBox(
                        icon: Icons.numbers,
                        emailController: _number,
                        Ktype: TextInputType.number,
                        hint: 'Enter Number'),
                    SizedBox(
                      height: 25,
                    ),
                    passTextBox(
                        passwordController: _passwordController,
                        hint: 'Enter Password'),
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
                            sharedPref()
                                .storeVal('email', _emailController.text);
                            FLoading.hide();
                            Utils().showSnackbar(
                                res['res'], Colors.green, context);
                            Navigator.pop(context, _emailController.text);
                          } else {
                            FLoading.hide();
                            Utils()
                                .showSnackbar(res['res'], Colors.red, context);
                          }
                        }
                      }),
                      text: 'SIGN UP',
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        Navigator.pop(context);
                      },
                      child: RichText(
                        text: TextSpan(text: "You have an Account?", children: [
                          TextSpan(
                              text: ' Log In',
                              style: TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold))
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
