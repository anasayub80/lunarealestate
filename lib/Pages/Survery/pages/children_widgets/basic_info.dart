import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Survery/surveyData.dart';
import 'package:lunarestate/Widgets/header_text.dart';
import 'package:lunarestate/Widgets/roundbutton.dart';
import 'package:lunarestate/Widgets/textBox.dart';
import 'package:provider/provider.dart';
import '../../../../Models/BasicInfoMode.dart';
import '../../../../Service/UserData.dart';
import '../../../../Widgets/Utils.dart';
import '../../SurvProvider.dart';

class BasicInfo extends StatefulWidget {
  BasicInfo({super.key});

  @override
  State<BasicInfo> createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  @override
  void initState() {
    super.initState();
    Provider.of<SurvProvider>(context, listen: false).initBasicInfo(context);
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<SurvProvider>(context, listen: false);
    return Form(
      key: basicInfoFormKey,
      child: Column(
        children: [
          getHeader(
            'Basic Info',
          ),
          45.height,
          textBox(
            controller: ownerName,
            hint: 'Name of owner',
            icon: SvgPicture.asset(
              'assets/icons/person_icon.svg',
            ),
            validator: (email) {
              if (ownerName.text.isNotEmpty)
                return null;
              else
                return 'Enter Owner Name';
            },
            isSvg: true,
            Ktype: TextInputType.name,
          ).addPadding(
            horizontal: 10,
          ),
          20.height,
          textBox(
            controller: ownerNumber,
            Ktype: TextInputType.number,
            validator: (phone) {
              if (ownerNumber.text.isNotEmpty)
                return null;
              else
                return 'Enter Owner Number';
            },
            hint: 'Best Number to contact you?',
            icon: SvgPicture.asset(
              'assets/icons/phone_icon.svg',
            ),
            isSvg: true,
          ).addPadding(
            horizontal: 10,
          ),
          20.height,
          textBox(
            controller: title,
            onFieldSubmitted: (value) {
              Provider.of<SurvProvider>(context, listen: false)
                  .savePropInfoData(context);
            },
            validator: (titlet) {
              if (title.text.isNotEmpty)
                return null;
              else
                return 'Enter property title';
            },
            hint: 'Property Title',
            icon: SvgPicture.asset(
              'assets/icons/title_icon.svg',
            ),
            isSvg: true,
            Ktype: TextInputType.text,
          ).addPadding(
            horizontal: 10,
          ),
          20.height,
          textBox(
            controller: locationController,
            Ktype: TextInputType.streetAddress,
            onFieldSubmitted: (value) {
              Provider.of<SurvProvider>(context, listen: false)
                  .savePropInfoData(context);
            },
            validator: (address) {
              if (locationController.text.isNotEmpty)
                return null;
              else
                return 'Enter address';
            },
            hint: 'Address here',
            icon: SvgPicture.asset(
              'assets/icons/location.svg',
            ),
            isSvg: true,
          ).addPadding(
            horizontal: 10,
          ),
          40.height,
          roundButton(
            buttonWidth: double.infinity,
            horizontalPadding: 15,
            height: 55,
            circleBorder: 30,
            onClick: () async {
              if (basicInfoFormKey.currentState!.validate()) {
                Provider.of<SurvProvider>(context, listen: false)
                    .savedbasicData(context);
                BasicInfoModel basicInfomodel = BasicInfoModel(
                  title: title.text,
                  phone: ownerNumber.text,
                  name: ownerName.text,
                  location: locationController.text,
                  userid: Provider.of<UserData>(context, listen: false).id!,
                  tab: 'basic_info',
                );
                var res = await submitpropertyInfo(
                    true, basicInfomodel.toJson(), context);
                debugPrint('response $res');
                if (res == '1') {
                  // setState((() {
                  prov.activeStepIndex += 1;
                  prov.saveStepIndex(prov.activeStepIndex);
                } else {
                  Utils().showSnackbar('Something Wrong', Colors.red, context);
                }
              }
            },
            text: 'NEXT',
          ),
        ],
      ),
    );
  }
}
