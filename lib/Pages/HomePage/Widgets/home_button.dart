import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Config/bc_ext.dart';
import 'package:lunarestate/Config/spacing_ext.dart';

class HomeButtons extends StatelessWidget {
  final String svg;
  final String title;
  final void Function()? onTapBtn;
  const HomeButtons({
    super.key,
    required this.svg,
    required this.title,
    required this.onTapBtn,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapBtn,
      child: Container(
        width: context.screenWidth * 0.9,
        height: 62,
        decoration: BoxDecoration(
          color: Color(0xFF22252A),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            width: 3,
            color: Color(0xFF494748),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(svg).addPadding(left: 10),
                15.width,
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                    letterSpacing: 1.1,
                  ),
                ),
              ],
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward,
              color: AppThemes.primaryColor,
            ),
          ],
        ).addPadding(overall: 12),
        // child: mainColor,
      ),
    );
  }
}
