// ignore_for_file: unused_field

import 'dart:developer';
import 'package:lunarestate/Models/BasicInfoMode.dart';
import 'package:lunarestate/Models/PropInfoModel.dart';
import 'package:lunarestate/Models/SurveyModelMore.dart';
import 'package:lunarestate/Pages/Survery/SurvProvider.dart';
import 'package:lunarestate/Service/surveryServices.dart';

import 'package:flutter/material.dart';

import '../../Models/SurveyModel.dart';
import '../../Service/UserData.dart';
import '../../Widgets/Utils.dart';
import '../../Widgets/customAppBar.dart';

import 'package:provider/provider.dart';
import 'SurveyWidgets.dart';
import 'surveyData.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';

class SuerveyPage extends StatefulWidget {
  const SuerveyPage({super.key});

  @override
  State<SuerveyPage> createState() => _SuerveyPageState();
}

class _SuerveyPageState extends State<SuerveyPage> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    Provider.of<SurvProvider>(context, listen: false).initStepIndex();
    Provider.of<SurvProvider>(context, listen: false).getFormIdfrom();
  }

  @override
  void dispose() {
    ownerName.value = TextEditingValue(text: '');
    ownerNumber.value = TextEditingValue(text: '');
    title.value = TextEditingValue(text: '');
    areaSize.value = TextEditingValue(text: '');
    stories.value = TextEditingValue(text: '');
    locationController.value = TextEditingValue(text: '');
    squarefootageController.value = TextEditingValue(text: '');
    timeFrameofPro.value = TextEditingValue(text: '');
    backedTaxAmount.value = TextEditingValue(text: '');
    leanOnProp.value = TextEditingValue(text: '');
    lockBoxPlaced.value = TextEditingValue(text: '');

    super.dispose();
  }

  final controller = MultiImagePickerController(
    maxImages: 10,
    allowedImageTypes: ['png', 'jpg', 'jpeg'],
  );
  // final List<File> images = [];

  bool more = false;
  List<Step> stepList() => [
        Step(
          state: Provider.of<SurvProvider>(context, listen: false)
                      .activeStepIndex <=
                  0
              ? StepState.editing
              : StepState.complete,
          isActive: Provider.of<SurvProvider>(context, listen: false)
                  .activeStepIndex >=
              0,
          title: Text('Basic Info'),
          content: basicInfo(),
        ),
        Step(
          state: Provider.of<SurvProvider>(context, listen: false)
                      .activeStepIndex <=
                  1
              ? StepState.editing
              : StepState.complete,
          isActive: Provider.of<SurvProvider>(context, listen: false)
                  .activeStepIndex >=
              1,
          title: Text('Property Info'),
          content: propertyInfo(),
        ),
        Step(
          title: Text('Upload Images'),
          state: StepState.complete,
          isActive: Provider.of<SurvProvider>(context, listen: false)
                  .activeStepIndex >=
              3,
          content: Padding(
            padding: const EdgeInsets.only(left: 35.0),
            child: MultiImageWidget(controller: controller),
          ),
        ),
        Step(
          title: Text('Survey'),
          state: StepState.complete,
          isActive: Provider.of<SurvProvider>(context, listen: false)
                  .activeStepIndex >=
              2,
          content: more == false ? survey() : surveyMore(),
        ),
      ];

