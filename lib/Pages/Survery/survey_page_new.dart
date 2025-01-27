import 'package:floading/floading.dart';
import 'package:flutter/material.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Survery/surveyData.dart';
import 'package:lunarestate/Pages/Survery/survey_questions.dart';
import 'package:lunarestate/Widgets/header_text.dart';
import 'package:lunarestate/Widgets/roundbutton.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../../../../Service/UserData.dart';
import '../../../../Widgets/Utils.dart';
import '../../../../Widgets/choiceTile.dart';
import '../../main.dart';

// import '../../SurvProvider.dart';
// import '../../surveyData.dart';
class SurveyPageNew extends StatefulWidget {
  const SurveyPageNew({super.key, this.surveyQuestions});

  final List<SurveyQuestions>? surveyQuestions;
  @override
  State<SurveyPageNew> createState() => _SurveyPageNewState();
}

class _SurveyPageNewState extends State<SurveyPageNew> {
  @override
  Widget build(BuildContext context) {
    // var singleNotifier = Provider.of<SingleNotifier>(context, listen: false);
    // var langloc = AppLocalizations.of(context)!;
    // var userProv = Provider.of<UserData>(context, listen: false);
    // var prov = Provider.of<SurvProvider>(context, listen: false);

    return Column(
      children: [
        12.height,
        getHeader(
          'Survey',
        ),
        ...widget.surveyQuestions!.map<Widget>((toElement) {
          return ChoiceTileNewV(
            title: toElement.question,
            surveryAnswer: toElement.answers,
            index: 'index',
            onChange: (po) {
              debugPrint(
                  "ChoiceTileNewV \n ${toElement.question} \n ${toElement.answers}");
            },
          );
        }).toList(),
        10.height,
        roundButton(
          horizontalPadding: 15,
          buttonWidth: double.infinity,
          height: 55,
          circleBorder: 30,
          onClick: () async {
            List<Map<String, dynamic>> questionsAndAnswers =
                widget.surveyQuestions!.map((surveyQuestion) {
              return {
                "question": surveyQuestion.question,
                "answers": surveyQuestion.answers.map((answer) {
                  return {
                    "answer": answer.answer,
                    "selectedAnswer": answer.selectedAnswer,
                  };
                }).toList(),
              };
            }).toList();

            var surveyData = {
              "formid": "formID${DateTime.now().microsecondsSinceEpoch}",
              "userid": Provider.of<UserData>(context, listen: false).id,
              "questions_and_answers": questionsAndAnswers,
            };

            var res = await submitSurvey(surveyData, context);
            if (res == '1') {
              FLoading.hide();
              Utils.showSnackbar('Survey Submitted', Colors.green, context);
              Navigator.of(context).popUntil((route) => route.isFirst);
              Navigator.pushReplacement(
                context,
                PageTransition(
                  child: MyNavigation(),
                  isIos: true,
                  duration: Duration(milliseconds: 600),
                  type: PageTransitionType.bottomToTop,
                ),
              );
            } else {
              FLoading.hide();
              Utils.showSnackbar('Something Wrong', Colors.red, context);
            }
          },
          text: 'NEXT',
        ),
        50.height,
      ],
    );
  }
}
