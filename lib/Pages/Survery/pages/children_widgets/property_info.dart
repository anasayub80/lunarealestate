import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Survery/pages/children_widgets/upload_photos.dart';
import 'package:lunarestate/Pages/Survery/pages/sell_house_provider.dart';
import 'package:lunarestate/Pages/Survery/surveyData.dart';
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
    final provider = Provider.of<SellHouseProvider>(context);
    return Form(
      key: propInfoFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Property Info',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'Outfit')),
          10.height,
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
            icon: null,
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
            icon: null,
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
            icon: null,
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
            icon: null,
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
            icon: null,
            isSvg: true,
            Ktype: TextInputType.number,
          ).addPadding(
            horizontal: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              40.height,
              Text('Upload Photos',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: 'Outfit')),
              10.height,
              Consumer<SellHouseProvider>(builder: (context, p, _) {
                return Visibility(
                    visible: provider.selectedHouseImages.isEmpty,
                    replacement: Column(
                      children: [
                        ListView.builder(
                          itemCount: p.selectedHouseImages.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (c, i) {
                            return Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    12.width,
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.file(
                                        File(p.selectedHouseImages[i].path),
                                        fit: BoxFit.cover,
                                        height: 100,
                                        width: 70,
                                      ),
                                    ),
                                    12.width,
                                    Column(children: [
                                      AutoSizeText(
                                        // provider.selectedHouseImages[i].name,
                                        "Image_$i",
                                        maxLines: 1,
                                        maxFontSize: 17,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ]),
                                    Spacer(),
                                    InkWell(
                                      onTap: () {
                                        p.removeSelectedImage(i);
                                      },
                                      child: Icon(
                                        Icons.close,
                                        color: Color(0Xff6A6464),
                                      ),
                                    ),
                                    4.width,
                                  ],
                                ),
                                12.height,
                              ],
                            );
                          },
                        ),
                        Visibility(
                            visible: images.length != 4,
                            child: ImagePickWidget(provider: provider)),
                      ],
                    ),
                    child: ImagePickWidget(provider: provider));
              }),
              12.height,
            ],
          ),
          40.height,
          Visibility(
            visible: provider.selectedHouseImages.isNotEmpty,
            child: roundButton(
              horizontalPadding: 15,
              buttonWidth: double.infinity,
              height: 55,
              circleBorder: 12,
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
                    if (images.isEmpty) {
                      Utils.showSnackbar(
                        'Select at least 4 Image',
                        Colors.red,
                        context,
                      );
                    } else if (images.length >= 4) {
                      var res = await submitMultipleImages(context);
                      if (res == '1') {
                        prov.activeStepIndex += 1;
                        prov.saveStepIndex(prov.activeStepIndex);
                      }
                    } else {
                      Utils.showSnackbar(
                          'Select at least 4 Image', Colors.red, context);
                    }
                  } else {
                    Utils.showSnackbar('Something Wrong', Colors.red, context);
                  }
                }
              },
              text: 'NEXT',
            ),
          ),
        ],
      ),
    );
  }
}
