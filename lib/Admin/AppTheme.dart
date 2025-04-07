import 'package:flutter/material.dart';

abstract class AppThemes {
  static const Color primaryColor = Color(0xffD3A45C);
  static const Color whiteColor = Colors.white;
  static const Color bgColor = Color(0xff171820);
  static const Color cardColornew = Color(0xff22252A);
  static const Color cardColor = Color(0xff30313A);
  static const secondarycolor = Color(0xffEFD397);
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
