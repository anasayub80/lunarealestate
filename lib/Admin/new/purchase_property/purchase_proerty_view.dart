import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lunarestate/Admin/new/seller_request/widgets/grid_view.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import 'package:lunarestate/Service/backend.dart';
import 'package:lunarestate/Widgets/customAppBar.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.height,
            CustomAppBarWithCircleback().addPadding(left: 12),
            10.height,

            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Purchase Property',
                style: TextStyle(
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
            // Spacer(),
            20.height,
            itemlist!.isNotEmpty
                ? getGridViewAdmin(context, itemlist ?? [], () {}, false, true)
                : SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/images/no_property.svg"),
                        15.height,
                        Text(
                          'NO PURCHASED PROPERTY',
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            color: Color(0xFFDBAE68),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Not found any property purchased by LUNA ENTERPRIESES',
                          style: TextStyle(
                            fontFamily: 'Outfit',

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
          ],
        ),
      ),
    );
  }
}
