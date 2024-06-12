import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Admin/widgets/app_bar_global.dart';
import 'package:lunarestate/Config/bc_ext.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import 'package:lunarestate/Service/backend.dart';
import 'package:lunarestate/Widgets/customAppBar.dart';
import 'package:lunarestate/Widgets/header_text.dart';

class SellerRequestPage extends StatefulWidget {
  const SellerRequestPage({super.key});

  @override
  State<SellerRequestPage> createState() => _SellerRequestPageState();
}

class _SellerRequestPageState extends State<SellerRequestPage> {
  final controller = ScrollController();
  List? itemlist = [];
  int Limit = 20;
  @override
  void initState() {
    super.initState();
    fetch();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetch();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  StreamController _streamController = StreamController();
  bool hasMore = true;
  int page = 0;
  fetch() async {
    log('getData');
    var newitems = await backend()
        .fetchMoreAdminProperty({'type': 'unsold', 'limit': page.toString()});
    setState(() {
      if (newitems != null) {
        page += 10;
        if (newitems.length <= 10) {
          hasMore = false;
        }
        itemlist!.addAll(newitems.map((item) {
          return item;
        }));
        _streamController.add(['hasData']);
      } else {
        _streamController.add(null);
        hasMore = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgTwo(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                child: CustomAppBarWithCircleback().addPadding(left: 12),
              ),
              SafeArea(
                child: GlobalAppBarAdmin(),
              ),
              30.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getHeader('Seller Request'),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // togglegrid();
                        },
                        child: SvgPicture.asset(
                          'assets/icons/grid_icon.svg',
                          color: Color(0xFFD3A45C),
                        ),
                      ),
                      12.width,
                      GestureDetector(
                        onTap: () {
                          // togglegrid();
                        },
                        child: SvgPicture.asset(
                          'assets/icons/list_icon.svg',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ).addPadding(horizontal: 19),
                ],
              ),
              getListView(context, {}, 6),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getListView(BuildContext context, Map property, int dataLength) {
  return SizedBox(
    height: context.screenHeight,
    width: double.infinity,
    child: ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: dataLength,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: Container(
            height: context.screenHeight * 0.14,
            width: double.infinity,
            decoration: AppThemes.commonBoxDecoration,
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Image.network(
                        'https://picsum.photos/200/300',
                        height: context.screenHeight * 0.14,
                        fit: BoxFit.fill,
                        width: context.screenWidth,
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
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
                  ).addPadding(overall: 6),
                ),
              ],
            ),
          ),
        ).addPadding(horizontal: 20, vertical: 14);
      },
    ),
  );
}
