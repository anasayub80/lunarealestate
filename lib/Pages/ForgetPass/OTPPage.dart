import 'dart:async';

import 'package:floading/floading.dart';
import 'package:flutter/material.dart';
import 'package:lunarestate/Config/bc_ext.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import 'package:lunarestate/Pages/ForgetPass/CreatenewPassPage.dart';
import 'package:lunarestate/Widgets/roundbutton.dart';
import 'package:lunarestate/repositry/authentication_repositry.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rxdart/rxdart.dart';

import '../../Admin/AppTheme.dart';
import '../../Widgets/Utils.dart';

// ignore: must_be_immutable
class OTPPage extends StatefulWidget {
  String email;
  String otp;
  String res;
  String Userid;
  String phoneNumber;
  OTPPage(
      {required this.email,
      required this.otp,
      required this.Userid,
      required this.res,
      required this.phoneNumber});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  StreamController<ErrorAnimationType> errorController = BehaviorSubject();

  final textEditingController = TextEditingController();
  int _counter = 30;
  Timer? _timer;

  void _startTimer() {
    _counter = 30;
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer!.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        Utils().showSnackbar(widget.res, Colors.green, context);
      },
    );
    _startTimer();
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: BgOne(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        'OTP Verification',
                        style: TextStyle(
                          color: AppThemes.whiteColor,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      10.height,
                      RichText(
                        text: TextSpan(
                          text: 'Enter the code from the SMS we sent to ',
                          children: [
                            TextSpan(
                              text: widget.phoneNumber,
                              children: [],
                              style: TextStyle(
                                color: AppThemes.primaryColor,
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
                      Visibility(
                        visible: _counter != 0,
                        replacement: Center(
                          child: Text(
                            "Resend",
                            style: TextStyle(
                              color: AppThemes.primaryColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            _counter.toString(),
                            style: TextStyle(
                              color: AppThemes.primaryColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      25.height,
                      Center(
                        child: SizedBox(
                          child: PinCodeTextField(
                            appContext: context,
                            length: 6,
                            obscureText: false,
                            animationType: AnimationType.fade,
                            textStyle: TextStyle(
                              color: Colors.white,
                            ),
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.circle,
                              borderRadius: BorderRadius.circular(20),
                              fieldHeight: 54,
                              fieldWidth: 53,
                              inactiveColor: Color(0xff494748),
                              inactiveFillColor: Color(0xff22252A),
                              activeColor: AppThemes.primaryColor,
                              selectedFillColor: AppThemes.primaryColor,
                              selectedColor: AppThemes.primaryColor,
                              activeFillColor: Color(0xff22252A),
                            ),
                            animationDuration: Duration(milliseconds: 300),
                            // backgroundColor: kPrimaryColor.withOpacity(0.4),
                            enableActiveFill: true,
                            cursorColor: Colors.white,
                            errorAnimationController: errorController,
                            controller: textEditingController,
                            onCompleted: (v) {
                              print("Completed");
                            },
                            onChanged: (value) {
                              print(value);
                            },
                            beforeTextPaste: (text) {
                              print("Allowing to paste $text");

                              return true;
                            },
                          ),
                          width: size.width,
                        ),
                      ),
                      20.height,
                      GestureDetector(
                        onTap: () {
                          if (_counter > 0) {
                            return;
                          }
                          AuthenticationRepositry().sendOTP(
                            context,
                            widget.phoneNumber,
                          );
                          _startTimer();
                        },
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: "Didn't receive the code? ",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                              text: 'Resend',
                              style: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                              )),
                        ])),
                      ),
                    ],
                  ).addPadding(horizontal: 25),
                ],
              ),
              roundButton(
                      horizontalPadding: 0.0,
                      buttonWidth: context.screenWidth * 0.9,
                      onClick: () {
                        AuthenticationRepositry().submitOtp(
                          context,
                          textEditingController.text,
                          widget.Userid,
                          widget.email,
                        );
                        try {} catch (e) {
                        } finally {}
                      },
                      text: 'VERIFY')
                  .addPadding(bottom: 21),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