// x-x-x-x-x survey checkbox bool x-x-x-x-x
  SurverySurvices survServices = SurverySurvices();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    var prov = Provider.of<SurvProvider>(context, listen: false);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                CustomAppBarwithBackButton('We Buy Houses'),
              ];
            },
            body: Container(
              child: Theme(
                data: ThemeData(
                  canvasColor: Colors.transparent,
                  primarySwatch: Colors.amber,
                  iconTheme: IconThemeData(),
                  colorScheme: ColorScheme.dark(
                    primary: Colors.amber,
                    secondary: Colors.amber,
                    background: Colors.grey,
                  ),
                ),
                child: StreamBuilder(
                    stream: stepperIndexStream.stream,
                    builder: (context, AsyncSnapshot snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Center(child: CircularProgressIndicator());

                        default:
                          if (snapshot.hasError) {
                            return Text('Error');
                          } else {
                            return Stepper(
                              margin: EdgeInsets.all(0),
                              type: StepperType.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              currentStep: prov.activeStepIndex,
                              controlsBuilder:
                                  (context, ControlsDetails controls) {
                                return Padding(
                                  padding: prov.activeStepIndex >= 3
                                      ? const EdgeInsets.symmetric(
                                          horizontal: 12.0)
                                      : const EdgeInsets.only(left: 45.0),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        if (prov.activeStepIndex > 0)
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: controls.onStepCancel,
                                              child: const Text('Back'),
                                            ),
                                          ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: controls.onStepContinue,
                                            child: const Text('Next'),
                                          ),
                                        ),
                                      ],
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                    ),
                                  ),
                                );
                              },
                              steps: stepList(),
                              onStepContinue: () async {
                                if (prov.activeStepIndex <
                                    (stepList().length - 1)) {
                                  log(prov.activeStepIndex.toString());
                                  switch (prov.activeStepIndex) {
                                    case 0:
                                      if (basicInfoFormKey.currentState!
                                          .validate()) {
                                        Provider.of<SurvProvider>(context,
                                                listen: false)
                                            .savedbasicData(context);
                                        BasicInfoModel basicInfomodel =
                                            BasicInfoModel(
                                                title: title.text,
                                                phone: ownerNumber.text,
                                                name: ownerName.text,
                                                location:
                                                    locationController.text,
                                                userid: Provider.of<UserData>(
                                                        context,
                                                        listen: false)
                                                    .id!,
                                                tab: 'basic_info');
                                        var res = await submitpropertyInfo(true,
                                            basicInfomodel.toJson(), context);
                                        if (res == '1') {
                                          setState((() {
                                            prov.activeStepIndex += 1;
                                          }));
                                        } else {
                                          // ignore: use_build_context_synchronously
                                          Utils().showSnackbar(
                                              'Something Wrong',
                                              Colors.red,
                                              context);
                                        }
                                      }
                                      break;
                                    case 1:
                                      if (propInfoFormKey.currentState!
                                          .validate()) {
                                        Provider.of<SurvProvider>(context,
                                                listen: false)
                                            .savePropInfoData(context);
                                        PropertyInfoModel propInfoModel =
                                            PropertyInfoModel(
                                          bedrooms: bedrooms.text,
                                          bathrooms: bathrooms.text,
                                          areasize: areaSize.text,
                                          stories: stories.text,
                                          formid: prov.formid!,
                                          tab: 'property_info',
                                          squarefootage:
                                              squarefootageController.text,
                                          // ignore: use_build_context_synchronously
                                          userid: Provider.of<UserData>(context,
                                                  listen: false)
                                              .id!,
                                        );

                                        // ignore:
                                        var res = await submitpropertyInfo(
                                            false,
                                            propInfoModel.toJson(),
                                            context);
                                        if (res == '1') {
                                          setState((() {
                                            prov.activeStepIndex += 1;
                                          }));
                                        } else {
                                          // ignore: use_build_context_synchronously
                                          Utils().showSnackbar(
                                              'Something Wrong',
                                              Colors.red,
                                              context);
                                        }
                                      }
                                      break;
                                    case 2:
                                      if (images.isEmpty) {
                                        Utils().showSnackbar(
                                            'Select at least 4 Image',
                                            Colors.red,
                                            context);
                                        log('No Image Selected ${images.length.toString()}');
                                      } else if (images.length >= 4) {
                                        // ignore: use_build_context_synchronously
                                        var res =
                                            await submitMultipleImages(context);
                                        if (res == '1') {
                                          setState((() {
                                            prov.activeStepIndex += 1;
                                          }));
                                        }
                                      } else {
                                        Utils().showSnackbar(
                                            'Select at least 4 Image',
                                            Colors.red,
                                            context);
                                      }
                                      break;
                                    default:
                                  }
                                } else {
                                  if (more) {
                                    prov.saveSurveyData(Provider.of<UserData>(
                                            context,
                                            listen: false)
                                        .id!);
                                    log("Survey More ${prov.formid}");
                                    SurveyMoreModel surveyMoreData =
                                        SurveyMoreModel(
                                      userid: Provider.of<UserData>(context,
                                              listen: false)
                                          .id!,
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
                                    submitpropertyInfo(false,
                                        surveyMoreData.toJson(), context);
                                  } else {
                                    log("Survey ${prov.formid}");
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
                                      userid: Provider.of<UserData>(context,
                                              listen: false)
                                          .id!,
                                    );
                                    submitpropertyInfo(
                                        false, surveyModel.toJson(), context);
                                    setState(() {
                                      more = true;
                                    });
                                  }
                                }

                                prov.saveStepIndex(prov.activeStepIndex);
                              },
                              onStepCancel: () {
                                if (prov.activeStepIndex == 0) {
                                  return;
                                }
                                if (more) {
                                  setState(() {
                                    more = false;
                                  });
                                } else {
                                  setState((() {
                                    prov.activeStepIndex -= 1;
                                  }));
                                }
                                prov.saveStepIndex(prov.activeStepIndex);
                              },
                              onStepTapped: (int index) {
                                log(index.toString());
                                switch (index) {
                                  case 0:
                                    setState((() {
                                      prov.activeStepIndex = index;
                                    }));
                                    prov.saveStepIndex(prov.activeStepIndex);

                                    break;
                                  case 1:
                                    if (basicInfoFormKey.currentState!
                                        .validate()) {
                                      setState((() {
                                        prov.activeStepIndex = index;
                                      }));
                                      prov.saveStepIndex(prov.activeStepIndex);
                                    }
                                    break;
                                  case 2:
                                    if (propInfoFormKey.currentState!
                                        .validate()) {
                                      setState((() {
                                        prov.activeStepIndex = index;
                                      }));
                                      prov.saveStepIndex(prov.activeStepIndex);
                                    }
                                    break;
                                  default:
                                }
                              },
                            );
                          }
                      }
                    }),
              ),
              decoration: BoxDecoration(
                  color: Color(0xff141414),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  )),
              height: size.height,
              width: double.infinity,
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
      ),
    );
  }
}
