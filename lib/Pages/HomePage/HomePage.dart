import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Config/bc_ext.dart';
import 'package:lunarestate/Config/config.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';

import 'package:lunarestate/Widgets/global_appbar.dart';
import 'package:video_player/video_player.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late VideoPlayerController controller;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    loadVideoPlayer();
  }

  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }

  final _pageViewController = PageController(viewportFraction: 0.8);
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

  List img = [
    'https://picsum.photos/200/300',
    'https://picsum.photos/200/300',
    'https://picsum.photos/200/300',
  ];
  int currentPage = 0;
  void updateCurrentPageTop(int page) {
    setState(() {
      currentPage = page;
    });
  }

  final CarouselController _carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BgTwo(
          child: SingleChildScrollView(
            child: Column(
              children: [
                30.height,
                GlobalAppBar(),
                30.height,
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        child: Column(
                          children: [
                            Text(
                              'View Gallery',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFFD3A45C),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).addPadding(horizontal: 14),
                    SizedBox(
                      height: 120,
                      width: double.infinity,
                      child: CarouselSlider(
                        items: img
                            .map(
                              (item) => SizedBox(
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(16.0),
                                  ),
                                  child: Image.network(
                                    item,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ).addPadding(overall: 8),
                            )
                            .toList(),
                        carouselController: _carouselController,
                        options: CarouselOptions(
                          autoPlay: img.length == 1 ? false : true,
                          // enlargeCenterPage: true,
                          aspectRatio: 16 /
                              9, // Adjust the aspect ratio for desired effect
                          viewportFraction:
                              0.5, // Make sure images fill the space properly
                          scrollPhysics: img.length == 1
                              ? const NeverScrollableScrollPhysics()
                              : const ScrollPhysics(),
                          onPageChanged: (index, reason) {
                            updateCurrentPageTop(index);
                          },
                        ),
                      ),
                    ).addPadding(horizontal: 14),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Your Home Our Passion',
                        style: TextStyle(
                          color: AppThemes.whiteColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 19.0,
                        ),
                      ),
                    ).addPadding(
                      horizontal: 19,
                      vertical: 4,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 50,
                        child: Divider(
                          thickness: 1.8,
                          color: AppThemes.secondarycolor,
                        ),
                      ),
                    ).addPadding(
                      horizontal: 19,
                      vertical: 0,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      width: context.screenWidth * 0.9,
                      height: 62,
                      decoration: BoxDecoration(
                        color: Color(0xFF22252A),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          width: 3,
                          color: Color(0xFF494748),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset("assets/images/my_home.svg"),
                              15.width,
                              Text(
                                "Sell House",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  letterSpacing: 1.1,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward,
                            color: mainColor,
                          ),
                        ],
                      ).addPadding(overall: 12),
                      // child: mainColor,
                    ).center(),
                    15.height,
                    Container(
                      width: context.screenWidth * 0.9,
                      height: 62,
                      decoration: BoxDecoration(
                        color: Color(0xFF22252A),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          width: 3,
                          color: Color(0xFF494748),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset("assets/images/home_my.svg"),
                              15.width,
                              Text(
                                "Sell House",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  letterSpacing: 1.1,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward,
                            color: mainColor,
                          ),
                        ],
                      ).addPadding(overall: 12),
                      // child: mainColor,
                    ).center(),
                    20.height,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'The Benefits of Selling To Lana Enterprises',
                        style: TextStyle(
                          color: AppThemes.whiteColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 19.0,
                        ),
                      ),
                    ).addPadding(
                      horizontal: 19,
                      vertical: 4,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 50,
                        child: Divider(
                          thickness: 1.8,
                          color: AppThemes.secondarycolor,
                        ),
                      ),
                    ).addPadding(
                      horizontal: 19,
                      vertical: 0,
                    ),
                    20.height,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Commissions / Fees:",
                        style: TextStyle(
                          color: AppThemes.secondarycolor,
                          fontSize: 21,
                        ),
                      ).addPadding(
                        horizontal: 19,
                      ),
                    ),
                    Container(
                      width: context.screenWidth * 0.9,
                      height: 65,
                      decoration: BoxDecoration(
                        color: Color(0xFF22252A),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 1,
                          color: Color(0xFF494748),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '6% on average is paid by you, the seller-No Commissions by  Luna Enterprises.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ).addPadding(overall: 8),
                      ),
                    ).center().addPadding(overall: 12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Who Pays Closing Costs?",
                        style: TextStyle(
                          color: AppThemes.secondarycolor,
                          fontSize: 21,
                        ),
                      ).addPadding(
                        horizontal: 19,
                      ),
                    ),
                    Container(
                      width: context.screenWidth * 0.9,
                      decoration: BoxDecoration(
                        color: Color(0xFF22252A),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 1,
                          color: Color(0xFF494748),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '2% on average is paid by you, the seller. We split close closing cost.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ).addPadding(overall: 8),
                      ),
                    ).center().addPadding(overall: 12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Other Benefits.",
                        style: TextStyle(
                          color: AppThemes.secondarycolor,
                          fontSize: 21,
                        ),
                      ).addPadding(
                        horizontal: 19,
                      ),
                    ),
                    Container(
                      // width: context.screenWidth * 0.9,
                      // height: 65,
                      decoration: BoxDecoration(
                        color: Color(0xFF22252A),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 1,
                          color: Color(0xFF494748),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                CircleAvatar(
                                  radius: 2,
                                  backgroundColor: AppThemes.secondarycolor,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Text(
                                    'No showing.',
                                    softWrap: true,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ).addPadding(overall: 8),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                CircleAvatar(
                                  radius: 2,
                                  backgroundColor: AppThemes.secondarycolor,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Text(
                                    'No out of pocket repair cost.',
                                    softWrap: true,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ).addPadding(overall: 8),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                CircleAvatar(
                                  radius: 2,
                                  backgroundColor: AppThemes.secondarycolor,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Text(
                                    'NO dealing with multiple inspectors hassling or nitpick your home.',
                                    softWrap: true,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ).addPadding(overall: 8),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                CircleAvatar(
                                  radius: 2,
                                  backgroundColor: AppThemes.secondarycolor,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Text(
                                    'Fast quick and cash',
                                    softWrap: true,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ).addPadding(overall: 8),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ).center().addPadding(
                          overall: 12,
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
    );
  }
}
