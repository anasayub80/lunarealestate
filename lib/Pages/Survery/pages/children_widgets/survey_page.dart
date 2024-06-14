import 'package:flutter/material.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
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
import '../../SurvProvider.dart';
import '../../surveyData.dart';

class SurveyPageOne extends StatefulWidget {
  const SurveyPageOne({super.key});

  @override
  State<SurveyPageOne> createState() => _SurveyPageOneState();
}

class _SurveyPageOneState extends State<SurveyPageOne> {
  Locale? _temp;
  @override
  void initState() {
    super.initState();
    Provider.of<SurvProvider>(context, listen: false).initSurveyData();
  }

  @override
  Widget build(BuildContext context) {
    var singleNotifier = Provider.of<SingleNotifier>(context, listen: false);
    var langloc = AppLocalizations.of(context)!;
    var userProv = Provider.of<UserData>(context, listen: false);
    var prov = Provider.of<SurvProvider>(context, listen: false);

    return Column(
      children: [
        getHeader(
          'Survey',
        ),
        Column(
          children: [
            TextButton(
              child: Text(
                "Survey Language : ${langloc.language}",
                style: TextStyle(
                  color: AppThemes.whiteColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                ),
              ),
              onPressed: () async {
                await showSingleChoiceDialog(context);
                // ignore: use_build_context_synchronously
                if (singleNotifier.currentlanguage != 'English') {
                  _temp = Locale('es');
                  // ignore: use_build_context_synchronously
                  MyApp.setLocale(context, _temp!);
                } else {
                  _temp = Locale('en');
                  // ignore: use_build_context_synchronously
                  MyApp.setLocale(context, _temp!);
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            ChoiceTileNew(
                y: exmValY == 'none'
                    ? false
                    : exmValY == 'true'
                        ? true
                        : false,
                n: exmValY == 'none'
                    ? false
                    : exmValY == 'true'
                        ? false
                        : true,
                index: '1',
                title: langloc.exm,
                onChange1: (newVal) {
                  if (newVal!) {
                    setState(() {
                      exmValY = 'true';
                    });
                  } else {
                    setState(() {
                      exmValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                onChange2: (newVal) {
                  if (newVal!) {
                    setState(() {
                      exmValY = 'false';
                    });
                  } else {
                    setState(() {
                      exmValY = 'none';
                    });
                  }
                  print(newVal);
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                box1: langloc.yes,
                box2: 'No'),
            ChoiceTileNew(
                y: surveryValY == 'none'
                    ? false
                    : surveryValY == 'true'
                        ? true
                        : false,
                n: surveryValY == 'none'
                    ? false
                    : surveryValY == 'true'
                        ? false
                        : true,
                index: '2',
                title: langloc.survey,
                onChange1: (newVal) {
                  if (newVal!) {
                    setState(() {
                      surveryValY = 'true';
                    });
                  } else {
                    setState(() {
                      surveryValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                onChange2: (newVal) {
                  if (newVal!) {
                    setState(() {
                      surveryValY = 'false';
                    });
                  } else {
                    setState(() {
                      surveryValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                box1: langloc.yes,
                box2: 'No'),
            ChoiceTileNew(
                y: washerValY == 'none'
                    ? false
                    : washerValY == 'true'
                        ? true
                        : false,
                n: washerValY == 'none'
                    ? false
                    : washerValY == 'true'
                        ? false
                        : true,
                index: '3',
                title: langloc.washer,
                onChange1: (newVal) {
                  if (newVal!) {
                    setState(() {
                      washerValY = 'true';
                    });
                  } else {
                    setState(() {
                      washerValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                onChange2: (newVal) {
                  if (newVal!) {
                    setState(() {
                      washerValY = 'false';
                    });
                  } else {
                    setState(() {
                      washerValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                box1: langloc.yes,
                box2: 'No'),
            ChoiceTileNew(
                y: dryerValY == 'none'
                    ? false
                    : dryerValY == 'true'
                        ? true
                        : false,
                n: dryerValY == 'none'
                    ? false
                    : dryerValY == 'true'
                        ? false
                        : true,
                index: '4',
                onChange1: (newVal) {
                  if (newVal!) {
                    setState(() {
                      dryerValY = 'true';
                    });
                  } else {
                    setState(() {
                      dryerValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                onChange2: (newVal) {
                  if (newVal!) {
                    setState(() {
                      dryerValY = 'false';
                    });
                  } else {
                    setState(() {
                      dryerValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                title: langloc.dryer,
                box1: langloc.yes,
                box2: 'No'),
            ChoiceTileNew(
                y: rangeValY == 'none'
                    ? false
                    : rangeValY == 'true'
                        ? true
                        : false,
                n: rangeValY == 'none'
                    ? false
                    : rangeValY == 'true'
                        ? false
                        : true,
                index: '5',
                onChange1: (newVal) {
                  if (newVal!) {
                    setState(() {
                      rangeValY = 'true';
                    });
                  } else {
                    setState(() {
                      rangeValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                onChange2: (newVal) {
                  if (newVal!) {
                    setState(() {
                      rangeValY = 'false';
                    });
                  } else {
                    setState(() {
                      rangeValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                title: langloc.range,
                box1: 'Electric',
                box2: 'Gas'),
            ChoiceTileNew(
                y: guaValY == 'none'
                    ? false
                    : guaValY == 'true'
                        ? true
                        : false,
                n: guaValY == 'none'
                    ? false
                    : guaValY == 'true'
                        ? false
                        : true,
                index: '6',
                onChange1: (newVal) {
                  if (newVal!) {
                    setState(() {
                      guaValY = 'true';
                    });
                  } else {
                    setState(() {
                      guaValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                onChange2: (newVal) {
                  if (newVal!) {
                    setState(() {
                      guaValY = 'false';
                    });
                  } else {
                    setState(() {
                      guaValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                title: langloc.gua,
                box1: langloc.yes,
                box2: 'No'),
            ChoiceTileNew(
                y: waterValY == 'none'
                    ? false
                    : waterValY == 'true'
                        ? true
                        : false,
                n: waterValY == 'none'
                    ? false
                    : waterValY == 'true'
                        ? false
                        : true,
                index: '7',
                onChange1: (newVal) {
                  if (newVal!) {
                    setState(() {
                      waterValY = 'true';
                    });
                  } else {
                    setState(() {
                      waterValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                onChange2: (newVal) {
                  if (newVal!) {
                    setState(() {
                      waterValY = 'false';
                    });
                  } else {
                    setState(() {
                      waterValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                title: langloc.wateron,
                box1: 'City',
                box2: 'Well'),
            ChoiceTileNew(
                y: sewerValY == 'none'
                    ? false
                    : sewerValY == 'true'
                        ? true
                        : false,
                n: sewerValY == 'none'
                    ? false
                    : sewerValY == 'true'
                        ? false
                        : true,
                index: '8',
                onChange1: (newVal) {
                  if (newVal!) {
                    setState(() {
                      sewerValY = 'true';
                    });
                  } else {
                    setState(() {
                      sewerValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                onChange2: (newVal) {
                  if (newVal!) {
                    setState(() {
                      sewerValY = 'false';
                    });
                  } else {
                    setState(() {
                      sewerValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                title: langloc.sewer,
                box1: 'City',
                box2: 'Septic'),
            ChoiceTileNew(
                y: backtaxValY == 'none'
                    ? false
                    : backtaxValY == 'true'
                        ? true
                        : false,
                n: backtaxValY == 'none'
                    ? false
                    : backtaxValY == 'true'
                        ? false
                        : true,
                index: '9',
                onChange1: (newVal) {
                  if (newVal!) {
                    setState(() {
                      backtaxValY = 'true';
                    });
                  } else {
                    setState(() {
                      backtaxValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                onChange2: (newVal) {
                  if (newVal!) {
                    setState(() {
                      backtaxValY = 'false';
                    });
                  } else {
                    setState(() {
                      backtaxValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                title: langloc.bto,
                box1: langloc.yes,
                box2: 'No'),
            ChoiceTileNew(
                y: lopValY == 'none'
                    ? false
                    : lopValY == 'true'
                        ? true
                        : false,
                n: lopValY == 'none'
                    ? false
                    : lopValY == 'true'
                        ? false
                        : true,
                index: '10',
                onChange1: (newVal) {
                  if (newVal!) {
                    setState(() {
                      lopValY = 'true';
                    });
                  } else {
                    setState(() {
                      lopValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                onChange2: (newVal) {
                  if (newVal!) {
                    setState(() {
                      lopValY = 'false';
                    });
                  } else {
                    setState(() {
                      lopValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                title: langloc.lop,
                box1: langloc.yes,
                box2: 'No'),
            ChoiceTileNew(
                y: isPropValY == 'none'
                    ? false
                    : isPropValY == 'true'
                        ? true
                        : false,
                n: isPropValY == 'none'
                    ? false
                    : isPropValY == 'true'
                        ? false
                        : true,
                index: '11',
                onChange1: (newVal) {
                  if (newVal!) {
                    setState(() {
                      isPropValY = 'true';
                    });
                  } else {
                    setState(() {
                      isPropValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                onChange2: (newVal) {
                  if (newVal!) {
                    setState(() {
                      isPropValY = 'false';
                    });
                  } else {
                    setState(() {
                      isPropValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                title: langloc.isProp,
                box1: langloc.vecant,
                box2: langloc.occupied),
            ChoiceTileNew(
                y: lockBoxValY == 'none'
                    ? false
                    : lockBoxValY == 'true'
                        ? true
                        : false,
                n: lockBoxValY == 'none'
                    ? false
                    : lockBoxValY == 'true'
                        ? false
                        : true,
                index: '12',
                onChange1: (newVal) {
                  if (newVal!) {
                    setState(() {
                      lockBoxValY = 'true';
                    });
                  } else {
                    setState(() {
                      lockBoxValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                onChange2: (newVal) {
                  if (newVal!) {
                    setState(() {
                      lockBoxValY = 'false';
                    });
                  } else {
                    setState(() {
                      lockBoxValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                title: langloc.istherelopinspec,
                box1: langloc.yes,
                box2: 'No'),
            ChoiceTileNew(
                y: ownerFinanaceValY == 'none'
                    ? false
                    : ownerFinanaceValY == 'true'
                        ? true
                        : false,
                n: ownerFinanaceValY == 'none'
                    ? false
                    : ownerFinanaceValY == 'true'
                        ? false
                        : true,
                index: '13',
                onChange1: (newVal) {
                  if (newVal!) {
                    setState(() {
                      ownerFinanaceValY = 'true';
                    });
                  } else {
                    setState(() {
                      ownerFinanaceValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                onChange2: (newVal) {
                  if (newVal!) {
                    setState(() {
                      ownerFinanaceValY = 'false';
                    });
                  } else {
                    setState(() {
                      ownerFinanaceValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                title: langloc.opentoOfinanced,
                box1: langloc.yes,
                box2: 'No'),
            ChoiceTileNew(
                y: newHomeValY == 'none'
                    ? false
                    : newHomeValY == 'true'
                        ? true
                        : false,
                n: newHomeValY == 'none'
                    ? false
                    : newHomeValY == 'true'
                        ? false
                        : true,
                index: '14',
                onChange1: (newVal) {
                  if (newVal!) {
                    setState(() {
                      newHomeValY = 'true';
                    });
                  } else {
                    setState(() {
                      newHomeValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                onChange2: (newVal) {
                  if (newVal!) {
                    setState(() {
                      newHomeValY = 'false';
                    });
                  } else {
                    setState(() {
                      newHomeValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                title: langloc.areyoulooking,
                box1: langloc.yes,
                box2: 'No'),
            ChoiceTileNew(
                y: assistfornewHomeValY == 'none'
                    ? false
                    : assistfornewHomeValY == 'true'
                        ? true
                        : false,
                n: assistfornewHomeValY == 'none'
                    ? false
                    : assistfornewHomeValY == 'true'
                        ? false
                        : true,
                index: '15',
                onChange1: (newVal) {
                  if (newVal!) {
                    setState(() {
                      assistfornewHomeValY = 'true';
                    });
                  } else {
                    setState(() {
                      assistfornewHomeValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                onChange2: (newVal) {
                  if (newVal!) {
                    setState(() {
                      assistfornewHomeValY = 'false';
                    });
                  } else {
                    setState(() {
                      assistfornewHomeValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                title: langloc.assistancefornewhome,
                box1: langloc.yes,
                box2: 'No'),
            ChoiceTileNew(
                y: morghelpValY == 'none'
                    ? false
                    : morghelpValY == 'true'
                        ? true
                        : false,
                n: morghelpValY == 'none'
                    ? false
                    : morghelpValY == 'true'
                        ? false
                        : true,
                index: '16',
                onChange1: (newVal) {
                  if (newVal!) {
                    setState(() {
                      morghelpValY = 'true';
                    });
                  } else {
                    setState(() {
                      morghelpValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                onChange2: (newVal) {
                  if (newVal!) {
                    setState(() {
                      morghelpValY = 'false';
                    });
                  } else {
                    setState(() {
                      morghelpValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                title: langloc.morgagelender,
                box1: langloc.yes,
                box2: 'No'),
            ChoiceTileNew(
                y: FoundationValY == 'none'
                    ? false
                    : FoundationValY == 'true'
                        ? true
                        : false,
                n: FoundationValY == 'none'
                    ? false
                    : FoundationValY == 'true'
                        ? false
                        : true,
                index: '17',
                onChange1: (newVal) {
                  if (newVal!) {
                    setState(() {
                      FoundationValY = 'true';
                    });
                  } else {
                    setState(() {
                      FoundationValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                onChange2: (newVal) {
                  if (newVal!) {
                    setState(() {
                      FoundationValY = 'false';
                    });
                  } else {
                    setState(() {
                      FoundationValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                title: langloc.foundation,
                box1: langloc.pierandbeam,
                box2: langloc.slab),
            ChoiceTileNew(
                y: basementValY == 'none'
                    ? false
                    : basementValY == 'true'
                        ? true
                        : false,
                n: basementValY == 'none'
                    ? false
                    : basementValY == 'true'
                        ? false
                        : true,
                index: '18',
                onChange1: (newVal) {
                  if (newVal!) {
                    setState(() {
                      basementValY = 'true';
                    });
                  } else {
                    setState(() {
                      basementValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                onChange2: (newVal) {
                  if (newVal!) {
                    setState(() {
                      basementValY = 'false';
                    });
                  } else {
                    setState(() {
                      basementValY = 'none';
                    });
                  }
                  Provider.of<SurvProvider>(context, listen: false)
                      .saveSurveyData(userProv.id!);
                },
                title: langloc.havebasement,
                box1: langloc.yes,
                box2: 'No'),
          ],
        ),
        40.height,
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
