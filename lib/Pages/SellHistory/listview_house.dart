import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Config/bc_ext.dart';
// import 'package:lunarestate/Config/bc_ext.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/SellHistory/fullDetail.dart';

Widget getListView(List property, int dataLength, BuildContext context) {
  return SizedBox(
    height: context.screenHeight,
    width: double.infinity,
    child: ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: dataLength,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return FullDetail(
                  from: 'name',
                  formId: property[index]['id'],
                );
              }),
            );
          },
          child: Container(
            height: context.screenHeight * 0.14,
            width: double.infinity,
            decoration: AppThemes.commonBoxDecoration,
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Image.network(
                        property[index]['image'],
                        height: context.screenHeight * 0.14,
                        fit: BoxFit.fill,
                        width: context.screenWidth,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: property[index]['detailType'] == 'Complete'
                            ? SizedBox.shrink()
                            : Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8),
                                  child: Text(
                                    property[index]['detailType'],
                                    style: TextStyle(
                                      color: property[index]['detailType'] ==
                                              'Complete'
                                          ? Colors.green
                                          : Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          6.width,
                          Text(
                            property[index]['title'],
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      4.height,
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: AppThemes.secondarycolor,
                          ),
                          Text(
                            property[index]['location'],
                            style: TextStyle(
                              fontSize: 12,
                              color: AppThemes.secondarycolor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      4.height,
                      Row(
                        children: [
                          6.width,
                          Text(
                            property[index]['date'],
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      4.height,
                      Row(
                        children: [
                          6.width,
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.trashCan,
                                  color: Colors.white,
                                  size: 12,
                                ),
                                Text(
                                  "Delete",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xffE10A0A),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            height: 22,
                            width: 66,
                          ),
                        ],
                      ),
                    ],
                  ).addPadding(overall: 6),
                ),
              ],
            ),
          ),
        ).addPadding(vertical: 12);
      },
    ),
  );
}
