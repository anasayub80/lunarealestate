import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Survery/surveyData.dart';
import 'package:lunarestate/Widgets/header_text.dart';
import 'package:lunarestate/Widgets/roundbutton.dart';
import 'package:lunarestate/Widgets/textBox.dart';
import 'package:provider/provider.dart';

import '../../../../Models/PropInfoModel.dart';
import '../../../../Service/UserData.dart';
import '../../../../Widgets/Utils.dart';
import '../../SurvProvider.dart';

class PropertyInfo extends StatefulWidget {
  PropertyInfo({super.key});

  @override
  State<PropertyInfo> createState() => _PropertyInfoState();
}

class _PropertyInfoState extends State<PropertyInfo> {
  @override
  void initState() {
    super.initState();
    Provider.of<SurvProvider>(context, listen: false).initGetPropSavedData();
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<SurvProvider>(context, listen: false);
    return Form(
      key: propInfoFormKey,
      child: Column(
        children: [
          getHeader(
            'Property Info',
          ),
          45.height,
          textBox(
            controller: areaSize,
            Ktype: TextInputType.number,
            onFieldSubmitted: (value) {
              Provider.of<SurvProvider>(context, listen: false)
                  .savePropInfoData(context);
            },
            validator: (areaSizec) {
              if (areaSize.text.isNotEmpty)
                return null;
              else
                return 'Enter areasize';
            },
            hint: 'Lot Size',
            icon: SvgPicture.asset(
              'assets/icons/lot_size_icon.svg',
            ),
            isSvg: true,
          ).addPadding(
            horizontal: 10,
          ),
          20.height,
          textBox(
            controller: bedrooms,
            Ktype: TextInputType.number,
            onFieldSubmitted: (value) {
              Provider.of<SurvProvider>(context, listen: false)
                  .savePropInfoData(context);
            },
            validator: (bedroomsc) {
              if (bedrooms.text.isNotEmpty)
                return null;
              else
                return 'Enter bedrooms';
            },
            hint: 'How many bedrooms?',
            icon: SvgPicture.asset(
              'assets/icons/bedroom_icon.svg',
            ),
            isSvg: true,
          ).addPadding(
            horizontal: 10,
          ),
          20.height,
          textBox(
            controller: bathrooms,
            validator: (bedroomsc) {
              if (bathrooms.text.isNotEmpty)
                return null;
              else
                return 'Enter bathrooms';
            },
            onFieldSubmitted: (value) {
              Provider.of<SurvProvider>(context, listen: false)
                  .savePropInfoData(context);
            },
            hint: 'How may bathrooms?',
            icon: SvgPicture.asset(
              'assets/icons/bathroom_icon.svg',
            ),
            isSvg: true,
            Ktype: TextInputType.number,
          ).addPadding(
            horizontal: 10,
          ),
          20.height,
          textBox(
            controller: stories,
            validator: (bedrooms) {
              if (stories.text.isNotEmpty)
                return null;
              else
                return 'Enter stories';
            },
            onFieldSubmitted: (value) {
              Provider.of<SurvProvider>(context, listen: false)
                  .savePropInfoData(context);
            },
            hint: 'How many stories?',
            icon: SvgPicture.asset(
              'assets/icons/stories_icon.svg',
            ),
            isSvg: true,
            Ktype: TextInputType.number,
          ).addPadding(
            horizontal: 10,
          ),
          20.height,
          textBox(
            controller: squarefootageController,
            validator: (bedroomss) {
              if (squarefootageController.text.isNotEmpty)
                return null;
              else
                return 'Interior Sq Ft';
            },
            onFieldSubmitted: (value) {
              Provider.of<SurvProvider>(context, listen: false)
                  .savePropInfoData(context);
            },
            hint: 'Interior Sq Ft',
            icon: SvgPicture.asset(
              'assets/icons/ft_icon.svg',
            ),
            isSvg: true,
            Ktype: TextInputType.number,
          ).addPadding(
            horizontal: 10,
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
              //         child: UploadPhotos(),
              //       ),
              //       type: PageTransitionType.fade,
              //     ));
              if (propInfoFormKey.currentState!.validate()) {
                Provider.of<SurvProvider>(context, listen: false)
                    .savePropInfoData(context);
                PropertyInfoModel propInfoModel = PropertyInfoModel(
                  bedrooms: bedrooms.text,
                  bathrooms: bathrooms.text,
                  areasize: areaSize.text,
                  stories: stories.text,
                  formid: prov.formid!,
                  tab: 'property_info',
                  squarefootage: squarefootageController.text,
                  userid: Provider.of<UserData>(context, listen: false).id!,
                );

                // ignore:
                var res = await submitpropertyInfo(
                    false, propInfoModel.toJson(), context);
                if (res == '1') {
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
