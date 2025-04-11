// ignore_for_file: unused_element, use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lunarestate/Pages/HomePage/HomePage.dart';
import 'package:lunarestate/Pages/Survery/SurvProvider.dart';
import 'package:lunarestate/Pages/Survery/pages/sell_house_provider.dart';
import 'package:lunarestate/Service/backend.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:floading/floading.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widgets/Utils.dart';
import '../../main.dart';

// form key
final basicInfoFormKey = GlobalKey<FormState>();
final propInfoFormKey = GlobalKey<FormState>();

// agreement info fields
TextEditingController agreementNameController = TextEditingController();
TextEditingController agreementAddressController = TextEditingController();
TextEditingController agreementphoneController = TextEditingController();
TextEditingController agreementemailController = TextEditingController();
// agreement info fields

StreamController stepperIndexStream = BehaviorSubject();

List<String> peropertUnits = ['Sq. Ft.', 'Sq. M.', 'Sq. Yd']; // Option 2
String selectedPropertyUnit = 'Sq. Ft.'; // Option 2
String pLocation = '';
List<XFile> images = <XFile>[];

// ignore: must_be_immutable
// class AllController {
// basic info
TextEditingController ownerName = TextEditingController();
TextEditingController ownerNumber = TextEditingController();

// property info
TextEditingController title = TextEditingController();
TextEditingController bedrooms = TextEditingController();
TextEditingController bathrooms = TextEditingController();
TextEditingController areaSize = TextEditingController();
TextEditingController stories = TextEditingController();
TextEditingController locationController = TextEditingController();
TextEditingController location2Controller = TextEditingController();

TextEditingController squarefootageController = TextEditingController();
// survery checkbox bool
TextEditingController timeFrameofPro = TextEditingController(text: '1');
TextEditingController paymentMethod = TextEditingController();
TextEditingController backedTaxAmount = TextEditingController();
TextEditingController leanOnProp = TextEditingController();
TextEditingController lockBoxPlaced = TextEditingController();
// }

StreamController basicInfoStream = BehaviorSubject();

StreamController propInfoStream = BehaviorSubject();

// survey
String exmValY = 'none';
String surveryValY = 'none';
String washerValY = 'none';
String dryerValY = 'none';
String rangeValY = 'none';
String guaValY = 'none';
String waterValY = 'none';
String sewerValY = 'none';
String backtaxValY = 'none';
String lopValY = 'none';
String isPropValY = 'none';
String lockBoxValY = 'none';
String ownerFinanaceValY = 'none';
String newHomeValY = 'none';
String assistfornewHomeValY = 'none';
String fastcashY = 'none';
String morghelpValY = 'none';
String FoundationValY = 'none';
String basementValY = 'none';
bool cash = true;
bool check = false;
bool wire = false;

StreamController surveyStream = BehaviorSubject();
StreamController surveyMoreStream = BehaviorSubject();
void resetControllers() {
  ownerName.clear();
  ownerNumber.clear();
  title.clear();
  locationController.clear();
  location2Controller.clear();
  bedrooms.clear();
  bathrooms.clear();
  areaSize.clear();
  stories.clear();
  squarefootageController.clear();
  timeFrameofPro.clear();
  paymentMethod.clear();
  backedTaxAmount.clear();
  leanOnProp.clear();
  lockBoxPlaced.clear();
  agreementNameController.clear();
  agreementAddressController.clear();
  agreementphoneController.clear();
  agreementemailController.clear();
}

Future submitpropertyInfo(
    bool isbasic, dynamic data, BuildContext context) async {
  FLoading.show(
    context,
    loading: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/icons/logo.png",
          width: 200,
          height: 200,
        ),
        SizedBox(
          height: 25,
        ),
        CircularProgressIndicator()
      ],
    ),
    closable: false,
    color: Colors.black.withOpacity(0.7),
  );

  var res = await backend().submitForm(data);
  log(res.toString());
  if (res['status'] == 'success') {
    log('Detail type ${res['detailType']}');
    switch (res['detailType']) {
      case "0":
        log('case 0');
        FLoading.hide();
        log('this is my form id ${res['formid']}');
        Provider.of<SurvProvider>(context, listen: false)
            .saveFormId(res['formid'], context);
        log('Data Submitted');
        break;

      case "1":
        log('case 1');
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.remove('data');
        await pref.remove('formid');
        await pref.remove('activeStepIndex');
        await pref.remove('surveyMore');
        await pref.remove('PropInfoData');
        await pref.remove('basicData');
        resetControllers();
        Provider.of<SurvProvider>(context, listen: false).resetState();
        Provider.of<SellHouseProvider>(context, listen: false)
            .selectedHouseImages
            .clear();

        FLoading.hide();
        Utils.showSnackbar('Property Submitted', Colors.green, context);
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.pushReplacement(
          context,
          PageTransition(
            child: MyHomePage(),
            isIos: true,
            duration: Duration(milliseconds: 600),
            type: PageTransitionType.bottomToTop,
          ),
        );
        break;
      default:
    }
    return '1';
  } else {
    FLoading.hide();
    return '0';
  }
}

Future submitSurvey(dynamic data, BuildContext context) async {
  try {
    FLoading.show(
      context,
      loading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/icons/logo.png",
            width: 200,
            height: 200,
          ),
          SizedBox(
            height: 25,
          ),
          CircularProgressIndicator()
        ],
      ),
      closable: false,
      color: Colors.black.withOpacity(0.7),
    );
    // await Future.delayed(
    //   Duration(seconds: 2),
    //   () {
    //     FLoading.hide();
    //     return '1';
    //   },
    // );
    var res = await backend().submitsurvery(json.encode(data));
    // var res = await backend().submitsurvery(data);
    log("APIResponse: ${res.toString()}");
    if (res['status'] == 'success') {
      // log('Detail type ${res['detailType']}');
      return '1';
    } else {
      FLoading.hide();
      return '0';
    }
  } catch (e) {
    FLoading.hide();
    return '0';
    // throw Exception(e);
  }
}

Future submitMultipleImages(BuildContext context) async {
  FLoading.show(
    context,
    loading: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/icons/logo.png",
          width: 200,
          height: 200,
        ),
        SizedBox(
          height: 25,
        ),
        CircularProgressIndicator()
      ],
    ),
    closable: false,
    color: Colors.black.withOpacity(0.7),
  );

  await backend().uploadImageToServer(context);
  FLoading.hide();
  return '1';
}
// FLoading.show(
//     context,
//     loading: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Image.asset(
//           "assets/icons/icon.png",
//           width: 200,
//           height: 200,
//         ),
//         SizedBox(
//           height: 25,
//         ),
//         CircularProgressIndicator()
//       ],
//     ),
//     closable: false,
//     color: Colors.black.withOpacity(0.7),
//   );
