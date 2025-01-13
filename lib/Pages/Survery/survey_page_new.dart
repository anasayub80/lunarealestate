import 'package:flutter/material.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Survery/SurvProvider.dart';
import 'package:lunarestate/Pages/Survery/surveyData.dart';
import 'package:lunarestate/Pages/Survery/survey_questions.dart';
import 'package:lunarestate/Widgets/header_text.dart';
import 'package:lunarestate/Widgets/roundbutton.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../Models/SurveyModel.dart';
import '../../../../Service/UserData.dart';
import '../../../../Widgets/Utils.dart';
import '../../../../Widgets/choiceTile.dart';
import '../../../../Widgets/langChoicedialog.dart';
import '../../../../main.dart';
import '../../../../provider/languageProvider.dart';

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
    var singleNotifier = Provider.of<SingleNotifier>(context, listen: false);
    var langloc = AppLocalizations.of(context)!;
    var userProv = Provider.of<UserData>(context, listen: false);
    var prov = Provider.of<SurvProvider>(context, listen: false);

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
            onChange: (po) {},
          );
        }).toList(),
        12.height,
        roundButton(
          horizontalPadding: 15,
          buttonWidth: double.infinity,
          height: 55,
          circleBorder: 30,
          onClick: () async {
            // Navigator.push(
            //     context,
            //     PageTransition(
            //       isIos: true,
            //       duration: Duration(milliseconds: 700),
            //       child: SellHousePage(
            //         child: SurveyPage2(),
            //       ),
            //       type: PageTransitionType.fade,
            //     ));
            SurveyModel surveyModel = SurveyModel(
              assitnewhome: assistfornewHomeValY,
              backedtaxowed: backtaxValY,
              basement: basementValY,
              dryer: dryerValY,
              existingMorgage: exmValY,
              foundation: FoundationValY,
              gasUtilityavail: guaValY,
              helpmorgage: morghelpValY,
              isProp: isPropValY,
              lockbox: lockBoxValY,
              lop: lopValY,
              newhome: newHomeValY,
              owfinance: ownerFinanaceValY,
              range: rangeValY,
              sewer: sewerValY,
              survery: surveryValY,
              washer: washerValY,
              waterOn: washerValY,
              tab: 'survey_info',
              formid: prov.formid,
              userid: Provider.of<UserData>(context, listen: false).id!,
            );
            var res =
                await submitpropertyInfo(false, surveyModel.toJson(), context);
            if (res == '1') {
              // setState((() {
              prov.activeStepIndex += 1;
              prov.saveStepIndex(prov.activeStepIndex);
            } else {
              Utils().showSnackbar('Something Wrong', Colors.red, context);
            }
          },
          text: 'NEXT',
        ),
      ],
    );
  }
}
