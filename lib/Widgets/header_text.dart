import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Config/spacing_ext.dart';

Widget getHeader(String text, {double horizontalPadding = 19.0}) {
  return Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
            color: AppThemes.whiteColor,
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
          ),
        ),
      ).addPadding(
        horizontal: horizontalPadding,
        vertical: 4,
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: 50,
          child: Divider(
            thickness: 1.8,
            color: AppThemes.secondarycolor,
          ),
        ),
      ).addPadding(
        horizontal: horizontalPadding,
        vertical: 0,
      ),
    ],
  );
}
