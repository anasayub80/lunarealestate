import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import 'package:lunarestate/Service/backend.dart';
import 'package:lunarestate/Widgets/customAppBar.dart';
import 'package:lunarestate/Widgets/global_appbar.dart';
import 'package:lunarestate/Widgets/header_text.dart';

class PurchaseProertyView extends StatefulWidget {
  const PurchaseProertyView({super.key});

  @override
  State<PurchaseProertyView> createState() => _PurchaseProertyViewState();
}

class _PurchaseProertyViewState extends State<PurchaseProertyView> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgTwo(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              10.height,
              CustomAppBarWithCircleback().addPadding(left: 12),
              10.height,
              GlobalAppBar().addPadding(horizontal: 12),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getHeader('Purchase Property'),
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
              // Spacer(),
              100.height,
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/images/no_property.svg"),
                    15.height,
                    Text(
                      'NO PURCHASED PROPERTY',
                      style: TextStyle(
                        color: Color(0xFFDBAE68),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Not found any property purchased by LUNA ENTERPRIESES',
                      style: TextStyle(
                        // color: Color(0xFFDBAE68),
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ).center(),
              // Spacer(),
              // getGridViewAdmin(context, {}, 6),
            ],
          ),
        ),
      ),
    );
  }
}
