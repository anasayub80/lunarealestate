import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Config/bc_ext.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Survery/pages/children_widgets/payment_widget_survey_page.dart';
import 'package:lunarestate/Widgets/header_text.dart';

class SurveyPage2 extends StatelessWidget {
  const SurveyPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getHeader(
          'Survey',
        ),
        45.height,
        Container(
          height: context.screenWidth * 0.6,
          width: double.infinity,
          decoration: AppThemes.commonBoxDecoration,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    "assets/icons/time_frame_icon.svg",
                    height: 40,
                  ),
                  Text(
                    'Time frame of selling property?',
                    style: TextStyle(
                      color: AppThemes.secondarycolor,
                    ),
                  ),
                  SizedBox(),
                ],
              ).addPadding(
                left: 21,
                top: 21,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Eg. 14 Days',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  18.width,
                  Container(
                    height: 50,
                    width: 120,
                    decoration: AppThemes.commonBoxDecoration,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: Text(
                            "1",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        12.width,
                        Flexible(
                          child: Column(
                            children: [
                              Icon(
                                Icons.arrow_drop_up,
                                color: Color(0XffBBBBBB),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Color(0xFFBBBBBB),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(),
                ],
              ),
              12.height,
              Divider(
                color: Color(0xFF494748).withOpacity(.3),
              ).addPadding(horizontal: 41, vertical: 3),
              12.height,
              Text(
                'Rate your home condition',
                style: TextStyle(
                  color: AppThemes.secondarycolor,
                ),
              ),
              Builder(builder: (context) {
                return RatingBar.builder(
                  glow: false,
                  unratedColor: const Color(0xFF4F4F4F),
                  itemSize: 25,
                  ignoreGestures: true,
                  updateOnDrag: false,
                  initialRating: 2,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Color(0xFFF1A530),
                  ),
                  onRatingUpdate: (double value) {},
                );
              }),
            ],
          ),
        ).addPadding(overall: 6),
        12.height,
        Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF22252A),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 1,
              color: Color(0xFF494748),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              12.width,
              Expanded(
                child: Text(
                  'Are you needing fast cash to help with moving or other expenses?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ).addPadding(top: 14),
              ),
              12.width,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (s) {},
                  ),
                  Text(
                    'Yes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (s) {},
                  ),
                  Text(
                    'No',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              12.width,
            ],
          ),
        ).addPadding(
          overall: 6,
        ),
        PaymentWidgetSurveyPage(),
      ],
    );
  }
}
