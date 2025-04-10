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

  List? reqItemlist = [];
  int sellReqLimit = 20;
  @override
  void initState() {
    super.initState();
    sellerReqFetch();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        sellerReqFetch();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  StreamController _sellereReqstreamController = StreamController();
  bool hasMoreSellReq = true;
  int sellReqPage = 0;
  sellerReqFetch() async {
    log('getData');
    var newitems = await backend().fetchMoreAdminProperty(
        {'type': 'unsold', 'limit': sellReqPage.toString()});
    setState(() {
      if (newitems != null) {
        sellReqPage += 10;
        if (newitems.length <= 10) {
          hasMoreSellReq = false;
        }
        reqItemlist!.addAll(newitems.map((item) {
          return item;
        }));
        _sellereReqstreamController.add(['hasData']);
      } else {
        _sellereReqstreamController.add(null);
        hasMoreSellReq = false;
      }
    });
  }

  onrefresh() {
    setState(() {
      sellReqPage = 0;
      reqItemlist = [];
      sellerReqFetch();
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
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Seller request',
                        style: TextStyle(
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                10.height,
                StreamBuilder(
                  stream: _sellereReqstreamController.stream,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());

                      default:
                        if (snapshot.hasError) {
                          return Text('Error');
                        } else if (snapshot.data != null) {
                          return getGridViewAdmin(
                              context, reqItemlist!, onrefresh, false);
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
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'There is no seller request come yet.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Outfit',
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
