import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lunarestate/Config/bc_ext.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import 'package:lunarestate/Pages/Gallery/GalleryPage.dart';
import 'package:lunarestate/Pages/Survery/pages/children_widgets/basic_info.dart';
import 'package:lunarestate/Pages/Survery/pages/sell_house.dart';
import 'package:lunarestate/Widgets/global_appbar.dart';
import 'package:lunarestate/Widgets/header_text.dart';
import 'package:page_transition/page_transition.dart';
import 'package:video_player/video_player.dart';
import '../SellHistory/SellHistory.dart';
import 'Widgets/benefits_wid.dart';
import 'Widgets/home_button.dart';

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
    // Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BgTwo(
          child: SingleChildScrollView(
            child: Column(
              children: [
                30.height,
                GlobalAppBar().addPadding(horizontal: 8),
                30.height,
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          context.pushScreenTo(GalleryPage(from: ''));
                        },
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
                      ),
                    ).addPadding(horizontal: 14),
                    10.height,
                    SizedBox(
                      height: 174,
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
                              0.8, // Make sure images fill the space properly
                          scrollPhysics: img.length == 1
                              ? const NeverScrollableScrollPhysics()
                              : const ScrollPhysics(),
                          onPageChanged: (index, reason) {
                            updateCurrentPageTop(index);
                          },
                        ),
                      ),
                    ).addPadding(horizontal: 14),
                    10.height,
                    getHeader('Your Home Our Passion'),
                    SizedBox(
                      height: 18,
                    ),
                    HomeButtons(
                      onTapBtn: () {
                        Navigator.push(
                            context,
                            PageTransition(
                              isIos: true,
                              duration: Duration(milliseconds: 700),
                              child: SellHousePage(
                                child: BasicInfo(),
                              ),
                              type: PageTransitionType.fade,
                            ));
                      },
                      svg: "assets/images/my_home.svg",
                      title: "Sell House",
                    ),
                    15.height,
                    HomeButtons(
                      onTapBtn: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                isIos: true,
                                duration: Duration(milliseconds: 700),
                                child: SellHistoryPage(from: 'btn'),
                                type: PageTransitionType.fade));
                      },
                      svg: "assets/images/home_my.svg",
                      title: "My Home",
                    ),
                    35.height,
                    BenefitsWidget(),
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
