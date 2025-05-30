// import 'package:carousel_slider/carousel_options.dart';
import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Admin/new/purchase_property/purchase_proerty_view.dart';
import 'package:lunarestate/Admin/new/seller_request/seller_request_page.dart';
import 'package:lunarestate/Admin/new/seller_request/widgets/grid_view.dart';
import 'package:lunarestate/Admin/new/users/users_view.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';

import 'package:lunarestate/Pages/HomePage/controller/admin_home_controller.dart';
import 'package:lunarestate/Service/UserData.dart';
import 'package:lunarestate/Service/backend.dart';
// import 'package:lunarestate/Widgets/customAppBar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../Widgets/global_appbar.dart';

class HomePageAdmin extends StatefulWidget {
  HomePageAdmin({super.key});

  @override
  State<HomePageAdmin> createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  // List img = [
  //   'https://lunaenterprises.info/wp-content/uploads/2022/09/688e32cd90dbb711edc5812f7d05975d.jpg',
  //   'https://lunaenterprises.info/wp-content/uploads/2022/09/Cat-Mountain-Residence_2.jpg',
  //   'https://lunaenterprises.info/wp-content/uploads/2022/09/Far-Pond-House_1.jpg',
  //   'https://lunaenterprises.info/wp-content/uploads/2022/09/688e32cd90dbb711edc5812f7d05975d.jpg',
  // ];
  List img = [
    "20230313_153002.jpg",
    "20230412_115009.jpg",
    "20230718_151310.jpg",
    "20240907_125548.jpg",
    "Resized_20210320_132531_629897463582730.jpeg",
    "20230616_172333.jpg",
    "Back Left.JPG",
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

  // final CarouselSliderController _carouselController =
  //     CarouselSliderController();
  final controller = ScrollController();

  List? solditemlist = [];
  List? unsolditemlist = [];
  int limit = 6;
  List? usersList = [];
  int userLimit = 6;
  bool isLoadingUsers = true;
  String? errorMessage;
  @override
  void initState() {
    super.initState();
    fetch();
    fetchSold();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        if (hasMore) {
          fetch();
        }
      }
    });

    fetchUser();
  }

  @override
  void dispose() {
    controller.dispose();
    _streamController.close();
    _usersStreamController.close();
    super.dispose();
  }

  StreamController _streamController = StreamController.broadcast();
  StreamController _usersStreamController = StreamController();
  bool hasMore = true;
  bool hasMoreUser = true;
  int usersPage = 0;
  int page = 0;
  List? reqItemlist = [];
  int sellReqLimit = 20;

  Future<void> fetchUser() async {
    log('Fetching users... Page: $usersPage, Limit: $userLimit');
    try {
      var newItems = await Backend().fetchAdminUsers({
        'limit': userLimit.toString(),
        'page': usersPage.toString(), // Adjust if backend uses offset instead
      });
      log('Fetched users: ${newItems?.length ?? 0} items');
      setState(() {
        if (newItems != null && newItems.isNotEmpty) {
          usersPage += userLimit;
          usersList?.addAll(newItems);
          if (newItems.length < userLimit) {
            hasMoreUser = false;
          }
        } else {
          hasMoreUser = false;
        }
        isLoadingUsers = false; // Mark loading as complete
      });
    } catch (e) {
      log('Error fetching users: $e');
      setState(() {
        isLoadingUsers = false;
        errorMessage = 'Failed to load users: $e';
      });
    }
  }

  Future<void> fetchSold() async {
    log('getData');
    var newitems = await Backend().fetchMoreAdminProperty({
      'type': 'sold',
      'limit': page.toString(),
    });
    setState(() {
      if (newitems != null) {
        page += 10;
        if (newitems.length <= 10) {
          hasMore = false;
        }
        solditemlist!.addAll(
          newitems.map((item) {
            return item;
          }),
        );
        _streamController.add(['hasData']);
      } else {
        _streamController.add(null);
        hasMore = false;
      }
    });
  }

  Future<void> fetch() async {
    log('getData');
    var newitems = await Backend().fetchMoreAdminProperty({
      'type': 'unsold',
      'limit': page.toString(),
    });
    setState(() {
      if (newitems != null) {
        page += 10;
        if (newitems.length <= 10) {
          hasMore = false;
        }
        unsolditemlist!.addAll(
          newitems.map((item) {
            return item;
          }),
        );
        _streamController.add(['hasData']);
      } else {
        _streamController.add(null);
        hasMore = false;
      }
    });
  }

  onRefresh() {
    setState(() {
      page = 0;
      unsolditemlist = [];
      fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgTwo(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(child: GlobalAppBar().addPadding(horizontal: 12)),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome ${Provider.of<UserData>(context, listen: false).name.toString()} 👋',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFD3A45C),
                    fontFamily: 'Outfit',
                  ),
                ),
              ).addPadding(horizontal: 14),
              20.height,
              Consumer<AdminHomeController>(
                builder: (context, tabSelection, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 74,
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Color(0xff3B3C3E),
                            border: Border.all(color: Color(0xff646566)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    tabSelection.selectTab(
                                      0,
                                    ); // Select "Sell House"
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: tabSelection.selectedTabIndex == 0
                                          ? Color(0xff1C1D20)
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Seller Request',
                                      style: TextStyle(
                                        fontFamily: 'Outfit',
                                        color:
                                            tabSelection.selectedTabIndex == 0
                                                ? Color(0xffF6A825)
                                                : Colors.grey,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                10.width,
                                GestureDetector(
                                  onTap: () {
                                    tabSelection.selectTab(
                                      1,
                                    ); // Select "My Home"
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: tabSelection.selectedTabIndex == 1
                                          ? Color(0xff1C1D20)
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Purchase Property',
                                      style: TextStyle(
                                        fontFamily: 'Outfit',
                                        color:
                                            tabSelection.selectedTabIndex == 1
                                                ? AppThemes.primaryColor
                                                : Colors.grey,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                10.width,
                                GestureDetector(
                                  onTap: () {
                                    tabSelection.selectTab(2); // Select "User"
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: tabSelection.selectedTabIndex == 2
                                          ? Color(0xff1C1D20)
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Users',
                                      style: TextStyle(
                                        fontFamily: 'Outfit',
                                        color:
                                            tabSelection.selectedTabIndex == 2
                                                ? Color(0xffF6A825)
                                                : Colors.grey,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // You can add additional content here based on the selected tab index
                        if (tabSelection.selectedTabIndex == 0)
                          Column(
                            children: [
                              Column(
                                children: [
                                  10.height,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Seller request',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            PageTransition(
                                              isIos: true,
                                              duration: Duration(
                                                milliseconds: 700,
                                              ),
                                              child: SellerRequestPage(),
                                              type: PageTransitionType.fade,
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'See all',
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium!.copyWith(
                                                fontFamily: 'Outfit',
                                                color: AppThemes.secondarycolor,
                                                fontSize: 20,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  10.height,
                                  unsolditemlist!.isNotEmpty
                                      ? getGridViewAdmin(
                                          context,
                                          unsolditemlist ?? [],
                                          onRefresh,
                                          true,
                                          false,
                                        )
                                      : Text('Loading..'),
                                ],
                              ),
                            ],
                          ),
                        if (tabSelection.selectedTabIndex == 1)
                          Column(
                            children: [
                              10.height,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Purchase Property',
                                    style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                          isIos: true,
                                          duration: Duration(milliseconds: 700),
                                          child: PurchaseProertyView(),
                                          type: PageTransitionType.fade,
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'See all',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium!.copyWith(
                                            fontFamily: 'Outfit',
                                            color: AppThemes.secondarycolor,
                                            fontSize: 20,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              10.height,
                              solditemlist!.isNotEmpty
                                  ? getGridViewAdmin(
                                      context,
                                      solditemlist ?? [],
                                      () {},
                                      true,
                                      false,
                                    )
                                  : Text('Loading..'),
                            ],
                          ),
                        if (tabSelection.selectedTabIndex == 2)
                          Column(
                            children: [
                              10.height,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Users',
                                    style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                          isIos: true,
                                          duration: Duration(milliseconds: 700),
                                          child: UsersView(),
                                          type: PageTransitionType.fade,
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'See all',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium!.copyWith(
                                            fontFamily: 'Outfit',
                                            color: AppThemes.secondarycolor,
                                            fontSize: 20,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              10.height,
                              isLoadingUsers
                                  ? Center(child: CircularProgressIndicator())
                                  : errorMessage != null
                                      ? Text(
                                          errorMessage!,
                                          style: TextStyle(color: Colors.red),
                                        )
                                      : usersList!.isNotEmpty
                                          ? ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount:
                                                  usersList?.length.clamp(0, 4),
                                              itemBuilder: (context, index) {
                                                return UserTile(
                                                  profile: usersList?[index]
                                                      ['profile'],
                                                  name: usersList?[index]
                                                      ['name'],
                                                  id: usersList?[index]['id'],
                                                  phone: usersList?[index]
                                                      ['phone'],
                                                  email: usersList?[index]
                                                      ['email'],
                                                  acStatus: usersList?[index]
                                                              ['status']
                                                          .toString() ??
                                                      '',
                                                ).addPadding(vertical: 10);
                                              },
                                            )
                                          : Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
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
                                                  'NO USER FOUND',
                                                  style: TextStyle(
                                                    fontFamily: 'Outfit',
                                                    color:
                                                        AppThemes.primaryColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                Text(
                                                  'No registered user found in Luna App.',
                                                  style: TextStyle(
                                                    fontFamily: 'Outfit',
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                            ],
                          ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
