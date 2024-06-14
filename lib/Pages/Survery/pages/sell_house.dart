import 'package:flutter/material.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Config/bc_ext.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import 'package:lunarestate/Pages/Survery/pages/children_widgets/basic_info.dart';
import 'package:lunarestate/Pages/Survery/pages/children_widgets/property_info.dart';
import 'package:lunarestate/Pages/Survery/pages/children_widgets/survey_page.dart';
import 'package:lunarestate/Pages/Survery/pages/children_widgets/survey_page_2.dart';
import 'package:lunarestate/Pages/Survery/pages/children_widgets/upload_photos.dart';

import 'package:lunarestate/Widgets/global_appbar.dart';
import 'package:provider/provider.dart';

import '../SurvProvider.dart';
import '../surveyData.dart';

class SellHousePage extends StatefulWidget {
  const SellHousePage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<SellHousePage> createState() => _SellHousePageState();
}

class _SellHousePageState extends State<SellHousePage> {
  bool more = false;

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<SurvProvider>(context, listen: false);

    return Scaffold(
      body: BgTwo(
        child: SingleChildScrollView(
          child: Column(
            children: [
              20.height,
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        if (prov.activeStepIndex == 0) {
                          context.popFromScreen();
                        }
                        // if (more) {
                        //   // setState(() {
                        //   more = false;
                        //   // });
                        // } else {
                        // setState((() {
                        prov.updateStepIndex(prov.activeStepIndex -= 1);
                        // }));
                        // }
                      },
                      child: CircleAvatar(
                        backgroundColor: AppThemes.primaryColor,
                        radius: 10,
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      "Back",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ).addPadding(left: 10)
                  ],
                ).addPadding(left: 10),
              ),
              GlobalAppBar().addPadding(overall: 10),
              20.height,
              widget.child
            ],
          ).addPadding(overall: 12),
        ),
      ),
    );
  }
}

class InitializedSellHouse extends StatelessWidget {
  const InitializedSellHouse({super.key});

  @override
  Widget build(BuildContext context) {
    // var prov = Provider.of<SurvProvider>(context, listen: false);
    Provider.of<SurvProvider>(context, listen: false).initStepIndex();
    Provider.of<SurvProvider>(context, listen: false).getFormIdfrom();
    return Scaffold(
      body: StreamBuilder(
          stream: stepperIndexStream.stream,
          builder: (context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());

              default:
                if (snapshot.hasError) {
                  return Text('Error');
                } else {
                  // Use Consumer to listen to changes in activeStepIndex
                  return Consumer<SurvProvider>(
                    builder: (context, prov, child) {
                      switch (prov.activeStepIndex) {
                        case 0:
                          return SellHousePage(child: BasicInfo());
                        case 1:
                          return SellHousePage(child: PropertyInfo());
                        case 2:
                          return SellHousePage(child: UploadPhotos());
                        case 3:
                          return SellHousePage(child: SurveyPageOne());
                        case 4:
                          return SellHousePage(child: SurveyPage2());
                        default:
                          return SellHousePage(child: BasicInfo());
                      }
                    },
                  );
                }
            }
          }),
    );
  }
}
