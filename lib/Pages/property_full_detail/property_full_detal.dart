// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'dart:async';
import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:floading/floading.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Config/bc_ext.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import 'package:lunarestate/Pages/SellHistory/fullDetail.dart';
import 'package:lunarestate/Pages/property_full_detail/property_detail_controller.dart';
import 'package:lunarestate/Service/backend.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

import '../../Widgets/Utils.dart';
import '../Gallery/ImageView.dart';
import 'package:page_transition/page_transition.dart';

StreamController _houseDetail = BehaviorSubject();

getData(String formId) async {
  // add error to show loading progress
  _houseDetail.addError('loading');
  log('calling data');
  var res = await backend().fetchFullPropertyDetails(formId);
  _houseDetail.add(res);
}

class PropertyFullDetail extends StatefulWidget {
  String from;

  String formId;
  PropertyFullDetail({super.key, required this.formId, required this.from});

  @override
  State<PropertyFullDetail> createState() => _PropertyFullDetailState();
}

class _PropertyFullDetailState extends State<PropertyFullDetail> {
  PageController _pageController = PageController();

  final List<String> imgList = [];

  getImages() async {
    var res = await backend().fetchPropertyImages(widget.formId);
    if (res != null)
      for (var i = 0; i < res.length; i++) {
        log('image $i');
        imgList.add(res[i]['gallery']);
      }
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      // Update the page index when the page changes
      context
          .read<PropertyDetailController>()
          .updatePage(_pageController.page?.round() ?? 0);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    getData(widget.formId);
    return Scaffold(
      body: BgTwo(
        child: Container(
          child: ListView(
            children: [
              FutureBuilder(
                  future: getImages(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());

                      default:
                        if (snapshot.hasError) {
                          return Text('Error');
                        } else if (imgList.length >= 1) {
                          return Column(
                            children: [
                              Stack(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.40,
                                    width: double.infinity,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(20)),
                                      child: PageView.builder(
                                        controller: _pageController,
                                        itemCount: imgList.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onDoubleTap: () {
                                              Navigator.push(
                                                context,
                                                PageTransition(
                                                  child: ImageView(
                                                      url: imgList[index]),
                                                  type: PageTransitionType.fade,
                                                ),
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                          bottom:
                                                              Radius.circular(
                                                                  20))),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.40,
                                              width: double.infinity,
                                              child: Center(
                                                child: CachedNetworkImage(
                                                  imageUrl: imgList[index],
                                                  width: double.infinity,
                                                  fit: BoxFit.fill,
                                                  placeholder: (context, url) =>
                                                      Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(Icons.error),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            context.popFromScreen();
                                          },
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 14,
                                            child: Icon(
                                              Icons.keyboard_arrow_left,
                                              size: 28,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        if (widget.from != 'admin')
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  PageTransition(
                                                    isIos: true,
                                                    duration: Duration(
                                                        milliseconds: 700),
                                                    child: FullDetail(
                                                      formId: widget.formId,
                                                      from: 'name',
                                                    ),
                                                    type:
                                                        PageTransitionType.fade,
                                                  ));
                                            },
                                            child: SvgPicture.asset(
                                              'assets/icons/edit_pencil.svg',
                                              height: 26,
                                            ),
                                          )
                                        else
                                          SizedBox.shrink(),
                                      ],
                                    ).addPadding(left: 20, right: 20, top: 10),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Consumer<PropertyDetailController>(
                                builder: (context, pageState, child) {
                                  return AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height:
                                        30, // Adjust height for the indicator container
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: List.generate(
                                        imgList.length,
                                        (index) => AnimatedContainer(
                                          duration: Duration(milliseconds: 300),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 4),
                                          height: 8, // Dot height
                                          width: pageState.currentPage == index
                                              ? 36
                                              : 8, // Dot width
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                8), // Circle shape
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        }

                        return Container(
                          height: MediaQuery.of(context).size.height * 0.40,
                          width: double.infinity,
                          child: Center(
                            child: Image.asset(
                              'assets/icons/defaultHouse.png',
                              height: MediaQuery.of(context).size.height,
                              fit: BoxFit.fill,
                              width: double.infinity,
                            ),
                          ),
                        );
                    }
                  }),
              SizedBox(
                height: 10,
              ),
              Visibility(
                visible: true,
                child: StreamBuilder<dynamic>(
                    stream: _houseDetail.stream,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Center(child: CircularProgressIndicator());
                        default:
                          if (snapshot.hasError) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            debugPrint('detail${snapshot.data}');
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  20.height,
                                  Text(
                                    '${snapshot.data[0]['title']}',
                                    style: TextStyle(
                                      fontSize: 32,
                                      color: AppThemes.primaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Outfit',
                                    ),
                                  ),
                                  Text(
                                    "${snapshot.data[0]['location']}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontFamily: 'Outfit',
                                    ),
                                  ),
                                  10.height,
                                  Divider(
                                    thickness: 0.8,
                                    color: Color(0xff424448),
                                  ),
                                  10.height,
                                  Consumer<PropertyDetailController>(
                                    builder: (context, controller, child) {
                                      final isExpanded = controller.isExpanded;
                                      final text = snapshot.data[0]['survery'];
                                      debugPrint(text);

                                      String displayText = isExpanded
                                          ? text
                                          : text.length > 150
                                              ? text.substring(0, 150)
                                              : text;

                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xffAAAAAA),
                                                fontFamily: 'Outfit',
                                              ),
                                              children: [
                                                TextSpan(
                                                    text:
                                                        displayText), // Actual text
                                                if (!isExpanded &&
                                                    text.length > 150)
                                                  TextSpan(
                                                    text: '... ',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffAAAAAA)),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.toggleExpanded();
                                            },
                                            child: Text(
                                              isExpanded
                                                  ? ' See Less'
                                                  : ' See More',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  10.height,
                                  Divider(
                                    thickness: 0.5,
                                    color: Color(0xff424448),
                                  ),
                                  10.height,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Features',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: AppThemes.secondarycolor,
                                          fontFamily: 'Outfit',
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return FullDetail(
                                                  formId: widget.formId,
                                                  from: 'admin');
                                            },
                                          ));
                                        },
                                        child: Text(
                                          'See all',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontFamily: 'Outfit',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  10.height,
                                  ListRow(
                                    iconPath: 'assets/icons/sq.svg',
                                    label: 'Area',
                                    value: "${snapshot.data[0]['areaSize']}",
                                  ),
                                  10.height,
                                  ListRow(
                                    iconPath: 'assets/icons/bedroom.svg',
                                    label: 'Bedrooms',
                                    value: "${snapshot.data[0]['bedrooms']}",
                                  ),
                                  10.height,
                                  ListRow(
                                    iconPath: 'assets/icons/bathroom.svg',
                                    label: 'Bathrooms',
                                    value: "${snapshot.data[0]['bathrooms']}",
                                  ),
                                ],
                              ),
                            );
                          }
                      }
                    }),
              ),
            ],
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      ),
      bottomNavigationBar: widget.from == 'admin'
          ? Container(
              color: AppThemes.bgColor,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          AwesomeDialog(
                              context: context,
                              dialogType: DialogType.warning,
                              headerAnimationLoop: false,
                              animType: AnimType.topSlide,
                              title: 'Purchased Property',
                              desc: 'do you want to mark this as purchased?',
                              btnCancelOnPress: () {},
                              onDismissCallback: (type) {
                                debugPrint(
                                    'Dialog Dismiss from callback $type');
                              },
                              btnOkText: 'Yes',
                              btnOkOnPress: () async {
                                var res = await backend().update({
                                  'value': '3',
                                  'column': 'detailType',
                                  'table': 'house_details',
                                  'id': widget.formId,
                                });

                                if (res['status'] == 'success') {
                                  debugPrint('success');
                                  FLoading.hide();
                                  Navigator.pop(context, 'success');
                                } else {
                                  FLoading.hide();
                                  debugPrint('fail');
                                  Utils.showSnackbar(
                                      res['msg'], Colors.red, context);
                                }
                              }).show();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: Text(
                          'Purchased',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          AwesomeDialog(
                              context: context,
                              dialogType: DialogType.warning,
                              headerAnimationLoop: false,
                              animType: AnimType.topSlide,
                              title: 'Delete Property',
                              desc: 'do you want to delete this property?',
                              btnCancelOnPress: () {},
                              onDismissCallback: (type) {
                                debugPrint(
                                  'Dialog Dismiss from callback $type',
                                );
                              },
                              btnOkText: 'Yes',
                              btnOkOnPress: () async {
                                FLoading.show(
                                  context,
                                  loading: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/icons/logo.png",
                                        width: 200,
                                        height: 200,
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      CircularProgressIndicator()
                                    ],
                                  ),
                                  closable: false,
                                  color: Colors.black.withOpacity(0.7),
                                );
                                var res = await backend().deleteProperty({
                                  'formid': widget.formId,
                                });

                                if (res['status'] == 'success') {
                                  FLoading.hide();
                                  Navigator.pop(context, 'success');
                                }
                              }).show();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: Text(
                          'Delete',
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              height: 60,
              width: double.infinity,
            )
          : SizedBox.shrink(),
    );
  }
}

class ListRow extends StatelessWidget {
  final String iconPath;
  final String label;
  final String value;

  const ListRow({
    Key? key,
    required this.iconPath,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(iconPath),
            SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontFamily: 'Outfit',
              ),
            ),
          ],
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontFamily: 'Outfit',
          ),
        ),
      ],
    );
  }
}
