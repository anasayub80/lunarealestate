import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/ProfilePage/ProfilePage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../Service/UserData.dart';

class GlobalAppBar extends StatelessWidget {
  const GlobalAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 75,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 4.height,
                SvgPicture.asset(
                  'assets/icons/menu.svg',
                  height: 19,
                ),
              ],
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      isIos: true,
                      duration: Duration(milliseconds: 700),
                      child: ProfilePage(),
                      type: PageTransitionType.fade));
            },
            child: Hero(
              tag: "profileImage",
              child: CircleAvatar(
                radius: 41,
                backgroundImage: NetworkImage(
                  Provider.of<UserData>(context, listen: true)
                      .profile
                      .toString(),
                ),
                onBackgroundImageError: (exception, stackTrace) {
                  Icon(
                    Icons.broken_image,
                    color: Colors.red,
                    size: 30,
                  );
                },
              ),
            ),
          ),
        ],
      ).addPadding(
        horizontal: 6,
        top: 12,
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
