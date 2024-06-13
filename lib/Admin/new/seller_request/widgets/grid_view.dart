import 'package:lunarestate/Admin/AppTheme.dart';
// import 'package:lunarestate/Admin/widgets/app_bar_global.dart';
import 'package:lunarestate/Config/bc_ext.dart';

import 'package:flutter/material.dart';
import 'package:lunarestate/Config/spacing_ext.dart';

Widget getGridViewAdmin(BuildContext context, Map property, int dataLength) {
  return SizedBox(
    height: context.screenHeight,
    width: double.infinity,
    child: GridView.builder(
      itemCount: dataLength,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: Container(
            width: double.infinity,
            decoration: AppThemes.commonBoxDecoration,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      Image.network(
                        'https://picsum.photos/200/300',
                        // height: context.screenHeight * 0.1,
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: 'Complete' == 'Complete'
                            ? SizedBox.shrink()
                            : Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8),
                                  child: Text(
                                    'Complete',
                                    style: TextStyle(
                                      color: 'Complete' == 'Complete'
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
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          6.width,
                          Text(
                            'Arcade X',
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
                            'Larachi se thora bahir',
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
                            '12 May 2023',
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFFBEB8B8),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      6.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          6.width,
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.email,
                                  color: Colors.white,
                                  size: 12,
                                ),
                                Text(
                                  "Call",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Color(0xff3A3D41),
                                borderRadius: BorderRadius.circular(4),
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            height: 22,
                            width: 66,
                          ),
                          20.width,
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                  size: 12,
                                ),
                                Text(
                                  "Call",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xff4ABE5D),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            height: 22,
                            width: 66,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ).addPadding(overall: 8),
        );
      },
    ),
  );
}
