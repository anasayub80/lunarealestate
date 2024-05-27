// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lunarestate/Widgets/Utils.dart';
import 'package:lunarestate/Widgets/roundbutton.dart';
import 'package:floading/floading.dart';
import 'package:lunarestate/Widgets/textBox.dart';
import '../../Service/backend.dart';
import '../../Widgets/customAppBar.dart';

// ignore: must_be_immutable
class CreatenewPassPage extends StatelessWidget {
  CreatenewPassPage({super.key});
  TextEditingController _pass1 = TextEditingController();
  TextEditingController _pass2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Container(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                CustomAppBarwithBackButton('Change Password'),
              ];
            },
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/otp.gif',
                      fit: BoxFit.fill,
                      height: 200,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Create New Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    passTextBox(
                        passwordController: _pass1, hint: 'Enter new password'),
                    SizedBox(
                      height: 20,
                    ),
                    passTextBox(
                        passwordController: _pass2, hint: "Re enter password"),
                    SizedBox(
                      height: 20,
                    ),
                    roundButton(
                        onClick: () async {
                          if (_pass1.text.trim().isNotEmpty ||
                              _pass2.text.trim().isNotEmpty) {
                            if (_pass1.text == _pass2.text) {
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
                              var res = await backend().setNewAccount({
                                'pass': _pass1.text,
                              });

                              if (res == '1') {
                                FLoading.hide();
                              } else {
                                Utils().showSnackbar(
                                    'Invalid Details!', Colors.red, context);
                              }
                            } else {
                              Utils().showSnackbar(
                                  'Password Not Match!', Colors.red, context);
                            }
                          } else {
                            Utils().showSnackbar(
                                'Enter Password', Colors.red, context);
                          }
                        },
                        text: 'Confirm Password')
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Color(0xff141414),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  )),
              height: size.height,
              width: size.width,
            ),
          ),
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              'assets/images/tower.jpg',
            ),
            opacity: 0.2,
            fit: BoxFit.cover,
          )),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
