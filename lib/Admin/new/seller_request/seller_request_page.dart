import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Admin/new/seller_request/widgets/grid_view.dart';
import 'package:lunarestate/Admin/new/seller_request/widgets/list_view.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import 'package:lunarestate/Service/backend.dart';
import 'package:lunarestate/Widgets/customAppBar.dart';
import 'package:lunarestate/Widgets/header_text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Widgets/global_appbar.dart';

Future<void> makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}

class SellerRequestPage extends StatefulWidget {
  const SellerRequestPage({super.key});

  @override
  State<SellerRequestPage> createState() => _SellerRequestPageState();
}

class _SellerRequestPageState extends State<SellerRequestPage> {
  final controller = ScrollController();
  bool isGrid = true;
  togglegrid() {
    isGrid = !isGrid;
    setState(() {});
  }

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

  onrefresh() {
    setState(() {
      page = 0;
      itemlist = [];
      fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgTwo(
        child: RefreshIndicator(
          onRefresh: () async {
            onrefresh();
          },
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomAppBarWithCircleback().addPadding(left: 12),
                20.height,
                GlobalAppBar().addPadding(horizontal: 12),
                30.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getHeader('Seller Request'),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            togglegrid();
                          },
                          child: SvgPicture.asset(
                            'assets/icons/grid_icon.svg',
                            colorFilter: ColorFilter.mode(
                                !isGrid ? Colors.white : Color(0xFFD3A45C),
                                BlendMode.srcIn),
                          ),
                        ),
                        12.width,
                        GestureDetector(
                          onTap: () {
                            togglegrid();
                          },
                          child: SvgPicture.asset(
                            'assets/icons/list_icon.svg',
                            colorFilter: ColorFilter.mode(
                                !isGrid ? Colors.white : Color(0xFFD3A45C),
                                BlendMode.srcIn),
                          ),
                        ),
                      ],
                    ).addPadding(horizontal: 21, vertical: 12),
                  ],
                ),
                StreamBuilder(
                  stream: _streamController.stream,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());

                      default:
                        if (snapshot.hasError) {
                          return Text('Error');
                        } else if (snapshot.data != null) {
                          return isGrid
                              ? getGridViewAdmin(context, itemlist!, onrefresh)
                              : getListViewAdmin(context, itemlist!, onrefresh);
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
                                'NO SELLER REQUEST',
                                style: TextStyle(
                                  color: AppThemes.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'There is no seller request come yet.',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                          );
                        }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
