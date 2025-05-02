import 'package:flutter/material.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import '../Widgets/customAppBar.dart';
import '../Widgets/global_appbar.dart';
import '../Widgets/header_text.dart';

class ClientInformationPage extends StatelessWidget {
  final String uid;
  const ClientInformationPage({super.key, required this.uid});
  Future getUserData() async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgTwo(
        child: Column(
          children: [
            10.height,
            CustomAppBarWithCircleback().addPadding(left: 12),
            15.height,
            GlobalAppBar().addPadding(horizontal: 12),
            10.height,
            getHeader('Client Information').addPadding(
              horizontal: 8,
              top: 12,
            ),
            20.height,
            FutureBuilder(
              future: getUserData(),
              builder: (context, snapshot) {
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
