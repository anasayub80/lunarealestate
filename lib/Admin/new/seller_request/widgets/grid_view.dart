import 'package:cached_network_image/cached_network_image.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Admin/new/seller_request/seller_request_page.dart';
// import 'package:lunarestate/Admin/widgets/app_bar_global.dart';
import 'package:lunarestate/Config/bc_ext.dart';

import 'package:flutter/material.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/property_full_detail/property_full_detail.dart';

Widget getGridViewAdmin(BuildContext context, List property, Function? refresh,
    bool isHome, bool isScrollAble) {
  return SizedBox(
    height: context.screenHeight * 0.83,
    width: double.infinity,
    child: GridView.builder(
      itemCount: isHome ? property.length.clamp(0, 4) : property.length,
      physics: isScrollAble
          ? BouncingScrollPhysics()
          : NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 5.0,
          mainAxisExtent: 280),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final prop = property[index];
        return InkWell(
          onTap: () async {
            var res = await Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return PropertyFullDetail(formId: prop['id'], from: 'admin');
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
                SizedBox(
                  height: 120,
                  child: Stack(
                    children: [
                      // Image.network(
                      //   property![index]['image'],
                      //   // height: context.screenHeight * 0.1,
                      //   fit: BoxFit.fill,
                      //   width: double.infinity,
                      // ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                          imageUrl: prop['image'],
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: double.infinity,
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
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
                                      fontFamily: 'Outfit',
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                prop['title'],
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Text(
                              prop['date'].replaceAll("-", ""),
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                fontSize: 10,
                                color: Color(0xFFBEB8B8),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
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
                              maxLines: 1,
                              prop['location'],
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Outfit',
                                color: AppThemes.secondarycolor,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                      6.height,
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     6.width,
                      //     GestureDetector(
                      //       onTap: () {
                      //         launchUrl(Uri.parse('mailto:${prop['email']}'));
                      //       },
                      //       child: Container(
                      //         child: Row(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceEvenly,
                      //           crossAxisAlignment: CrossAxisAlignment.center,
                      //           children: [
                      //             Icon(
                      //               Icons.email,
                      //               color: Colors.white,
                      //               size: 12,
                      //             ),
                      //             Text(
                      //               "Email",
                      //               style: TextStyle(
                      //                   color: Colors.white,
                      //                   fontWeight: FontWeight.w400,
                      //                   fontSize: 12),
                      //             )
                      //           ],
                      //         ),
                      //         decoration: BoxDecoration(
                      //             color: Color(0xff3A3D41),
                      //             borderRadius: BorderRadius.circular(4),
                      //             border: Border.all(
                      //                 color: Colors.white, width: 2)),
                      //         height: 22,
                      //         width: 66,
                      //       ),
                      //     ),
                      //     15.width,

                      //   ],
                      // ),
                      SizedBox(
                        height: context.screenHeight * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: GestureDetector(
                          onTap: () {
                            makePhoneCall(prop['phone']);
                          },
                          child: Container(
                            child: Center(
                              child: Text(
                                "Call",
                                style: TextStyle(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xff4ABE5D),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            height: 35,
                            width: double.infinity,
                          ),
                        ),
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
