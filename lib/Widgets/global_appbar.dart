import 'package:flutter/material.dart';
import 'package:flutter_native_splash/cli_commands.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Provider.of<UserData>(context, listen: false)
                              .name
                              ?.capitalize() ??
                          'John Doe',
                      style: TextStyle(
                          color: AppThemes.whiteColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          wordSpacing: 3.1),
                    ),
                    // 4.height,
                    Row(
                      children: [
                        Icon(
                          Icons.email,
                          color: AppThemes.secondarycolor,
                          size: 20,
                        ),
                        4.width,
                        Text(
                          Provider.of<UserData>(context, listen: false)
                              .email
                              .toString(),
                          style: TextStyle(
                            color: AppThemes.whiteColor,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
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
