// ignore_for_file: unused_local_variable

import 'package:lunarestate/Pages/Survery/surveyData.dart';
// import 'package:multiple_images_picker/multiple_images_picker.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';
import '../../Config/config.dart';
import '../../Service/UserData.dart';
import '../../provider/languageProvider.dart';
import 'SurvProvider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lunarestate/Widgets/choiceTile.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

// using statfull widget in every external widget because
// textformfield cause rebuild the whole stateless widget and recall
// saved data again and again in statefull widget i call saved data on initState

// ignore: must_be_immutable
class basicInfo extends StatefulWidget {
  @override
  State<basicInfo> createState() => _basicInfoState();
}

class _basicInfoState extends State<basicInfo> {
  @override
  void initState() {
    super.initState();
    Provider.of<SurvProvider>(context, listen: false).initBasicInfo(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Form(
        key: basicInfoFormKey,
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Name Of Owner',
                style: TextStyle(color: mainColor),
              ),
              leading: Icon(
                FontAwesomeIcons.user,
                color: Colors.white,
              ),
              subtitle: TextFormField(
                controller: ownerName,
                validator: (email) {
                  if (ownerName.text.isNotEmpty)
                    return null;
                  else
                    return 'Enter Owner Name';
                },
                keyboardType: TextInputType.name,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hintText: 'Enter Name',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text(
                'Best number to contact you?',
                style: TextStyle(color: mainColor),
              ),
              leading: Icon(
                EvaIcons.phone,
                color: Colors.white,
              ),
              subtitle: TextFormField(
                controller: ownerNumber,
                keyboardType: TextInputType.number,
                validator: (phone) {
                  if (ownerNumber.text.isNotEmpty)
                    return null;
                  else
                    return 'Enter Owner Number';
                },
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hintText: 'Enter Number',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text(
                'Property Title',
                style: TextStyle(color: mainColor),
              ),
              leading: Icon(
                Icons.title,
                color: Colors.white,
              ),
              subtitle: Container(
                width: 150.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: title,
                        onFieldSubmitted: (value) {
                          Provider.of<SurvProvider>(context, listen: false)
                              .savePropInfoData(context);
                        },
                        validator: (titlet) {
                          if (title.text.isNotEmpty)
                            return null;
                          else
                            return 'Enter property title';
                        },
                        keyboardType: TextInputType.name,
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          hintText: 'Eg. Beautiful new house',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text(
                'Enter Address',
                style: TextStyle(color: mainColor),
              ),
              leading: Icon(
                Icons.location_city,
                color: Colors.white,
              ),
              subtitle: Container(
                width: 150.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: locationController,
                        keyboardType: TextInputType.streetAddress,
                        textAlign: TextAlign.start,
                        onFieldSubmitted: (value) {
                          Provider.of<SurvProvider>(context, listen: false)
                              .savePropInfoData(context);
                        },
                        validator: (address) {
                          if (locationController.text.isNotEmpty)
                            return null;
                          else
                            return 'Enter address';
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Enter Address',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class propertyInfo extends StatefulWidget {
  const propertyInfo({super.key});

  @override
  State<propertyInfo> createState() => _propertyInfoState();
}

class _propertyInfoState extends State<propertyInfo> {
  @override
  void initState() {
    super.initState();
    Provider.of<SurvProvider>(context, listen: false).initGetPropSavedData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: StreamBuilder(
          stream: propInfoStream.stream,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return Text('Error');
                } else {
                  return Form(
                    key: propInfoFormKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          title: Text(
                            'Lot Size',
                            style: TextStyle(color: mainColor),
                          ),
                          leading: Icon(
                            Icons.area_chart_outlined,
                            color: Colors.white,
                          ),
                          subtitle: TextFormField(
                            controller: areaSize,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.start,
                            onFieldSubmitted: (value) {
                              Provider.of<SurvProvider>(context, listen: false)
                                  .savePropInfoData(context);
                            },
                            validator: (areaSizec) {
                              if (areaSize.text.isNotEmpty)
                                return null;
                              else
                                return 'Enter areasize';
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: '0',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          title: Text(
                            'How many bedrooms?',
                            style: TextStyle(color: mainColor),
                          ),
                          leading: Icon(
                            Icons.bedroom_parent,
                            color: Colors.white,
                          ),
                          subtitle: Container(
                            width: 150.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    controller: bedrooms,
                                    keyboardType: TextInputType.number,
                                    onFieldSubmitted: (value) {
                                      Provider.of<SurvProvider>(context,
                                              listen: false)
                                          .savePropInfoData(context);
                                    },
                                    validator: (bedroomsc) {
                                      if (bedrooms.text.isNotEmpty)
                                        return null;
                                      else
                                        return 'Enter bedrooms';
                                    },
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.start,
                                    decoration: InputDecoration(
                                      hintText: '0',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      hintStyle: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          title: Text(
                            'How many bathrooms?',
                            style: TextStyle(color: mainColor),
                          ),
                          leading: Icon(
                            Icons.bathroom_outlined,
                            color: Colors.white,
                          ),
                          subtitle: Container(
                            width: 150.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    controller: bathrooms,
                                    style: TextStyle(color: Colors.white),
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.start,
                                    validator: (bedroomsc) {
                                      if (bathrooms.text.isNotEmpty)
                                        return null;
                                      else
                                        return 'Enter bathrooms';
                                    },
                                    onFieldSubmitted: (value) {
                                      Provider.of<SurvProvider>(context,
                                              listen: false)
                                          .savePropInfoData(context);
                                    },
                                    decoration: InputDecoration(
                                      hintText: '0',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      hintStyle: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          title: Text(
                            'How many stories?',
                            style: TextStyle(color: mainColor),
                          ),
                          leading: Icon(
                            Icons.sell_outlined,
                            color: Colors.white,
                          ),
                          subtitle: TextFormField(
                            controller: stories,
                            onChanged: (value) {},
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.start,
                            cursorColor: Colors.amber,
                            validator: (bedrooms) {
                              if (stories.text.isNotEmpty)
                                return null;
                              else
                                return 'Enter stories';
                            },
                            onFieldSubmitted: (value) {
                              Provider.of<SurvProvider>(context, listen: false)
                                  .savePropInfoData(context);
                            },
                            decoration: InputDecoration(
                              focusColor: Colors.amber,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              hintText: '0',
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          title: Text(
                            'Square Footage',
                            style: TextStyle(color: mainColor),
                          ),
                          leading: Icon(
                            Icons.square_foot,
                            color: Colors.white,
                          ),
                          subtitle: TextFormField(
                            controller: squarefootageController,
                            onChanged: (value) {},
                            keyboardType: TextInputType.name,
                            style: TextStyle(color: Colors.white),
                            validator: (bedroomss) {
                              if (squarefootageController.text.isNotEmpty)
                                return null;
                              else
                                return 'Enter square footage';
                            },
                            textAlign: TextAlign.start,
                            cursorColor: Colors.amber,
                            onFieldSubmitted: (value) {
                              Provider.of<SurvProvider>(context, listen: false)
                                  .savePropInfoData(context);
                            },
                            decoration: InputDecoration(
                              focusColor: Colors.amber,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              hintText: 'Enter Square Footage',
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
            }
          }),
    );
  }
}

// ignore: must_be_immutable
class MultiImageWidget extends StatefulWidget {
  const MultiImageWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final MultiImagePickerController controller;

  @override
  State<MultiImageWidget> createState() => _MultiImageWidgetState();
}

class _MultiImageWidgetState extends State<MultiImageWidget> {
  Widget buildGridView() {
    // if (images.length > 1) {
    //   return SizedBox();
    //   // return SizedBox(
    //   //   height: 450,
    //   //   child: GridView.count(
    //   //     crossAxisCount: 2,
    //   //     // physics: NeverScrollableScrollPhysics(),
    //   //     shrinkWrap: true,
    //   //     children: List.generate(images.length, (index) {
    //   //       // Asset asset = images[index];
    //   //       // return Padding(
    //   //       //   padding: const EdgeInsets.all(8.0),
    //   //       //   child: AssetThumb(
    //   //       //     asset: asset,
    //   //       //     width: 300,
    //   //       //     height: 300,
    //   //       //   ),
    //   //       // );
    //   //     }),
    //   //   ),
    //   // );
    // }
    return SizedBox.shrink();
  }

  Future<void> loadAssets() async {
    // List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      // resultList = await MultipleImagesPicker.pickImages(
      //   maxImages: 30,
      //   enableCamera: true,
      //   selectedAssets: images,
      //   cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
      //   materialOptions: MaterialOptions(
      //     actionBarColor: "#141414",
      //     actionBarTitle: "LunaE",
      //     allViewTitle: "All Photos",
      //     useDetailsView: false,
      //     selectCircleStrokeColor: "#000000",
      //   ),
      // );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      // images = resultList;
    });
  }

  initiaContainer() {
    // TODO UnComment
    // if (images.length <= 1) {
    //   return Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         GestureDetector(
    //           onTap: loadAssets,
    //           child: Image.asset(
    //             'assets/icons/add.png',
    //             height: 145,
    //             width: 145,
    //             fit: BoxFit.fill,
    //           ),
    //         ),
    //         SizedBox(
    //           height: 45,
    //         ),
    //         Text(
    //           'Select Images to Upload',
    //           style: TextStyle(
    //             color: Colors.white,
    //             fontSize: 16.0,
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // }
    return SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        initiaContainer(),
        buildGridView(),
      ],
    );
  }
}

Locale? _temp;

class survey extends StatefulWidget {
  const survey({super.key});

  @override
  State<survey> createState() => _surveyState();
}

class _surveyState extends State<survey> {
  @override
  void initState() {
    super.initState();
    Provider.of<SurvProvider>(context, listen: false).initSurveyData();
  }

  @override
  Widget build(BuildContext context) {
    var singleNotifier = Provider.of<SingleNotifier>(context, listen: false);
    var langloc = AppLocalizations.of(context)!;
    var userProv = Provider.of<UserData>(context, listen: false);
    return StreamBuilder(
        stream: surveyStream.stream,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Text('Error');
              } else {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      //   TextButton(
                      //     child: Text("Survey Language : ${langloc.language}"),
                      //     onPressed: () async {
                      //       await showSingleChoiceDialog(context);
                      //       // ignore: use_build_context_synchronously
                      //       if (singleNotifier.currentlanguage != 'English') {
                      //         _temp = Locale('es');
                      //         // ignore: use_build_context_synchronously
                      //         MyApp.setLocale(context, _temp!);
                      //       } else {
                      //         _temp = Locale('en');
                      //         // ignore: use_build_context_synchronously
                      //         MyApp.setLocale(context, _temp!);
                      //       }
                      //     },
                      //   ),
                      //   SizedBox(
                      //     height: 10,
                      //   ),
                      //   ChoiceTile(
                      //       y: exmValY == 'none'
                      //           ? false
                      //           : exmValY == 'true'
                      //               ? true
                      //               : false,
                      //       n: exmValY == 'none'
                      //           ? false
                      //           : exmValY == 'true'
                      //               ? false
                      //               : true,
                      //       index: '1',
                      //       title: langloc.exm,
                      //       onChange1: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             exmValY = 'true';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             exmValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       onChange2: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             exmValY = 'false';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             exmValY = 'none';
                      //           });
                      //         }
                      //         print(newVal);
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       box1: langloc.yes,
                      //       box2: 'No'),
                      //   ChoiceTile(
                      //       y: surveryValY == 'none'
                      //           ? false
                      //           : surveryValY == 'true'
                      //               ? true
                      //               : false,
                      //       n: surveryValY == 'none'
                      //           ? false
                      //           : surveryValY == 'true'
                      //               ? false
                      //               : true,
                      //       index: '2',
                      //       title: langloc.survey,
                      //       onChange1: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             surveryValY = 'true';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             surveryValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       onChange2: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             surveryValY = 'false';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             surveryValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       box1: langloc.yes,
                      //       box2: 'No'),
                      //   ChoiceTile(
                      //       y: washerValY == 'none'
                      //           ? false
                      //           : washerValY == 'true'
                      //               ? true
                      //               : false,
                      //       n: washerValY == 'none'
                      //           ? false
                      //           : washerValY == 'true'
                      //               ? false
                      //               : true,
                      //       index: '3',
                      //       title: langloc.washer,
                      //       onChange1: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             washerValY = 'true';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             washerValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       onChange2: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             washerValY = 'false';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             washerValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       box1: langloc.yes,
                      //       box2: 'No'),
                      //   ChoiceTile(
                      //       y: dryerValY == 'none'
                      //           ? false
                      //           : dryerValY == 'true'
                      //               ? true
                      //               : false,
                      //       n: dryerValY == 'none'
                      //           ? false
                      //           : dryerValY == 'true'
                      //               ? false
                      //               : true,
                      //       index: '4',
                      //       onChange1: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             dryerValY = 'true';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             dryerValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       onChange2: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             dryerValY = 'false';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             dryerValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       title: langloc.dryer,
                      //       box1: langloc.yes,
                      //       box2: 'No'),
                      //   ChoiceTile(
                      //       y: rangeValY == 'none'
                      //           ? false
                      //           : rangeValY == 'true'
                      //               ? true
                      //               : false,
                      //       n: rangeValY == 'none'
                      //           ? false
                      //           : rangeValY == 'true'
                      //               ? false
                      //               : true,
                      //       index: '5',
                      //       onChange1: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             rangeValY = 'true';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             rangeValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       onChange2: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             rangeValY = 'false';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             rangeValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       title: langloc.range,
                      //       box1: 'Electric',
                      //       box2: 'Gas'),
                      //   ChoiceTile(
                      //       y: guaValY == 'none'
                      //           ? false
                      //           : guaValY == 'true'
                      //               ? true
                      //               : false,
                      //       n: guaValY == 'none'
                      //           ? false
                      //           : guaValY == 'true'
                      //               ? false
                      //               : true,
                      //       index: '6',
                      //       onChange1: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             guaValY = 'true';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             guaValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       onChange2: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             guaValY = 'false';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             guaValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       title: langloc.gua,
                      //       box1: langloc.yes,
                      //       box2: 'No'),
                      //   ChoiceTile(
                      //       y: waterValY == 'none'
                      //           ? false
                      //           : waterValY == 'true'
                      //               ? true
                      //               : false,
                      //       n: waterValY == 'none'
                      //           ? false
                      //           : waterValY == 'true'
                      //               ? false
                      //               : true,
                      //       index: '7',
                      //       onChange1: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             waterValY = 'true';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             waterValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       onChange2: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             waterValY = 'false';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             waterValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       title: langloc.wateron,
                      //       box1: 'City',
                      //       box2: 'Well'),
                      //   ChoiceTile(
                      //       y: sewerValY == 'none'
                      //           ? false
                      //           : sewerValY == 'true'
                      //               ? true
                      //               : false,
                      //       n: sewerValY == 'none'
                      //           ? false
                      //           : sewerValY == 'true'
                      //               ? false
                      //               : true,
                      //       index: '8',
                      //       onChange1: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             sewerValY = 'true';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             sewerValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       onChange2: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             sewerValY = 'false';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             sewerValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       title: langloc.sewer,
                      //       box1: 'City',
                      //       box2: 'Septic'),
                      //   ChoiceTile(
                      //       y: backtaxValY == 'none'
                      //           ? false
                      //           : backtaxValY == 'true'
                      //               ? true
                      //               : false,
                      //       n: backtaxValY == 'none'
                      //           ? false
                      //           : backtaxValY == 'true'
                      //               ? false
                      //               : true,
                      //       index: '9',
                      //       onChange1: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             backtaxValY = 'true';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             backtaxValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       onChange2: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             backtaxValY = 'false';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             backtaxValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       title: langloc.bto,
                      //       box1: langloc.yes,
                      //       box2: 'No'),
                      //   ChoiceTile(
                      //       y: lopValY == 'none'
                      //           ? false
                      //           : lopValY == 'true'
                      //               ? true
                      //               : false,
                      //       n: lopValY == 'none'
                      //           ? false
                      //           : lopValY == 'true'
                      //               ? false
                      //               : true,
                      //       index: '10',
                      //       onChange1: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             lopValY = 'true';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             lopValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       onChange2: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             lopValY = 'false';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             lopValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       title: langloc.lop,
                      //       box1: langloc.yes,
                      //       box2: 'No'),
                      //   ChoiceTile(
                      //       y: isPropValY == 'none'
                      //           ? false
                      //           : isPropValY == 'true'
                      //               ? true
                      //               : false,
                      //       n: isPropValY == 'none'
                      //           ? false
                      //           : isPropValY == 'true'
                      //               ? false
                      //               : true,
                      //       index: '11',
                      //       onChange1: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             isPropValY = 'true';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             isPropValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       onChange2: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             isPropValY = 'false';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             isPropValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       title: langloc.isProp,
                      //       box1: langloc.vecant,
                      //       box2: langloc.occupied),
                      //   ChoiceTile(
                      //       y: lockBoxValY == 'none'
                      //           ? false
                      //           : lockBoxValY == 'true'
                      //               ? true
                      //               : false,
                      //       n: lockBoxValY == 'none'
                      //           ? false
                      //           : lockBoxValY == 'true'
                      //               ? false
                      //               : true,
                      //       index: '12',
                      //       onChange1: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             lockBoxValY = 'true';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             lockBoxValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       onChange2: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             lockBoxValY = 'false';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             lockBoxValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       title: langloc.istherelopinspec,
                      //       box1: langloc.yes,
                      //       box2: 'No'),
                      //   ChoiceTile(
                      //       y: ownerFinanaceValY == 'none'
                      //           ? false
                      //           : ownerFinanaceValY == 'true'
                      //               ? true
                      //               : false,
                      //       n: ownerFinanaceValY == 'none'
                      //           ? false
                      //           : ownerFinanaceValY == 'true'
                      //               ? false
                      //               : true,
                      //       index: '13',
                      //       onChange1: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             ownerFinanaceValY = 'true';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             ownerFinanaceValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       onChange2: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             ownerFinanaceValY = 'false';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             ownerFinanaceValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       title: langloc.opentoOfinanced,
                      //       box1: langloc.yes,
                      //       box2: 'No'),
                      //   ChoiceTile(
                      //       y: newHomeValY == 'none'
                      //           ? false
                      //           : newHomeValY == 'true'
                      //               ? true
                      //               : false,
                      //       n: newHomeValY == 'none'
                      //           ? false
                      //           : newHomeValY == 'true'
                      //               ? false
                      //               : true,
                      //       index: '14',
                      //       onChange1: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             newHomeValY = 'true';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             newHomeValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       onChange2: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             newHomeValY = 'false';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             newHomeValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       title: langloc.areyoulooking,
                      //       box1: langloc.yes,
                      //       box2: 'No'),
                      //   ChoiceTile(
                      //       y: assistfornewHomeValY == 'none'
                      //           ? false
                      //           : assistfornewHomeValY == 'true'
                      //               ? true
                      //               : false,
                      //       n: assistfornewHomeValY == 'none'
                      //           ? false
                      //           : assistfornewHomeValY == 'true'
                      //               ? false
                      //               : true,
                      //       index: '15',
                      //       onChange1: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             assistfornewHomeValY = 'true';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             assistfornewHomeValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       onChange2: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             assistfornewHomeValY = 'false';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             assistfornewHomeValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       title: langloc.assistancefornewhome,
                      //       box1: langloc.yes,
                      //       box2: 'No'),
                      //   ChoiceTile(
                      //       y: morghelpValY == 'none'
                      //           ? false
                      //           : morghelpValY == 'true'
                      //               ? true
                      //               : false,
                      //       n: morghelpValY == 'none'
                      //           ? false
                      //           : morghelpValY == 'true'
                      //               ? false
                      //               : true,
                      //       index: '16',
                      //       onChange1: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             morghelpValY = 'true';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             morghelpValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       onChange2: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             morghelpValY = 'false';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             morghelpValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       title: langloc.morgagelender,
                      //       box1: langloc.yes,
                      //       box2: 'No'),
                      //   ChoiceTile(
                      //       y: FoundationValY == 'none'
                      //           ? false
                      //           : FoundationValY == 'true'
                      //               ? true
                      //               : false,
                      //       n: FoundationValY == 'none'
                      //           ? false
                      //           : FoundationValY == 'true'
                      //               ? false
                      //               : true,
                      //       index: '17',
                      //       onChange1: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             FoundationValY = 'true';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             FoundationValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       onChange2: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             FoundationValY = 'false';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             FoundationValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       title: langloc.foundation,
                      //       box1: langloc.pierandbeam,
                      //       box2: langloc.slab),
                      //   ChoiceTile(
                      //       y: basementValY == 'none'
                      //           ? false
                      //           : basementValY == 'true'
                      //               ? true
                      //               : false,
                      //       n: basementValY == 'none'
                      //           ? false
                      //           : basementValY == 'true'
                      //               ? false
                      //               : true,
                      //       index: '18',
                      //       onChange1: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             basementValY = 'true';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             basementValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       onChange2: (newVal) {
                      //         if (newVal!) {
                      //           setState(() {
                      //             basementValY = 'false';
                      //           });
                      //         } else {
                      //           setState(() {
                      //             basementValY = 'none';
                      //           });
                      //         }
                      //         Provider.of<SurvProvider>(context, listen: false)
                      //             .saveSurveyData(userProv.id!);
                      //       },
                      //       title: langloc.havebasement,
                      //       box1: langloc.yes,
                      //       box2: 'No'),
                    ],
                  ),
                );
              }
          }
        });
  }
}

class surveyMore extends StatefulWidget {
  const surveyMore({super.key});

  @override
  State<surveyMore> createState() => _surveyMoreState();
}

class _surveyMoreState extends State<surveyMore> {
  @override
  void initState() {
    super.initState();
    Provider.of<SurvProvider>(context, listen: false).initSurveyMoreData();
  }

  @override
  Widget build(BuildContext context) {
    var langloc = AppLocalizations.of(context)!;

    return StreamBuilder(
        stream: surveyMoreStream.stream,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Text('Error');
              } else {
                return Column(
                  children: [
                    if (backtaxValY == 'true')
                      ListTile(
                        title: Text(
                          langloc.backedtaxamount,
                          style: TextStyle(color: mainColor),
                        ),
                        leading: Icon(
                          FontAwesomeIcons.moneyBill,
                          color: Colors.white,
                        ),
                        subtitle: TextField(
                          controller: backedTaxAmount,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.start,
                          onSubmitted: (value) {
                            Provider.of<SurvProvider>(context, listen: false)
                                .saveSurveyMoreData(Provider.of<UserData>(
                                        context,
                                        listen: false)
                                    .id!);
                          },
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintText: langloc.enteramount,
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    if (lopValY == 'true')
                      ListTile(
                        title: Text(
                          langloc.lopexplain,
                          style: TextStyle(color: mainColor),
                        ),
                        leading: Icon(
                          Icons.houseboat_outlined,
                          color: Colors.white,
                        ),
                        subtitle: TextField(
                          controller: leanOnProp,
                          keyboardType: TextInputType.name,
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.start,
                          onSubmitted: (value) {
                            Provider.of<SurvProvider>(context, listen: false)
                                .saveSurveyMoreData(Provider.of<UserData>(
                                        context,
                                        listen: false)
                                    .id!);
                          },
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintText: langloc.explease,
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    if (lockBoxValY == 'true')
                      ListTile(
                        title: Text(
                          langloc.describeplace,
                          style: TextStyle(color: mainColor),
                        ),
                        leading: Icon(
                          Icons.add_box,
                          color: Colors.white,
                        ),
                        subtitle: TextField(
                          controller: lockBoxPlaced,
                          keyboardType: TextInputType.name,
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.start,
                          onSubmitted: (value) {
                            Provider.of<SurvProvider>(context, listen: false)
                                .saveSurveyMoreData(Provider.of<UserData>(
                                        context,
                                        listen: false)
                                    .id!);
                          },
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintText: langloc.describe,
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Text(
                        langloc.timeframe,
                        style: TextStyle(color: mainColor),
                      ),
                      leading: Icon(
                        Icons.timelapse,
                        color: Colors.white,
                      ),
                      subtitle: TextField(
                        controller: timeFrameofPro,
                        keyboardType: TextInputType.name,
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.start,
                        onSubmitted: (value) {
                          Provider.of<SurvProvider>(context, listen: false)
                              .saveSurveyMoreData(
                                  Provider.of<UserData>(context, listen: false)
                                      .id!);
                        },
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          hintText: langloc.eg,
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    headingText(langloc.ratecond),
                    SizedBox(
                      height: 10,
                    ),
                    RatingStars(
                      value: Provider.of<SurvProvider>(context, listen: true)
                          .value,
                      onValueChanged: (v) {
                        Provider.of<SurvProvider>(context, listen: false)
                            .updateStarsValue(v);
                      },
                      starBuilder: (index, color) => Icon(
                        Icons.star,
                        color: color,
                      ),
                      starCount: 5,
                      starSize: 40,
                      valueLabelColor: const Color(0xff9b9b9b),
                      valueLabelTextStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.0),
                      valueLabelRadius: 10,
                      maxValue: 5,
                      starSpacing: 5,
                      maxValueVisibility: true,
                      valueLabelVisibility: true,
                      animationDuration: Duration(milliseconds: 1000),
                      valueLabelPadding: const EdgeInsets.symmetric(
                          vertical: 1, horizontal: 8),
                      valueLabelMargin: const EdgeInsets.only(right: 8),
                      starOffColor: const Color(0xffe7e8ea),
                      starColor: Colors.yellow,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ChoiceTile(
                        y: fastcashY == 'none'
                            ? false
                            : fastcashY == 'true'
                                ? true
                                : false,
                        n: fastcashY == 'none'
                            ? false
                            : fastcashY == 'true'
                                ? false
                                : true,
                        index: ' ',
                        title: langloc.fastcash,
                        onChange1: (newVal) {
                          if (newVal!) {
                            setState(() {
                              fastcashY = 'true';
                            });
                          } else {
                            setState(() {
                              fastcashY = 'none';
                            });
                          }
                          Provider.of<SurvProvider>(context, listen: false)
                              .saveSurveyMoreData(
                                  Provider.of<UserData>(context, listen: false)
                                      .id!);
                        },
                        onChange2: (newVal) {
                          if (newVal!) {
                            setState(() {
                              fastcashY = 'false';
                            });
                          } else {
                            setState(() {
                              exmValY = 'none';
                            });
                          }
                          print(newVal);
                          Provider.of<SurvProvider>(context, listen: false)
                              .saveSurveyMoreData(
                                  Provider.of<UserData>(context, listen: false)
                                      .id!);
                        },
                        box1: langloc.yes,
                        box2: 'No'),
                    SizedBox(
                      height: 10,
                    ),
                    headingText(langloc.payment),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      child: CheckboxListTile(
                          title: AutoSizeText(
                            langloc.cash,
                            maxLines: 1,
                            presetFontSizes: [14, 12, 10, 9],
                          ),
                          activeColor: Colors.amber,
                          value: cash,
                          onChanged: (newVal) {
                            if (cash) {
                              setState(() {
                                cash = newVal!;
                              });
                            } else {
                              setState(() {
                                cash = newVal!;
                                check = false;
                                wire = false;
                              });
                            }

                            Provider.of<SurvProvider>(context, listen: false)
                                .saveSurveyMoreData(Provider.of<UserData>(
                                        context,
                                        listen: false)
                                    .id!);
                          }),
                    ),
                    Container(
                      width: double.infinity,
                      child: CheckboxListTile(
                          title: AutoSizeText(
                            langloc.check,
                            maxLines: 1,
                            presetFontSizes: [14, 12, 10, 9],
                          ),
                          value: check,
                          activeColor: Colors.amber,
                          onChanged: (newVal) {
                            if (check) {
                              setState(() {
                                check = newVal!;
                              });
                            } else {
                              setState(() {
                                cash = false;
                                check = newVal!;
                                wire = false;
                              });
                            }
                            Provider.of<SurvProvider>(context, listen: false)
                                .saveSurveyMoreData(Provider.of<UserData>(
                                        context,
                                        listen: false)
                                    .id!);
                          }),
                    ),
                    Container(
                      width: double.infinity,
                      child: CheckboxListTile(
                          title: AutoSizeText(
                            langloc.wiredep,
                            maxLines: 1,
                            presetFontSizes: [14, 12, 10, 9],
                          ),
                          value: wire,
                          activeColor: Colors.amber,
                          onChanged: (newVal) {
                            if (wire) {
                              setState(() {
                                wire = newVal!;
                              });
                            } else {
                              setState(() {
                                cash = false;
                                wire = newVal!;
                                check = false;
                              });
                            }
                            Provider.of<SurvProvider>(context, listen: false)
                                .saveSurveyMoreData(Provider.of<UserData>(
                                        context,
                                        listen: false)
                                    .id!);
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: paragraphText(langloc.note),
                    ),
                  ],
                );
              }
          }
        });
  }
}
