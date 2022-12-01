import 'dart:async';
import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:floading/floading.dart';
import 'package:flutter/material.dart';
import 'package:lunarestate/Service/backend.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Config/config.dart';
import '../AppTheme.dart';

// ignore: must_be_immutable
class userListPage extends StatefulWidget {
  String title;
  userListPage({super.key, required this.title});

  @override
  State<userListPage> createState() => _userListPageState();
}

class _userListPageState extends State<userListPage> {
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
    var newitems = await backend().fetchAdminUsers({'limit': page.toString()});
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

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppThemes().bgColor,
        appBar: AppBar(
          backgroundColor: AppThemes().bgColor,
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
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Card(
                                color: AppThemes().cardColor,
                                child: Container(
                                  child: Row(
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 14.0),
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                itemlist![index]['profile']),
                                            onBackgroundImageError:
                                                (exception, stackTrace) {
                                              Icon(
                                                Icons.broken_image,
                                                color: Colors.red,
                                                size: 30,
                                              );
                                            },
                                            radius: 30,
                                          )),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 18.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  headingText(
                                                      itemlist![index]['name']),
                                                  IconButton(
                                                      onPressed: () async {
                                                        AwesomeDialog(
                                                            context: context,
                                                            dialogType:
                                                                DialogType
                                                                    .warning,
                                                            headerAnimationLoop:
                                                                false,
                                                            animType: AnimType
                                                                .topSlide,
                                                            title:
                                                                'Delete User',
                                                            desc:
                                                                'do you want to delete this user?',
                                                            btnCancelOnPress:
                                                                () {},
                                                            onDismissCallback:
                                                                (type) {
                                                              debugPrint(
                                                                  'Dialog Dismiss from callback $type');
                                                            },
                                                            btnOkText: 'Yes',
                                                            btnOkOnPress:
                                                                () async {
                                                              FLoading.show(
                                                                context,
                                                                loading: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Image.asset(
                                                                      "assets/icons/icon.png",
                                                                      width:
                                                                          200,
                                                                      height:
                                                                          200,
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          25,
                                                                    ),
                                                                    CircularProgressIndicator()
                                                                  ],
                                                                ),
                                                                closable: true,
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.7),
                                                              );
                                                              var res =
                                                                  await backend()
                                                                      .delete({
                                                                'table':
                                                                    'users',
                                                                'id': itemlist![
                                                                        index]
                                                                    ['id'],
                                                                'column': 'id'
                                                              });

                                                              if (res['status'] ==
                                                                  'success') {
                                                                FLoading.hide();
                                                                setState(() {
                                                                  page = 0;
                                                                  itemlist = [];
                                                                  fetch();
                                                                });
                                                              }
                                                            }).show();
                                                      },
                                                      icon: Icon(
                                                        Icons.delete,
                                                        color: Colors.red,
                                                      ))
                                                ],
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.phone,
                                                    color: Colors.amber,
                                                    size: 15,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      itemlist![index]['phone'],
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
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
                                              SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                height: 30,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: OutlinedButton(
                                                          onPressed: () {
                                                            launchUrl(Uri.parse(
                                                                'mailto:${itemlist![index]['email']}'));
                                                          },
                                                          style: OutlinedButton
                                                              .styleFrom(
                                                            side:
                                                                const BorderSide(
                                                                    width: 2.0,
                                                                    color: Colors
                                                                        .amber),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              'EMAIL',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .amber,
                                                              ),
                                                            ),
                                                          )),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 6.0),
                                                        child: OutlinedButton(
                                                            onPressed: () {
                                                              _makePhoneCall(
                                                                  itemlist![
                                                                          index]
                                                                      [
                                                                      'phone']);
                                                            },
                                                            style: OutlinedButton
                                                                .styleFrom(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .amber),
                                                            child: Center(
                                                              child: Text(
                                                                'CALL',
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            )),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                          ),
                                        ),
                                      ),
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                  ),
                                  height: size.height * 0.15,
                                  width: double.infinity,
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
                            'NO USER FOUND',
                            style: TextStyle(
                              color: mainColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'No registerd user found in Luna App.',
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
