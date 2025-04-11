import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:lunarestate/Models/BasicInfoMode.dart';
import 'package:lunarestate/Models/SurveyModel.dart';
import 'package:lunarestate/Models/SurveyModelMore.dart';
import 'package:lunarestate/Service/UserData.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import '../../Models/PropInfoModel.dart';
import '../../Service/sharedPref.dart';
import 'surveyData.dart';

class SurvProvider with ChangeNotifier {
  int activeStepIndex = 0;
  int get getactiveStepIndex => activeStepIndex;
  String? formid;
  double value = 0;
  double get getvalue => value;
  void resetState() async {
    activeStepIndex = 0;
    formid = null;
    value = 0;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('activeStepIndex', 0);
    notifyListeners();
  }

  String get getFormId => formid!;
  Future updateStepIndex(var activeStepIndex) async {
    activeStepIndex = activeStepIndex;
    notifyListeners();
  }

  Future saveStepIndex(var activeStepIndex) async {
    final prefs = await SharedPreferences.getInstance();
    activeStepIndex = prefs.setInt('activeStepIndex', activeStepIndex);
    notifyListeners();
  }

  initStepIndex() async {
    final prefs = await SharedPreferences.getInstance();
    activeStepIndex = prefs.getInt('activeStepIndex') ?? 0;
    debugPrint("activeStepIndex $activeStepIndex");
    if (ownerNumber.text.isEmpty || ownerName.text.isEmpty) {
      activeStepIndex = 0;
      stepperIndexStream.add('done');
    }
    stepperIndexStream.add('done');
    notifyListeners();
  }

  void saveFormId(String formId, BuildContext context) {
    Provider.of<SurvProvider>(context, listen: false).formid = formid;
    sharedPref().storeVal('formid', formId);
    getFormIdfrom();
  }

  void updateStarsValue(double val) {
    value = val;
    notifyListeners();
  }

  getFormIdfrom() async {
    final prefs = await SharedPreferences.getInstance();
    formid = prefs.getString('formid') ?? 'none';
  }

  // Basic info
  initBasicInfo(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    var basicData = prefs.getString('basicData');
    log('basic Info savedData');
    if (basicData != null) {
      Map<String, dynamic> jsonDatais = jsonDecode(basicData);
      BasicInfoModel basicInfoModel = BasicInfoModel.fromJson(jsonDatais);
      print(
          // ignore: use_build_context_synchronously
          "old id ${basicInfoModel.userid} new id  ${Provider.of<UserData>(context, listen: false).id}");
      if (basicInfoModel.userid ==
          // ignore: use_build_context_synchronously
          Provider.of<UserData>(context, listen: false).id) {
        ownerName.value = TextEditingValue(
          text: basicInfoModel.name,
        );
        ownerNumber.value = TextEditingValue(
          text: basicInfoModel.phone,
        );
        locationController.value = TextEditingValue(
          text: basicInfoModel.location,
        );
        location2Controller.value = TextEditingValue(
          text: basicInfoModel.location,
        );
        title.value = TextEditingValue(
          text: basicInfoModel.title,
        );
      }
    } else {
      log('Basic Data null');
    }
    basicInfoStream.add('done');
    notifyListeners();
  }

