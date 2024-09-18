import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Config/bc_ext.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Widgets/choiceTile.dart';
import 'package:lunarestate/Widgets/header_text.dart';
import 'package:provider/provider.dart';
import '../../../../Models/SurveyModelMore.dart';
import '../../../../Service/UserData.dart';
import '../../../../Widgets/roundbutton.dart';
import '../../SurvProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../surveyData.dart';

class SurveyPage2 extends StatefulWidget {
  const SurveyPage2({super.key});

  @override
  State<SurveyPage2> createState() => _SurveyPage2State();
}

class _SurveyPage2State extends State<SurveyPage2> {
  @override
  void initState() {
    super.initState();
    Provider.of<SurvProvider>(context, listen: false).initSurveyMoreData();
  }

  @override
  Widget build(BuildContext context) {
    var langloc = AppLocalizations.of(context)!;
    var prov = Provider.of<SurvProvider>(context, listen: false);
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
                    langloc.timeframe,
                    style: TextStyle(
                      color: AppThemes.secondarycolor,
                    ),
                  ),
                  SizedBox(),
                ],
              ).addPadding(left: 21, top: 21),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    langloc.eg,
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
                      children: [
                        Expanded(
                          child: TextField(
                            controller: timeFrameofPro,
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                            onSubmitted: (value) {
                              Provider.of<SurvProvider>(context, listen: false)
                                  .saveSurveyMoreData(Provider.of<UserData>(
                                          context,
                                          listen: false)
                                      .id!);
                            },
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                int timeFrame = int.parse(timeFrameofPro.text);
                                timeFrameofPro.text =
                                    (timeFrame + 1).toString();
                              },
                              child: Icon(
                                Icons.arrow_drop_up,
                                color: Color(0XffBBBBBB),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (int.parse(timeFrameofPro.text) >= 1) {
                                  int timeFrame =
                                      int.parse(timeFrameofPro.text);
                                  timeFrameofPro.text =
                                      (timeFrame - 1).toString();
                                }
                              },
                              child: Icon(
                                Icons.arrow_drop_down,
                                color: Color(0xFFBBBBBB),
                              ),
                            ),
                          ],
                        ).addPadding(right: 10),
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
                langloc.ratecond,
                style: TextStyle(
                  color: AppThemes.secondarycolor,
                ),
              ),
              RatingStars(
                value: Provider.of<SurvProvider>(context, listen: true).value,
                onValueChanged: (v) {
                  Provider.of<SurvProvider>(context, listen: false)
                      .updateStarsValue(v);
                },
                starBuilder: (index, color) => Icon(
                  Icons.star,
                  color: color,
                ),
                starCount: 5,
                starSize: 40,
                valueLabelRadius: 10,
                maxValue: 5,
                starSpacing: 5,
                maxValueVisibility: true,
                valueLabelVisibility: false,
                animationDuration: Duration(milliseconds: 1000),
                valueLabelPadding:
                    const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                valueLabelMargin: const EdgeInsets.only(right: 8),
                starOffColor: const Color(0xffe7e8ea),
                starColor: Color(0xffF1A530),
              ),
            ],
          ),
        ).addPadding(overall: 6),
        12.height,

        if (backtaxValY == 'true') ...[
          ListTile(
            title: Text(
              langloc.backedtaxamount,
              style: TextStyle(color: AppThemes.primaryColor),
            ),
            leading: Icon(
              FontAwesomeIcons.moneyBill,
              color: Colors.white,
            ),
            subtitle: TextField(
              controller: backedTaxAmount,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.start,
              onSubmitted: (value) {
                Provider.of<SurvProvider>(context, listen: false)
                    .saveSurveyMoreData(
                        Provider.of<UserData>(context, listen: false).id!);
              },
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintText: langloc.enteramount,
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
        10.height,
        if (lopValY == 'true') ...[
          ListTile(
            title: Text(
              langloc.lopexplain,
              style: TextStyle(color: AppThemes.primaryColor),
            ),
            leading: Icon(
              Icons.houseboat_outlined,
              color: Colors.white,
            ),
            subtitle: TextField(
              controller: leanOnProp,
              keyboardType: TextInputType.name,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.start,
              onSubmitted: (value) {
                Provider.of<SurvProvider>(context, listen: false)
                    .saveSurveyMoreData(
                        Provider.of<UserData>(context, listen: false).id!);
              },
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintText: langloc.explease,
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
        if (lockBoxValY == 'true')
          ListTile(
            title: Text(
              langloc.describeplace,
              style: TextStyle(color: AppThemes.primaryColor),
            ),
            leading: Icon(
              Icons.add_box,
              color: Colors.white,
            ),
            subtitle: TextField(
              controller: lockBoxPlaced,
              keyboardType: TextInputType.name,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.start,
              onSubmitted: (value) {
                Provider.of<SurvProvider>(context, listen: false)
                    .saveSurveyMoreData(
                        Provider.of<UserData>(context, listen: false).id!);
              },
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintText: langloc.describe,
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),

        ChoiceTileNew(
            y: fastcashY == 'none'
                ? false
                : fastcashY == 'true'
                    ? true
                    : false,
            n: fastcashY == 'none'
                ? false
                : fastcashY == 'true'
                    ? false
                    : true,
            index: ' ',
            title: langloc.fastcash,
            onChange1: (newVal) {
              if (newVal!) {
                setState(() {
                  fastcashY = 'true';
                });
              } else {
                setState(() {
                  fastcashY = 'none';
                });
              }
              Provider.of<SurvProvider>(context, listen: false)
                  .saveSurveyMoreData(
                      Provider.of<UserData>(context, listen: false).id!);
            },
            onChange2: (newVal) {
              if (newVal!) {
                setState(() {
                  fastcashY = 'false';
                });
              } else {
                setState(() {
                  exmValY = 'none';
                });
              }
              print(newVal);
              Provider.of<SurvProvider>(context, listen: false)
                  .saveSurveyMoreData(
                      Provider.of<UserData>(context, listen: false).id!);
            },
            box1: langloc.yes,
            box2: 'No'),
        SizedBox(
          height: 10,
        ), // PaymentWidgetSurveyPage(),

        // Container(
        //   height: context.screenHeight * 0.08,
        //   width: double.infinity,
        //   decoration: AppThemes.commonBoxDecoration,
        //   child: Row(
        //     children: [
        //       SvgPicture.asset("assets/icons/payment_card_icon.svg").addPadding(
        //         horizontal: 12,
        //       ),
        //       6.height,
        //       Text(
        //         langloc.payment,
        //         style: TextStyle(
        //           fontWeight: FontWeight.w500,
        //           color: Colors.white,
        //           fontSize: 16,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // 8.height,
        // Container(
        //   decoration: AppThemes.commonBoxDecoration,
        //   child: Column(
        //     children: [
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Text(
        //             langloc.cash,
        //             style: TextStyle(
        //               color: Colors.white,
        //               fontSize: 18,
        //             ),
        //           ).addPadding(left: 4),
        //           Checkbox(
        //               activeColor: Colors.amber,
        //               value: cash,
        //               onChanged: (newVal) {
        //                 if (cash) {
        //                   setState(() {
        //                     cash = newVal!;
        //                   });
        //                 } else {
        //                   setState(() {
        //                     cash = newVal!;
        //                     check = false;
        //                     wire = false;
        //                   });
        //                 }

        //                 Provider.of<SurvProvider>(context, listen: false)
        //                     .saveSurveyMoreData(
        //                         Provider.of<UserData>(context, listen: false)
        //                             .id!);
        //               }),
        //         ],
        //       ).addPadding(overall: 8),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Text(
        //             langloc.check,
        //             style: TextStyle(
        //               color: Colors.white,
        //               fontSize: 18,
        //             ),
        //           ).addPadding(left: 4),
        //           Checkbox(
        //               value: check,
        //               activeColor: Colors.amber,
        //               onChanged: (newVal) {
        //                 if (check) {
        //                   setState(() {
        //                     check = newVal!;
        //                   });
        //                 } else {
        //                   setState(() {
        //                     cash = false;
        //                     check = newVal!;
        //                     wire = false;
        //                   });
        //                 }
        //                 Provider.of<SurvProvider>(context, listen: false)
        //                     .saveSurveyMoreData(
        //                         Provider.of<UserData>(context, listen: false)
        //                             .id!);
        //               }),
        //         ],
        //       ).addPadding(overall: 8),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Text(
        //             langloc.wiredep,
        //             style: TextStyle(
        //               color: Colors.white,
        //               fontSize: 18,
        //             ),
        //           ).addPadding(left: 4),
        //           Checkbox(
        //               value: wire,
        //               activeColor: Colors.amber,
        //               onChanged: (newVal) {
        //                 if (wire) {
        //                   setState(() {
        //                     wire = newVal!;
        //                   });
        //                 } else {
        //                   setState(() {
        //                     cash = false;
        //                     wire = newVal!;
        //                     check = false;
        //                   });
        //                 }
        //                 Provider.of<SurvProvider>(context, listen: false)
        //                     .saveSurveyMoreData(
        //                         Provider.of<UserData>(context, listen: false)
        //                             .id!);
        //               }),
        //         ],
        //       ).addPadding(overall: 8),
        //     ],
        //   ),
        // ),
        18.height,
        roundButton(
          horizontalPadding: 8,
          buttonWidth: double.infinity,
          height: 55,
          circleBorder: 30,
          onClick: () async {
            prov.saveSurveyData(
                Provider.of<UserData>(context, listen: false).id!);
            SurveyMoreModel surveyMoreData = SurveyMoreModel(
              userid: Provider.of<UserData>(context, listen: false).id!,
              taxAmount: backedTaxAmount.text,
              lopExplain: leanOnProp.text,
              lockboxPlace: lockBoxPlaced.text,
              rating: prov.value.toString(),
              fastcash: fastcashY,
              paymethod: 'autoget',
              timeFrame: timeFrameofPro.text,
              tab: 'survey_more',
              formid: prov.formid,
            );
            await submitpropertyInfo(false, surveyMoreData.toJson(), context);
          },
          text: 'SUBMITED',
        ),
      ],
    );
  }
}
