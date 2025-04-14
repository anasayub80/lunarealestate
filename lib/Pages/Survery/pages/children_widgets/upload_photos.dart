import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lunarestate/Config/bc_ext.dart';
import 'package:lunarestate/Config/config.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Survery/pages/sell_house_provider.dart';
import 'package:lunarestate/Widgets/header_text.dart';
import 'package:lunarestate/Widgets/roundbutton.dart';
import 'package:provider/provider.dart';

import '../../../../Widgets/Utils.dart';
import '../../SurvProvider.dart';
import '../../surveyData.dart';

class UploadPhotos extends StatelessWidget {
  const UploadPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SellHouseProvider>(context);
    var prov = Provider.of<SurvProvider>(context, listen: false);

    return SingleChildScrollView(
      child: Column(
        children: [
          getHeader(
            'Upload Photos',
          ),
          20.height,
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
                        visible: images.length != 10,
                        child: ImagePickWidget(provider: provider)),
                  ],
                ),
                child: ImagePickWidget(provider: provider));
          }),
          12.height,
          Visibility(
            visible: provider.selectedHouseImages.isNotEmpty,
            replacement: roundButton(
              horizontalPadding: 15,
              buttonWidth: double.infinity,
              height: 55,
              circleBorder: 30,
              onClick: () async {
                if (images.isEmpty) {
                  Utils.showSnackbar(
                    'Select at least 10 Image',
                    Colors.red,
                    context,
                  );
                } else if (images.length >= 10) {
                  var res = await submitMultipleImages(context);
                  if (res == '1') {
                    prov.activeStepIndex += 1;
                    prov.saveStepIndex(prov.activeStepIndex);
                  }
                } else {
                  Utils.showSnackbar(
                      'Select at least 10 Image', Colors.red, context);
                }
              },
              text: 'NEXT',
            ),
            child: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class ImagePickWidget extends StatelessWidget {
  const ImagePickWidget({
    super.key,
    required this.provider,
  });

  final SellHouseProvider provider;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: mainColor,
      borderType: BorderType.RRect,
      radius: Radius.circular(12),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        child: Container(
          height: context.screenHeight * 0.21,
          width: double.infinity,
          color: Color(0xFF202326),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  provider.selectHouseImages();
                },
                child: SvgPicture.asset(
                  'assets/icons/upload_photo_icon.svg',
                ),
              ),
              15.height,
              RichText(
                text: TextSpan(
                  text: 'Upload atleast',
                  children: [
                    TextSpan(
                        text: ' 10 ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                      text: 'Images from gallery',
                    ),
                  ],
                ),
              ),
            ],
          ).center(),
        ),
      ),
    ).addPadding(
      overall: 31,
    );
  }
}