  // PropInfo
  Future<void> initGetPropSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('PropInfoData');
    if (data != null) {
      Map<String, dynamic> jsonDatais = jsonDecode(data);
      PropertyInfoModel propInfoModel = PropertyInfoModel.fromJson(jsonDatais);

      bedrooms.value = TextEditingValue(
        text: propInfoModel.bedrooms,
      );
      bathrooms.value = TextEditingValue(
        text: propInfoModel.bathrooms,
      );
      areaSize.value = TextEditingValue(
        text: propInfoModel.areasize,
      );
      stories.value = TextEditingValue(
        text: propInfoModel.stories,
      );

      squarefootageController.value = TextEditingValue(
        text: propInfoModel.squarefootage,
      );
    } else {
      log('Propert info null');
    }
    propInfoStream.add('done');
    notifyListeners();
  }

  savePropInfoData(BuildContext context) {
    PropertyInfoModel propInfoModel = PropertyInfoModel(
      bedrooms: bedrooms.text,
      bathrooms: bathrooms.text,
      areasize: areaSize.text,
      squarefootage: squarefootageController.text,
      stories: stories.text,
      formid: formid ?? '0',
      tab: 'property_info',
      userid: Provider.of<UserData>(context, listen: false).id!,
    );
    var modelData = jsonEncode(propInfoModel);
    debugPrint("Save Property Info Data");
    debugPrint(modelData);
    sharedPref().storeVal('PropInfoData', modelData);
  }

  savedbasicData(BuildContext context) {
    BasicInfoModel basicInfoModel = BasicInfoModel(
      title: title.text,
      location: locationController.text + location2Controller.text,
      name: ownerName.text,
      phone: ownerNumber.text,
      tab: 'basic_info',
      userid: Provider.of<UserData>(context, listen: false).id!,
    );
    var modelData = jsonEncode(basicInfoModel);
    sharedPref().storeVal('basicData', modelData);
  }

  // Survey
  initSurveyData() async {
    final prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('data');

    if (data != null) {
      Map<String, dynamic> jsonDatais = jsonDecode(data);
      SurveyModel pModel = SurveyModel.fromJson(jsonDatais);

      if (pModel.existingMorgage != 'none') {
        exmValY = pModel.existingMorgage.toLowerCase();
      }
      if (pModel.assitnewhome != 'none') {
        assistfornewHomeValY = pModel.assitnewhome.toLowerCase();
      }
      if (pModel.backedtaxowed != 'none') {
        backtaxValY = pModel.backedtaxowed.toLowerCase();
      }
      if (pModel.basement != 'none') {
        basementValY = pModel.basement.toLowerCase();
      }
      if (pModel.dryer != 'none') {
        dryerValY = pModel.dryer.toLowerCase();
      }
      if (pModel.foundation != 'none') {
        FoundationValY = pModel.foundation.toLowerCase();
      }
      if (pModel.gasUtilityavail != 'none') {
        guaValY = pModel.gasUtilityavail.toLowerCase();
      }
      if (pModel.helpmorgage != 'none') {
        morghelpValY = pModel.helpmorgage.toLowerCase();
      }
      if (pModel.isProp != 'none') {
        isPropValY = pModel.isProp.toLowerCase();
      }
      if (pModel.lockbox != 'none') {
        lockBoxValY = pModel.lockbox.toLowerCase();
      }
      if (pModel.lop != 'none') {
        lopValY = pModel.lop.toLowerCase();
      }
      if (pModel.newhome != 'none') {
        newHomeValY = pModel.newhome.toLowerCase();
      }
      if (pModel.owfinance != 'none') {
        ownerFinanaceValY = pModel.owfinance.toLowerCase();
      }
      if (pModel.range != 'none') {
        rangeValY = pModel.range.toLowerCase();
      }
      if (pModel.sewer != 'none') {
        sewerValY = pModel.sewer.toLowerCase();
      }
      if (pModel.survery != 'none') {
        surveryValY = pModel.survery.toLowerCase();
      }
      if (pModel.washer != 'none') {
        washerValY = pModel.washer.toLowerCase();
      }
      if (pModel.waterOn != 'none') {
        waterValY = pModel.waterOn.toLowerCase();
      }
    }
    surveyStream.add('done');
    notifyListeners();
  }

  initSurveyMoreData() async {
    final prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('surveyMore');
    if (data != null) {
      Map<String, dynamic> jsonDatais = jsonDecode(data);
      SurveyMoreModel pModel = SurveyMoreModel.fromJson(jsonDatais);
      backedTaxAmount.value = pModel.taxAmount;
      leanOnProp.value = pModel.lopExplain;
      timeFrameofPro.value = pModel.timeFrame;
      lockBoxPlaced.value = pModel.lockboxPlace;
      value = double.parse(pModel.rating);
    }
    surveyMoreStream.add('done');

    notifyListeners();
  }

  void saveSurveyData(var id) {
    SurveyModel model = SurveyModel(
      // survery data
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
      waterOn: waterValY,
      tab: 'survey',
      userid: id,
      formid: formid,
    );
    var modelData = jsonEncode(model);
    debugPrint(modelData);
    sharedPref().storeVal('data', modelData);
  }

  void saveSurveyMoreData(var uid) {
    SurveyMoreModel model = SurveyMoreModel(
      // survery data
      lockboxPlace: lockBoxPlaced.value.toString(),
      lopExplain: leanOnProp.value.toString(),
      paymethod: cash == true
          ? 'Cash'
          : check == true
              ? 'Check'
              : 'Wire Transfer',
      rating: value.toString(),
      fastcash: fastcashY,

      taxAmount: backedTaxAmount.value.toString(),
      timeFrame: timeFrameofPro.value.toString(),
      tab: 'survey_more',
      formid: formid.toString(),
      userid: uid.toString(),
    );
    var modelData = jsonEncode(model);
    debugPrint(modelData);
    sharedPref().storeVal('data', modelData);
  }
}
