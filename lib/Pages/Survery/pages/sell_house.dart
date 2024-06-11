import 'package:flutter/material.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Config/bc_ext.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';

import 'package:lunarestate/Widgets/global_appbar.dart';

class SellHousePage extends StatelessWidget {
  const SellHousePage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
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
                        context.popFromScreen();
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
              child
            ],
          ).addPadding(overall: 12),
        ),
      ),
    );
  }
}
