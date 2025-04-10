import 'package:floading/floading.dart';
import 'package:flutter/material.dart';
import 'package:lunarestate/Config/bc_ext.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import 'package:lunarestate/Pages/ForgetPass/OTPPage.dart';
import 'package:lunarestate/Widgets/Utils.dart';
import 'package:lunarestate/Widgets/roundbutton.dart';
import 'package:lunarestate/repositry/authentication_repositry.dart';
import 'package:page_transition/page_transition.dart';
import '../../Admin/AppTheme.dart';
import '../../Widgets/textBox.dart';

class VerifyPhoneNumber extends StatelessWidget {
  VerifyPhoneNumber(
      {super.key,
      required this.phoneNumber,
      required this.Userid,
      required this.email}) {
    _phone.text = phoneNumber;
  }
  final _phone = TextEditingController();
  final String Userid;
  final String phoneNumber;
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: BgOne(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      40.height,
                      Text(
                        'Verify your phone number',
                        style: TextStyle(
                          color: AppThemes.whiteColor,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      10.height,
                      RichText(
                        text: TextSpan(
                          text: 'We have send you an',
                          children: [
                            TextSpan(
                              text: ' One Time Password\n(OTP)',
                              children: [],
                              style: TextStyle(
                                color: AppThemes.primaryColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            TextSpan(
                              text: ' on this phone number.',
                              children: [],
                              style: TextStyle(
                                color: AppThemes.whiteColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                          style: TextStyle(
                            color: AppThemes.whiteColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      40.height,
                      textBox(
                          readOnly: true,
                          icon: Icons.phone,
                          controller: _phone,
                          Ktype: TextInputType.phone,
                          validator: (p0) {
                            return null;
                          },
                          hint: 'Enter Phone Number'),
                      20.height,
                    ],
                  ).addPadding(horizontal: 25),
                ],
              ),
              roundButton(
                      onClick: () async {
                        if (_phone.text.trim().isNotEmpty) {
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

                          AuthenticationRepositry().sendOTP(
                            context,
                            _phone.text.trim(),
                          );
                          // var res = await backend().forgotPassword({
                          //   'email': _phone.text.trim(),
                          // });
                          // if (res['status'] == 'success') {

                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  child: VerifyAccountOTPPage(
                                    email: email,
                                    otp: '12321',
                                    userid: Userid,
                                    res: 'OTP Sent successfully',
                                    phoneNumber: _phone.text,
                                  ),
                                  isIos: true,
                                  duration: Duration(milliseconds: 600),
                                  type: PageTransitionType.fade));
                          // }
                        } else {
                          Utils.showSnackbar(
                            'Enter Phone Number',
                            Colors.red,
                            context,
                          );
                        }
                        FLoading.hide();
                      },
                      text: 'GET CODE')
                  .addPadding(bottom: 25)
            ],
          ),
        ),
      ),
    );
  }
}
