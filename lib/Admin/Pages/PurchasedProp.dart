import 'dart:async';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lunarestate/Pages/SellHistory/fullDetail.dart';
import 'package:lunarestate/Service/backend.dart';

import '../../Config/config.dart';
import '../AppTheme.dart';

// ignore: must_be_immutable
class purchasedPropPage extends StatefulWidget {
  String title;
  purchasedPropPage({super.key, required this.title});

  @override
  State<purchasedPropPage> createState() => _purchasedPropPageState();
}

class _purchasedPropPageState extends State<purchasedPropPage> {
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
        .fetchMoreAdminProperty({'type': 'sold', 'limit': page.toString()});
    log('my new items $newitems');
    setState(() {
      if (newitems != null) {
        page += 10;
        if (newitems.length <= 5) {
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppThemes.bgColor,
        appBar: AppBar(
          backgroundColor: AppThemes.bgColor,
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: RefreshIndicator(
            onRefresh: () async {
              setState(() {
                page = 0;
                itemlist = [];
                fetch();
              });
            },
            child: StreamBuilder(
              stream: _streamController.stream,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());

                  default:
                    if (snapshot.hasError) {
                      return Text('Error');
                    } else if (snapshot.data != null) {
                      return ListView.builder(
                        controller: controller,
                        itemCount: itemlist!.length + 1,
                        itemBuilder: (context, index) {
                          if (index < itemlist!.length) {
                            final title = itemlist![index]['title'];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: GestureDetector(
                                onTap: () async {
                                  var res = await Navigator.push(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return FullDetail(
                                          formId: itemlist![index]['id'],
                                          from: 'admin');
                                    },
                                  ));
                                  if (res == 'success') {
                                    setState(() {
                                      page = 0;
                                      itemlist = [];
                                      fetch();
                                    });
                                  }
                                },
                                child: Card(
                                  color: AppThemes.cardColor,
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Stack(
                                          children: [
                                            CachedNetworkImage(
                                              imageUrl: itemlist![index]
                                                  ['image'],
                                              height: size.height,
                                              fit: BoxFit.fill,
                                              width: size.width * 0.35,
                                              placeholder: (context, url) => Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                            ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(8),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0, right: 8),
                                                  child: Text(
                                                    'SOLD',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 18.0),
                                            child: Column(
                                              children: [
                                                headingText(title),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.location_on,
                                                      color: Colors.amber,
                                                      size: 15,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        itemlist![index]
                                                            ['location'],
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.amber,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  itemlist![index]['date'],
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                            ),
                                          ),
                                        ),
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                    ),
                                    height: size.height * 0.15,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return hasMore
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : SizedBox.shrink();
                          }
                        },
                      );
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
                            'NO PURCHASED PROPERTY',
                            style: TextStyle(
                              color: mainColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Not found any property purchased by Luna enterprises.',
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
            )));
  }
}
