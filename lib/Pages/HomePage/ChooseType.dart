import 'package:flutter/material.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import 'package:lunarestate/Pages/Survery/pages/children_widgets/survey_page.dart';
import 'package:lunarestate/Pages/Survery/pages/children_widgets/survey_page_2.dart';
import 'package:lunarestate/Pages/Survery/survey_page_new.dart';
import 'package:lunarestate/Pages/Survery/survey_questions.dart';
import 'package:lunarestate/Widgets/roundbutton.dart';
import 'package:page_transition/page_transition.dart';

class ChooseType extends StatelessWidget {
  const ChooseType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgTwo(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Do you want to sell a?",
            style: TextStyle(
              // color: Color(0xFFDBAE68),
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          20.height,
          roundButton(
            buttonWidth: double.infinity,
            onClick: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text("Land Survey"),
                    ),
                    backgroundColor: AppThemes.bgColor,
                    body: SingleChildScrollView(
                      child: SurveyPageNew(
                      surveyQuestions: askWhenBuyingLand,
                      ),
                    ),
                  ),
                  // isIos: true,
                  duration: Duration(milliseconds: 800),
                ),
              );
            },
            text: "Land",
            textColor: Colors.white,
          ),
          20.height,
          roundButton(
            buttonWidth: double.infinity,
            onClick: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text("Property Survey"),
                    ),
                    backgroundColor: AppThemes.bgColor,
                    body: SingleChildScrollView(
                      child: SurveyPageNew(
                        surveyQuestions: newSurveyQuestions,
                      ),
                    ),
                  ),
                  // isIos: true,
                  duration: Duration(milliseconds: 800),
                ),
              );
            },
            text: "Commercial",
            textColor: Colors.white,
          ),
        ],
      )),
    );
  }
}
