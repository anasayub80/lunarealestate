import 'package:flutter/material.dart';

abstract class AppThemes {
  static Color primaryColor = Color(0xffD3A45C);
  static Color whiteColor = Colors.white;
  static Color bgColor = Color(0xff171820);
  static Color cardColornew = Color(0xff22252A);
  static Color cardColor = Color(0xff30313A);
  static Color secondarycolor = Color(0xFFD3A45C);
  static BoxDecoration commonBoxDecoration = BoxDecoration(
    color: Color(0xFF22252A),
    borderRadius: BorderRadius.circular(12),
    border: Border.all(
      width: 1,
      color: Color(0xFF494748),
    ),
  );
}

adfas() {
  // AppThemes.commonBoxDecoration.copyWith(border: )
}
