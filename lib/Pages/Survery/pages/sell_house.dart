import 'package:flutter/material.dart';
import 'package:lunarestate/Config/bc_ext.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import 'package:lunarestate/Pages/Survery/pages/children_widgets/agreement_info.dart';
import 'package:lunarestate/Pages/Survery/pages/children_widgets/basic_info.dart';
import 'package:lunarestate/Pages/Survery/pages/children_widgets/property_info.dart';
import 'package:lunarestate/Pages/Survery/pages/children_widgets/survey_page.dart';

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
              GlobalAppBar().addPadding(top: 20),
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
                        backgroundColor: Colors.white,
                        radius: 10,
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          size: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ).addPadding(left: 10),
              ),
              20.height,
              widget.child
            ],
          ).addPadding(overall: 12),
        ),
      ),
    );
  }
}

class InitializedSellHouse extends StatefulWidget {
  const InitializedSellHouse({super.key});

  @override
  State<InitializedSellHouse> createState() => _InitializedSellHouseState();
}

class _InitializedSellHouseState extends State<InitializedSellHouse> {
  @override
  void initState() {
    super.initState();
    // var prov = Provider.of<SurvProvider>(context, listen: false);
    Provider.of<SurvProvider>(context, listen: false).initStepIndex();
    Provider.of<SurvProvider>(context, listen: false).getFormIdfrom();
  }

  @override
  Widget build(BuildContext context) {
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
                          return SellHousePage(
                              child: SurveyPageOne(
                            surveyQuestions: null,
                          ));

                        case 3:
                          return SellHousePage(
                            child: AgreementInfo(),
                          );
                        default:
                          return SellHousePage(
                            child: BasicInfo(),
                          );
                      }
                    },
                  );
                }
            }
          }),
    );
  }
}
