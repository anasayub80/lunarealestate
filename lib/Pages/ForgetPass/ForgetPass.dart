// ignore_for_file: use_build_context_synchronously

import 'package:floading/floading.dart';
import 'package:flutter/material.dart';
import 'package:lunarestate/Config/bc_ext.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import 'package:lunarestate/Pages/ForgetPass/OTPPage.dart';
import 'package:lunarestate/Service/backend.dart';
import 'package:lunarestate/Widgets/Utils.dart';
import 'package:lunarestate/Widgets/roundbutton.dart';
import 'package:page_transition/page_transition.dart';
import '../../Widgets/textBox.dart';

// ignore: must_be_immutable
class ForgetMyPass extends StatelessWidget {
  String title;
  ForgetMyPass({super.key, required this.title});
  TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: BgOne(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                50.height,
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      onPressed: () {
                        context.popFromScreen();
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_left,
                        size: 24,
                        color: Colors.white,
                      )),
                ),
                30.height,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/forget.png',
                      height: 125,
                    ),
                    30.height,
                    textBox(
                        icon: Icons.email_outlined,
                        emailController: _email,
                        Ktype: TextInputType.emailAddress,
                        hint: 'Enter Email'),
                    SizedBox(
                      height: 25,
                    ),
                    roundButton(
                        onClick: () async {
                          if (_email.text.trim().isNotEmpty) {
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

                            var res = await backend().forgotPassword({
                              'email': _email.text.trim(),
                            });
                            if (res['status'] == 'success') {
                              FLoading.hide();
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: OTPPage(
                                        email: _email.text,
                                        otp: res['code'],
                                        res: res['msg'],
                                      ),
                                      isIos: true,
                                      duration: Duration(milliseconds: 600),
                                      type: PageTransitionType.fade));
                            }
                          } else {
                            Utils().showSnackbar(
                                'Enter Email', Colors.red, context);
                          }
                        },
                        text: 'Send OTP')
                  ],
                ).addPadding(horizontal: 25)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
