import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../Admin/AppTheme.dart';

SizedBox card(String asset, String name) {
  return SizedBox(
    child: Card(
      color: AppThemes().cardColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              asset,
              height: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
    ),
    height: 25.h,
    width: 45.w,
  );
}
