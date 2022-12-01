import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lunarestate/Config/config.dart';
import 'package:lunarestate/Pages/ForgetPass/CreatenewPassPage.dart';
import 'package:lunarestate/Widgets/customAppBar.dart';
import 'package:lunarestate/Widgets/roundbutton.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rxdart/rxdart.dart';

import '../../Widgets/Utils.dart';

// ignore: must_be_immutable
class OTPPage extends StatefulWidget {
  String email;
  String otp;
  String res;
  OTPPage({required this.email, required this.otp, required this.res});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  StreamController<ErrorAnimationType> errorController = BehaviorSubject();

  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        Utils().showSnackbar(widget.res, Colors.green, context);
      },
    );
  }

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
                CustomAppBarwithBackButton('VERIFY OTP'),
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
                    Center(
                      child: SizedBox(
                        width: size.width * 0.85,
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: [
                              TextSpan(
                                text:
                                    'We have send the code send to your email ',
                                style: TextStyle(color: Colors.white),
                              ),
                              TextSpan(
                                  text: widget.email,
                                  style: TextStyle(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ])),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      child: PinCodeTextField(
                        appContext: context,
                        length: 6,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          inactiveColor: Colors.grey,
                          inactiveFillColor: Colors.grey,
                          activeColor: mainColor,
                          selectedFillColor: mainColor,
                          selectedColor: mainColor,
                          activeFillColor: Colors.white,
                        ),
                        animationDuration: Duration(milliseconds: 300),
                        // backgroundColor: kPrimaryColor.withOpacity(0.4),
                        enableActiveFill: true,
                        cursorColor: Colors.amber,
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
                      width: size.width * 0.75,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    RichText(
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
                    SizedBox(
                      height: 25,
                    ),
                    roundButton(
                        onClick: () {
                          if (widget.otp == textEditingController.text.trim()) {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: CreatenewPassPage(),
                                    isIos: true,
                                    type: PageTransitionType.fade));
                          } else {
                            Utils().showSnackbar(
                                'Wrong Code', Colors.red, context);
                          }
                        },
                        text: 'VERIFY'),
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
