import 'package:flutter/material.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Survery/surveyData.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.height,
          Text('Basic Info',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'Outfit')),
          20.height,
          textBox(
            controller: ownerName,
            hint: 'Name of owner',
            icon: null,
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
            icon: null,
            isSvg: true,
          ).addPadding(
            horizontal: 10,
          ),
          20.height,
          Container(
            decoration: BoxDecoration(
              color: Color(0xff3B3C3E),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xff646566)),
            ),
            child: DropdownButtonFormField<String>(
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
              ),
              dropdownColor: Color(0xff3B3C3E),
              hint: Text(
                'Property Type',
                style: TextStyle(color: Colors.grey),
              ),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
              value: [
                'Residential',
                'Commercial',
                'Lot/Land',
                'Multi Family',
                'Other'
              ].contains(selectedPropertyType)
                  ? selectedPropertyType
                  : null,
              items: [
                'Residential',
                'Commercial',
                'Lot/Land',
                'Multi Family',
                'Other'
              ]
                  .map((type) => DropdownMenuItem<String>(
                        value: type,
                        child: Text(
                          type,
                          style: TextStyle(color: Colors.white),
                        ),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedPropertyType = value;
                });

                // Call your Provider method after selection
                Provider.of<SurvProvider>(context, listen: false)
                    .savePropInfoData(context);
              },
              validator: (value) =>
                  value == null ? 'Please select a property type' : null,
            ),
          ).addPadding(horizontal: 10),
          40.height,
          Text('Address',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'Outfit')),
          10.height,
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
            hint: 'Street, building, house number',
            icon: null,
            isSvg: true,
          ).addPadding(
            horizontal: 10,
          ),
          15.height,
          textBox(
            controller: location2Controller,
            Ktype: TextInputType.streetAddress,
            onFieldSubmitted: (value) {
              Provider.of<SurvProvider>(context, listen: false)
                  .savePropInfoData(context);
            },
            validator: (address) {
              return null;
            },
            hint: 'Apartment name (Optional)',
            icon: null,
            isSvg: true,
          ).addPadding(
            horizontal: 10,
          ),
          40.height,
          roundButton(
            buttonWidth: double.infinity,
            horizontalPadding: 15,
            height: 55,
            circleBorder: 12,
            onClick: () async {
              if (basicInfoFormKey.currentState!.validate()) {
                Provider.of<SurvProvider>(context, listen: false)
                    .savedbasicData(context);
                BasicInfoModel basicInfomodel = BasicInfoModel(
                  title: selectedPropertyType ?? 'others',
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
                  Utils.showSnackbar('Something Wrong', Colors.red, context);
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
