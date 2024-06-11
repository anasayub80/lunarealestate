import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Config/bc_ext.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/HomePage/HomePage.dart';
import 'package:lunarestate/Widgets/roundbutton.dart';
import 'package:page_transition/page_transition.dart';

class PaymentWidgetSurveyPage extends StatelessWidget {
  const PaymentWidgetSurveyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: context.screenHeight * 0.08,
          width: double.infinity,
          decoration: AppThemes.commonBoxDecoration,
          child: Row(
            children: [
              SvgPicture.asset("assets/icons/payment_card_icon.svg").addPadding(
                horizontal: 12,
              ),
              6.height,
              Text(
                'PAYMENT METHOD?',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        8.height,
        Container(
          decoration: AppThemes.commonBoxDecoration,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cash',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ).addPadding(left: 4),
                  Checkbox(
                    value: false,
                    onChanged: (s) {},
                  ),
                ],
              ).addPadding(overall: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Check',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ).addPadding(left: 4),
                  Checkbox(
                    value: false,
                    onChanged: (s) {},
                  ),
                ],
              ).addPadding(overall: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Wire Deposite',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ).addPadding(left: 4),
                  Checkbox(
                    value: false,
                    onChanged: (s) {},
                  ),
                ],
              ).addPadding(overall: 8),
            ],
          ),
        ),
        18.height,
        roundButton(
          horizontalPadding: 8,
          buttonWidth: double.infinity,
          height: 55,
          circleBorder: 30,
          onClick: () {
            Navigator.pushReplacement(
                context,
                PageTransition(
                  isIos: true,
                  duration: Duration(milliseconds: 700),
                  child: MyHomePage(),
                  type: PageTransitionType.fade,
                ));
          },
          text: 'SUBMITED',
        ),
      ],
    ).addPadding(overall: 6);
  }
}
