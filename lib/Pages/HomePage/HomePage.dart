import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:floading/floading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Config/config.dart';
import 'package:lunarestate/Config/customDelgate.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import 'package:lunarestate/Pages/Gallery/GalleryPage.dart';
import 'package:lunarestate/Pages/HomePage/Widgets/sell_bottom_sheet.dart';
import 'package:lunarestate/Pages/SellHistory/fullDetail.dart';
import 'package:lunarestate/Pages/SellHistory/listview_house.dart';
import 'package:lunarestate/Pages/Survery/SurvProvider.dart';
import 'package:lunarestate/Pages/property_full_detail/property_full_detal.dart';
import 'package:lunarestate/Service/UserData.dart';
import 'package:lunarestate/Service/backend.dart';
import 'package:lunarestate/Widgets/global_appbar.dart';
import 'package:lunarestate/Widgets/roundbutton.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import '../SellHistory/SellHistory.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late VideoPlayerController controller;

  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }

  bool isSellSelected = true;

  // final _pageViewController = PageController(viewportFraction: 0.8);
  loadVideoPlayer() {
    controller = VideoPlayerController.asset('assets/intro.mp4',
        videoPlayerOptions: VideoPlayerOptions(
          allowBackgroundPlayback: false,
        ));
    controller.setVolume(0);
    controller.setLooping(true);
    controller.addListener(() {
      setStateIfMounted(() {});
    });
    controller.initialize().then((value) {
      setStateIfMounted(() {});
    });
    controller.play();
  }

  bool isGrid = true;
  togglegrid() {
    isGrid = !isGrid;
    setState(() {});
  }

  List img = [
    "20230313_153002.jpg",
    "20230412_115009.jpg",
    "20230718_151310.jpg",
    "20240907_125548.jpg",
    "Resized_20210320_132531_629897463582730.jpeg",
    "20230616_172333.jpg",
    "Back Left.JPG",
  ];
  int currentPage = 0;
  void updateCurrentPageTop(int page) {
    setState(() {
      currentPage = page;
    });
  }

  deleteSurveyOldData(String myformId) async {
    if (Provider.of<SurvProvider>(context, listen: false).formid == myformId) {
      log('Delete form Data');
      SharedPreferences pref = await SharedPreferences.getInstance();
      if (pref.containsKey('basicData')) {
        pref.remove('basicData');
      }
      for (String key in pref.getKeys()) {
        if (key != "userData") {
          pref.remove(key);
        }
        //   }
        // if (pref.containsKey('formid')) {
        //   pref.remove('formid');
        // }
        // if (pref.containsKey('activeStepIndex')) {
        //   pref.remove('activeStepIndex');
        // }
        // if (pref.containsKey('PropInfoData')) {
        //   pref.remove('PropInfoData');
        // }
        // if (pref.containsKey('data')) {
        //   pref.remove('data');
        // }
        // if (pref.containsKey('surveyMore')) {
        //   pref.remove('surveyMore');
        // }
      }
    }
  }

  // final CarouselSliderController _carouselController =
  //     CarouselSliderController();

  @override
  void initState() {
    super.initState();
    Provider.of<SurvProvider>(context, listen: false).getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<SurvProvider>(context, listen: false).getFormIdfrom();
    Size size = MediaQuery.of(context).size;
    // Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BgTwo(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GlobalAppBar().addPadding(horizontal: 8),
                  30.height,
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          // padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Where Deals Get Done',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 26,
                            ),
                          ),
                        ),
                      ),
                      20.height,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 74,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Consumer<SurvProvider>(
                                      builder: (context, provider, child) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Location',
                                              style: TextStyle(
                                                fontFamily: 'Outfit',
                                                fontSize: 14,
                                                color: Color(0xff919191),
                                              ),
                                            ),
                                            Text(
                                              provider.city ?? 'Unavailable',
                                              style: TextStyle(
                                                fontFamily: 'Outfit',
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                    SvgPicture.asset(
                                        'assets/icons/location_marker.svg')
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Color(0xff3B3C3E),
                                  border: Border.all(color: Color(0xff646566)),
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            10.height,
                            Container(
                              width: double.infinity,
                              height: 74,
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Color(0xff3B3C3E),
                                border: Border.all(color: Color(0xff646566)),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isSellSelected = true;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: isSellSelected
                                              ? Color(0xff1C1D20)
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Sell Property',
                                          style: TextStyle(
                                            fontFamily: 'Outfit',
                                            color: isSellSelected
                                                ? Color(0xffF6A825)
                                                : Colors.grey,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isSellSelected = false;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: !isSellSelected
                                              ? Color(0xff1C1D20)
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'My Properties',
                                          style: TextStyle(
                                            fontFamily: 'Outfit',
                                            color: !isSellSelected
                                                ? AppThemes.primaryColor
                                                : Colors.grey,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            10.height,
                            roundButton(
                              height: 62,
                              onClick: () {
                                showSellBottomSheet(context);
                              },
                              text: 'Sell Your Property',
                              buttonWidth: double.infinity,
                              horizontalPadding: 0,
                            ),
                            10.height,
                          ],
                        ),
                      ),
                      isSellSelected
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                children: [
                                  15.height,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Gallery',
                                        style: TextStyle(
                                            fontFamily: 'Outfit',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  isIos: true,
                                                  duration: Duration(
                                                      milliseconds: 700),
                                                  child:
                                                      GalleryPage(from: 'btn'),
                                                  type:
                                                      PageTransitionType.fade));
                                        },
                                        child: Text(
                                          'See all',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                fontFamily: 'Outfit',
                                                color: AppThemes.secondarycolor,
                                                fontSize: 20,
                                              ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  GridView.builder(
                                    padding: EdgeInsets.zero,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: img.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 8,
                                      crossAxisSpacing: 8,
                                    ),
                                    itemBuilder: (context, index) {
                                      return GridChild(
                                        url:
                                            "assets/house_images/${img[index]}",
                                      );
                                    },
                                  ),
                                ],
                              ),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'My Properties',
                                        style: TextStyle(
                                            fontFamily: 'Outfit',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  isIos: true,
                                                  duration: Duration(
                                                      milliseconds: 700),
                                                  child: SellHistoryPage(
                                                      from: 'btn'),
                                                  type:
                                                      PageTransitionType.fade));
                                        },
                                        child: Text(
                                          'See all',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                fontFamily: 'Outfit',
                                                color: AppThemes.secondarycolor,
                                                fontSize: 20,
                                              ),
                                        ),
                                      )
                                    ],
                                  ),
                                  18.height,
                                  FutureBuilder(
                                      future: backend().fetchProperty(
                                          Provider.of<UserData>(context,
                                                  listen: false)
                                              .id!),
                                      builder:
                                          (context, AsyncSnapshot snapshot) {
                                        switch (snapshot.connectionState) {
                                          case ConnectionState.waiting:
                                            return Center(
                                                child:
                                                    CircularProgressIndicator());
                                          default:
                                            if (snapshot.hasError) {
                                              return Text('Error');
                                            } else if (snapshot.data != null) {
                                              if (!isGrid) {
                                                return getListView(
                                                    snapshot.data,
                                                    snapshot.data.length,
                                                    context, (index) {
                                                  DeleteProperty(
                                                      context, snapshot, index);
                                                });
                                              } else
                                                return GridView.builder(
                                                  itemCount:
                                                      snapshot.data.length,
                                                  shrinkWrap: true,
                                                  padding: EdgeInsets.zero,
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                                                          crossAxisCount: 2,
                                                          crossAxisSpacing: 5.0,
                                                          mainAxisSpacing: 5.0,
                                                          height: 210),
                                                  itemBuilder:
                                                      (context, index) {
                                                    debugPrint(snapshot
                                                        .data[index]
                                                        .toString());
                                                    return GestureDetector(
                                                      onTap: () {
                                                        // debugPrint(snapshot.data[index]['id']);
                                                        Navigator.push(context,
                                                            MaterialPageRoute(
                                                          builder: (context) {
                                                            return PropertyFullDetail(
                                                                from: 'name',
                                                                formId: snapshot
                                                                        .data[
                                                                    index]['id']);
                                                          },
                                                        ));
                                                      },
                                                      child: Card(
                                                        child: Container(
                                                            child: Column(
                                                              children: [
                                                                SizedBox(
                                                                  height: 120,
                                                                  width: size
                                                                      .width,
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              8),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              8),
                                                                    ),
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              size.width,
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            imageUrl:
                                                                                snapshot.data[index]['image'],
                                                                            height:
                                                                                MediaQuery.of(context).size.height,
                                                                            fit:
                                                                                BoxFit.fill,
                                                                            placeholder: (context, url) =>
                                                                                Center(child: CircularProgressIndicator()),
                                                                            errorWidget: (context, url, error) =>
                                                                                Icon(Icons.error),
                                                                          ),
                                                                        ),
                                                                        Positioned(
                                                                            top:
                                                                                5,
                                                                            right:
                                                                                5,
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () {
                                                                                Navigator.push(
                                                                                    context,
                                                                                    PageTransition(
                                                                                      isIos: true,
                                                                                      duration: Duration(milliseconds: 700),
                                                                                      child: FullDetail(
                                                                                        formId: snapshot.data[index]['id'],
                                                                                        from: 'name',
                                                                                      ),
                                                                                      type: PageTransitionType.fade,
                                                                                    ));
                                                                              },
                                                                              child: SvgPicture.asset(
                                                                                'assets/icons/edit_pencil.svg',
                                                                              ),
                                                                            )),
                                                                        Align(
                                                                          alignment:
                                                                              Alignment.topLeft,
                                                                          child: snapshot.data[index]['detailType'] == 'Complete'
                                                                              ? SizedBox.shrink()
                                                                              : Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: Colors.red,
                                                                                    borderRadius: BorderRadius.only(
                                                                                      topLeft: Radius.circular(8),
                                                                                      bottomRight: Radius.circular(8),
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                                                                                    child: Text(
                                                                                      snapshot.data[index]['detailType'],
                                                                                      style: TextStyle(
                                                                                        fontFamily: 'Outfit',
                                                                                        color: snapshot.data[index]['detailType'] == 'Complete' ? Colors.green : Colors.white,
                                                                                        fontSize: 12,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 2,
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .only(
                                                                      left: 8.0,
                                                                      right:
                                                                          8.0,
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      // color: Colors.green,
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          SizedBox(
                                                                            height:
                                                                                5,
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                Alignment.centerLeft,
                                                                            child:
                                                                                Text(
                                                                              snapshot.data[index]['title'],
                                                                              maxLines: 2,
                                                                              overflow: TextOverflow.ellipsis,
                                                                              style: TextStyle(
                                                                                fontFamily: 'Outfit',
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.w500,
                                                                                color: Colors.white,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              Icon(
                                                                                Icons.location_on,
                                                                                color: AppThemes.primaryColor,
                                                                                size: 15,
                                                                              ),
                                                                              Expanded(
                                                                                child: Text(
                                                                                  snapshot.data[index]['location'],
                                                                                  maxLines: 1,
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                  style: TextStyle(
                                                                                    fontFamily: 'Outfit',
                                                                                    fontSize: 12,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    color: AppThemes.primaryColor,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    // color: Colors.brown,
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(
                                                                            left:
                                                                                8.0,
                                                                            bottom:
                                                                                5.0,
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            snapshot.data[index]['date'],
                                                                            maxLines:
                                                                                1,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            style:
                                                                                TextStyle(
                                                                              fontFamily: 'Outfit',
                                                                              fontSize: 11,
                                                                              color: Colors.white,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                            ),
                                                            width: size.width *
                                                                0.25,
                                                            decoration:
                                                                BoxDecoration(
                                                                    boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.2),
                                                                    spreadRadius:
                                                                        1,
                                                                    blurRadius:
                                                                        2,
                                                                    offset: Offset(
                                                                        2,
                                                                        2), // changes position of shadow
                                                                  ),
                                                                ],
                                                                    color: AppThemes
                                                                        .cardColornew,
                                                                    // Color.fromARGB(255, 69, 64, 64),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12))),
                                                        // color: Color.fromARGB(255, 69, 64, 64),
                                                        elevation: 2,
                                                        color: Color.fromARGB(
                                                            255, 69, 64, 64),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                    ).addPadding(bottom: 10);
                                                  },
                                                );
                                            } else {
                                              return Column(
                                                children: [
                                                  Center(
                                                    child: Image.asset(
                                                      'assets/noreccustom.gif',
                                                      width: 275,
                                                      height: 275,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  Text(
                                                    'NO UPLOADED PROPERTY',
                                                    style: TextStyle(
                                                      fontFamily: 'Outfit',
                                                      color: mainColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  Text(
                                                    'You have not posted any house for sell.',
                                                    style: TextStyle(
                                                      fontFamily: 'Outfit',
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                ],
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                              );
                                            }
                                        }
                                      }),
                                ],
                              ),
                            ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void DeleteProperty(
      BuildContext context, AsyncSnapshot<dynamic> snapshot, int index) {
    AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        headerAnimationLoop: false,
        animType: AnimType.topSlide,
        title: 'Delete Property',
        desc: 'do you want to delete this property?',
        btnCancelOnPress: () {},
        onDismissCallback: (type) {
          debugPrint('Dialog Dismiss from callback $type');
        },
        btnOkText: 'Yes',
        btnOkOnPress: () async {
          FLoading.show(
            context,
            loading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
          deleteSurveyOldData(snapshot.data[index]['id']);
          var res = await backend().deleteProperty({
            'formid': snapshot.data[index]['id'],
          });

          if (res['status'] == 'success') {
            FLoading.hide();

            setState(() {});
          }
        }).show();
  }
}
