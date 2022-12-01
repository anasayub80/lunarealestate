import 'package:flutter/material.dart';
import 'package:lunarestate/Config/config.dart';
import 'package:lunarestate/Pages/HomePage/BenefitsCard.dart';
import 'package:lunarestate/Pages/Survery/SurveryPage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:video_player/video_player.dart';
import '../../Service/UserData.dart';
import '../ProfilePage/ProfilePage.dart';
import '../SellHistory/SellHistory.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  centerTitle: true,
                  leading: SizedBox.shrink(),
                  title: Text(
                    'Luna Enterprises',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Satisfy',
                    ),
                  ),
                  pinned: true,
                  floating: true,
                  actions: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ProfilePage();
                          },
                        ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SizedBox(
                          child: Hero(
                            tag: 'profileImage',
                            child: CircleAvatar(
                              // borderRadius: BorderRadius.circular(30),
                              radius: 25,
                              backgroundImage: NetworkImage(
                                Provider.of<UserData>(context, listen: true)
                                    .profile
                                    .toString(),
                              ),
                              onBackgroundImageError: (exception, stackTrace) {
                                Icon(
                                  Icons.broken_image,
                                  color: Colors.red,
                                  size: 30,
                                );
                              },
                            ),
                          ),
                          width: 45,
                        ),
                      ),
                    ),
                  ],
                )
              ];
            },
            body: Column(
              children: [
                // Container(
                //   margin: EdgeInsets.only(top: 20),
                //   height: 35,
                //   width: 100.w,
                //   decoration: BoxDecoration(),
                //   child: Row(
                //     children: [
                //       SizedBox(),
                //       Center(
                //         child: Padding(
                //           padding: const EdgeInsets.only(left: 45.0),
                //           child: Text(
                //             'Luna Enterprises',
                //             style: TextStyle(
                //               color: Colors.amber,
                //               fontSize: 24.0,
                //               fontWeight: FontWeight.w400,
                //               fontFamily: 'Satisfy',
                //             ),
                //           ),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {
                //           Navigator.push(
                //               context,
                //               PageTransition(
                //                   child: ProfilePage(),
                //                   type: PageTransitionType.bottomToTop));
                //         },
                //         child: Padding(
                //           padding: const EdgeInsets.only(right: 14.0),
                //           child: SizedBox(
                //             child: ClipRRect(
                //               borderRadius: BorderRadius.circular(30),
                //               child: Image.network(
                //                 Provider.of<UserData>(context, listen: true)
                //                     .profile
                //                     .toString(),
                //                 fit: BoxFit.fill,
                //                 errorBuilder: (context, error, stackTrace) {
                //                   return Icon(
                //                     Icons.broken_image,
                //                     color: Colors.red,
                //                     size: 30,
                //                   );
                //                 },
                //               ),
                //             ),
                //             height: 35,
                //             width: 35,
                //           ),
                //         ),
                //       ),
                //     ],
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //   ),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      physics: ClampingScrollPhysics(),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                              topRight: Radius.circular(35),
                            ),
                            child: AspectRatio(
                              aspectRatio: controller.value.aspectRatio,
                              child: Container(
                                child: VideoPlayer(controller),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Your Home Our Passion',
                            style: TextStyle(
                              color: mainColor,
                              fontFamily: 'Satisfy',
                              fontSize: 24.0,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 75.0),
                            child: Divider(
                              thickness: 0.8,
                              color: mainColor,
                            ),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: (() {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          isIos: true,
                                          duration: Duration(milliseconds: 700),
                                          child: SuerveyPage(),
                                          type: PageTransitionType.fade));
                                }),
                                child: Card(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/icons/sale.png',
                                          height: 75,
                                          width: 85,
                                        ),
                                        Text(
                                          'Sell House',
                                          style: TextStyle(
                                            color: Colors.amber,
                                          ),
                                        )
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                    ),
                                    height: 140,
                                    width: size.width * 0.45,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 2,
                                            offset: Offset(2,
                                                2), // changes position of shadow
                                          ),
                                        ],
                                        color: Color.fromARGB(255, 69, 64, 64),
                                        // border: Border.all(color: Colors.amber),
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                  ),
                                  color: Color.fromARGB(255, 69, 64, 64),
                                  elevation: 6,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (() {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          isIos: true,
                                          duration: Duration(milliseconds: 700),
                                          child: SellHistoryPage(from: 'btn'),
                                          type: PageTransitionType.fade));
                                }),
                                child: Card(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/icons/house.png',
                                          height: 75,
                                          width: 85,
                                        ),
                                        Text(
                                          'My House',
                                          style: TextStyle(
                                            color: Colors.amber,
                                          ),
                                        )
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                    ),
                                    height: 140,
                                    width: size.width * 0.45,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.5),

                                            spreadRadius: 2,
                                            blurRadius: 2,
                                            offset: Offset(2,
                                                2), // changes position of shadow
                                          ),
                                        ],
                                        color: Color.fromARGB(255, 69, 64, 64),
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                  ),
                                  color: Color.fromARGB(255, 69, 64, 64),
                                  elevation: 6,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'The Benefits Of Selling To Luna Enterprises',
                            style: TextStyle(
                                fontSize: 18.0,
                                color: mainColor,
                                fontFamily: 'Satisfy'),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 55.0),
                            child: Divider(
                              thickness: 0.8,
                              color: mainColor,
                            ),
                          ),
                          BenefitCard(size: size),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                    height: size.height,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xff141414),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        )),
                  ),
                ),
              ],
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ),
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                opacity: 0.2,
                image: AssetImage(
                  'assets/images/tower.jpg',
                ),
                fit: BoxFit.cover,
              )),
        ),
      ),
    );
  }
}
