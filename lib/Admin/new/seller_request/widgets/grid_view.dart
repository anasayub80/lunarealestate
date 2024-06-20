import 'package:cached_network_image/cached_network_image.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Admin/new/seller_request/seller_request_page.dart';
// import 'package:lunarestate/Admin/widgets/app_bar_global.dart';
import 'package:lunarestate/Config/bc_ext.dart';

import 'package:flutter/material.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Pages/SellHistory/fullDetail.dart';

Widget getGridViewAdmin(
    BuildContext context, List property, Function? refresh) {
  return SizedBox(
    height: context.screenHeight,
    width: double.infinity,
    child: GridView.builder(
      itemCount: property.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final prop = property[index];
        return InkWell(
          onTap: () async {
            var res = await Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return FullDetail(formId: prop['id'], from: 'admin');
              },
            ));
            if (res == 'success') {
              refresh;
            }
          },
          child: Container(
            width: double.infinity,
            decoration: AppThemes.commonBoxDecoration,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      // Image.network(
                      //   property![index]['image'],
                      //   // height: context.screenHeight * 0.1,
                      //   fit: BoxFit.fill,
                      //   width: double.infinity,
                      // ),
                      CachedNetworkImage(
                        imageUrl: prop['image'],
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: double.infinity,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
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
                            prop['title'],
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
                          Expanded(
                            child: Text(
                              prop['location'],
                              style: TextStyle(
                                fontSize: 12,
                                color: AppThemes.secondarycolor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      4.height,
                      Row(
                        children: [
                          6.width,
                          Text(
                            prop['date'],
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
                          GestureDetector(
                            onTap: () {
                              launchUrl(Uri.parse('mailto:${prop['email']}'));
                            },
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.email,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                  Text(
                                    "Email",
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
                                  border: Border.all(
                                      color: Colors.white, width: 2)),
                              height: 22,
                              width: 66,
                            ),
                          ),
                          20.width,
                          GestureDetector(
                            onTap: () {
                              makePhoneCall(prop['phone']);
                            },
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
