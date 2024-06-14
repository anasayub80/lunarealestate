// import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lunarestate/Admin/new/purchase_property/purchase_proerty_view.dart';
import 'package:lunarestate/Admin/new/seller_request/seller_request_page.dart';
import 'package:lunarestate/Admin/new/users/users_view.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import 'package:lunarestate/Pages/HomePage/Widgets/home_button.dart';
// import 'package:lunarestate/Widgets/customAppBar.dart';
import 'package:lunarestate/Widgets/header_text.dart';
import 'package:page_transition/page_transition.dart';

import '../../Widgets/global_appbar.dart';

class HomePageAdmin extends StatefulWidget {
  HomePageAdmin({super.key});

  @override
  State<HomePageAdmin> createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  List img = [
    'https://picsum.photos/200/300',
    'https://picsum.photos/200/300',
    'https://picsum.photos/200/300',
  ];

  bool isGrid = true;
  togglegrid() {
    isGrid = !isGrid;
    setState(() {});
  }

  int currentPage = 0;

  void updateCurrentPageTop(int page) {
    setState(() {
      currentPage = page;
    });
  }

  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgTwo(
          child: Column(
        children: [
          // SafeArea(
          //   child: CustomAppBarWithCircleback(),
          // ).addPadding(horizontal: 21),
          10.height,
          SafeArea(child: GlobalAppBar().addPadding(horizontal: 12)),

          18.height,
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
                aspectRatio:
                    16 / 9, // Adjust the aspect ratio for desired effect
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
          getHeader('Luna Enterprises Admin').addPadding(horizontal: 4),
          20.height,
          HomeButtons(
            onTapBtn: () {
              Navigator.push(
                  context,
                  PageTransition(
                    isIos: true,
                    duration: Duration(milliseconds: 700),
                    child: SellerRequestPage(),
                    type: PageTransitionType.fade,
                  ));
            },
            svg: "assets/images/my_home.svg",
            title: "Seller Request",
          ).addPadding(overall: 4),
          10.height,
          HomeButtons(
            onTapBtn: () {
              Navigator.push(
                  context,
                  PageTransition(
                    isIos: true,
                    duration: Duration(milliseconds: 700),
                    child: PurchaseProertyView(),
                    type: PageTransitionType.fade,
                  ));
            },
            svg: "assets/icons/purchase_property.svg",
            title: "Purchase Property",
          ).addPadding(overall: 4),
          10.height,
          HomeButtons(
            onTapBtn: () {
              Navigator.push(
                  context,
                  PageTransition(
                    isIos: true,
                    duration: Duration(milliseconds: 700),
                    child: UsersView(),
                    type: PageTransitionType.fade,
                  ));
            },
            svg: "assets/icons/see_users_icon.svg",
            title: "Users",
          ).addPadding(overall: 4),
          10.height,
        ],
      )),
    );
  }
}
