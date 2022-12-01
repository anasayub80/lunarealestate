import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lunarestate/Config/config.dart';
import 'package:lunarestate/Pages/SellHistory/fullDetail.dart';
import 'package:lunarestate/Service/UserData.dart';
import 'package:lunarestate/Service/backend.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widgets/customAppBar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:floading/floading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../Survery/SurvProvider.dart';

// ignore: must_be_immutable
class SellHistoryPage extends StatefulWidget {
  String from;
  SellHistoryPage({required this.from});

  @override
  State<SellHistoryPage> createState() => _SellHistoryPageState();
}

class _SellHistoryPageState extends State<SellHistoryPage> {
  deleteSurveyOldData(String myformId) async {
    if (Provider.of<SurvProvider>(context, listen: false).formid == myformId) {
      log('Delete form Data');
      SharedPreferences pref = await SharedPreferences.getInstance();
      if (pref.containsKey('basicData')) {
        pref.remove('basicData');
      }
      for (String key in pref.getKeys()) {
        if (key != "userData") {
          pref.remove(key);
        }
        //   }
        // if (pref.containsKey('formid')) {
        //   pref.remove('formid');
        // }
        // if (pref.containsKey('activeStepIndex')) {
        //   pref.remove('activeStepIndex');
        // }
        // if (pref.containsKey('PropInfoData')) {
        //   pref.remove('PropInfoData');
        // }
        // if (pref.containsKey('data')) {
        //   pref.remove('data');
        // }
        // if (pref.containsKey('surveyMore')) {
        //   pref.remove('surveyMore');
        // }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<SurvProvider>(context, listen: false).getFormIdfrom();

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                widget.from == 'btn'
                    ? CustomAppBarwithBackButton('My House')
                    : CustomAppBar('My House'),
              ];
            },
            body: Container(
              padding: EdgeInsets.only(top: 18, left: 8, right: 8),
              child: FutureBuilder(
                  future: backend().fetchProperty(
                      Provider.of<UserData>(context, listen: false).id!),
                  builder: (context, AsyncSnapshot snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());

                      default:
                        if (snapshot.hasError) {
                          return Text('Error');
                        } else if (snapshot.data != null) {
                          return GridView.builder(
                            itemCount: snapshot.data.length,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5.0,
                              mainAxisSpacing: 5.0,
                              childAspectRatio:
                                  size.width / (size.height / 1.6),
                            ),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  debugPrint(snapshot.data[index]['id']);
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return FullDetail(
                                          from: 'name',
                                          formId: snapshot.data[index]['id']);
                                    },
                                  ));
                                },
                                child: Card(
                                  child: Container(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 120,
                                            width: size.width,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(8),
                                                topRight: Radius.circular(8),
                                              ),
                                              child: Stack(
                                                children: [
                                                  SizedBox(
                                                    width: size.width,
                                                    child: CachedNetworkImage(
                                                      imageUrl: snapshot
                                                          .data[index]['image'],
                                                      height:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .height,
                                                      fit: BoxFit.fill,
                                                      placeholder: (context,
                                                              url) =>
                                                          Center(
                                                              child:
                                                                  CircularProgressIndicator()),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(Icons.error),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: snapshot.data[index][
                                                                'detailType'] ==
                                                            'Complete'
                                                        ? SizedBox.shrink()
                                                        : Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors.red,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 8.0,
                                                                      right: 8),
                                                              child: Text(
                                                                snapshot.data[
                                                                        index][
                                                                    'detailType'],
                                                                style:
                                                                    TextStyle(
                                                                  color: snapshot.data[index]
                                                                              [
                                                                              'detailType'] ==
                                                                          'Complete'
                                                                      ? Colors
                                                                          .green
                                                                      : Colors
                                                                          .white,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 8.0,
                                                right: 8.0,
                                              ),
                                              child: Container(
                                                // color: Colors.green,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      snapshot.data[index]
                                                          ['title'],
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.amber,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons.location_on,
                                                          color: Colors.amber,
                                                          size: 15,
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            snapshot.data[index]
                                                                ['location'],
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              // color: Colors.brown,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 8.0,
                                                      bottom: 5.0,
                                                    ),
                                                    child: Text(
                                                      snapshot.data[index]
                                                          ['date'],
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: GestureDetector(
                                                      onTap: () async {
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
                                                                'Delete Property',
                                                            desc:
                                                                'do you want to delete this property?',
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
                                                              log(snapshot.data[
                                                                  index]['id']);
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
                                                                closable: false,
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.7),
                                                              );
                                                              deleteSurveyOldData(
                                                                  snapshot.data[
                                                                          index]
                                                                      ['id']);
                                                              var res =
                                                                  await backend()
                                                                      .deleteProperty({
                                                                'formid': snapshot
                                                                        .data[
                                                                    index]['id'],
                                                              });

                                                              if (res['status'] ==
                                                                  'success') {
                                                                FLoading.hide();

                                                                setState(() {});
                                                              }
                                                            }).show();
                                                      },
                                                      child: Container(
                                                        child: Icon(
                                                          Icons.delete,
                                                          color: Colors.white,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    8),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    8),
                                                          ),
                                                        ),
                                                        height: 35,
                                                        width: 35,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                      ),
                                      width: size.width * 0.25,
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
                                          color:
                                              Color.fromARGB(255, 69, 64, 64),
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  // color: Color.fromARGB(255, 69, 64, 64),
                                  elevation: 2,
                                  color: Color.fromARGB(255, 69, 64, 64),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              );
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
                                'NO UPLOADED PROPERTY',
                                style: TextStyle(
                                  color: mainColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'You have not posted any house for sell.',
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
                  }),
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
