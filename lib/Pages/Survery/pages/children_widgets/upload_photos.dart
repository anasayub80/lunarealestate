// import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lunarestate/Config/bc_ext.dart';
import 'package:lunarestate/Config/config.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Survery/pages/children_widgets/survey_page.dart';
import 'package:lunarestate/Pages/Survery/pages/sell_house.dart';
import 'package:lunarestate/Pages/Survery/pages/sell_house_provider.dart';
import 'package:lunarestate/Widgets/header_text.dart';
import 'package:lunarestate/Widgets/roundbutton.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class UploadPhotos extends StatelessWidget {
  const UploadPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SellHouseProvider>(context);

    return Column(
      children: [
        getHeader(
          'Upload Photos',
        ),
        45.height,
        Consumer<SellHouseProvider>(builder: (context, p, _) {
          return Visibility(
            visible: provider.selectedHouseImages.isEmpty,
            replacement: SizedBox(
              height: context.screenHeight * 0.5,
              width: context.screenWidth,
              child: ListView.builder(
                itemCount: p.selectedHouseImages.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                provider.selectedHouseImages[i].name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              4.height,
                              Text(
                                '33',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          InkWell(
                            // onDoubleTap: ,
                            // onTap: () {
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
            ),
            child: DottedBorder(
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
                                text: ' 4 ',
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
            ),
          );
        }),
        12.height,
        Visibility(
          visible: provider.selectedHouseImages.isEmpty,
          replacement: roundButton(
            horizontalPadding: 15,
            buttonWidth: double.infinity,
            height: 55,
            circleBorder: 30,
            onClick: () {
              // Navigator.push(context, route);
              Navigator.push(
                  context,
                  PageTransition(
                    isIos: true,
                    duration: Duration(milliseconds: 700),
                    child: SellHousePage(
                      child: SurveryWidget(),
                    ),
                    type: PageTransitionType.fade,
                  ));
            },
            text: 'NEXT',
          ),
          child: SizedBox.shrink(),
        ),
      ],
    );
  }
}
