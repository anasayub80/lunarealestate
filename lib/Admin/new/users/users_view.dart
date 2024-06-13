import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Admin/widgets/app_bar_global.dart';
import 'package:lunarestate/Config/bc_ext.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import 'package:lunarestate/Widgets/customAppBar.dart';
import 'package:lunarestate/Widgets/header_text.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgTwo(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SafeArea(
              child: CustomAppBarWithCircleback().addPadding(left: 12),
            ),
            SafeArea(
              child: GlobalAppBarAdmin(),
            ),
            30.height,
            getHeader('Users').addPadding(
              horizontal: 8,
              top: 12,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                // physics: NeverScrollableScrollPhysics(),
                itemBuilder: (s, i) => Container(
                  height: context.screenHeight * 0.1,
                  width: double.infinity,
                  decoration: AppThemes.commonBoxDecoration.copyWith(
                    borderRadius: BorderRadius.circular(51),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: context.screenHeight * 0.04,
                            backgroundImage: NetworkImage(
                              'https://fastly.picsum.photos/id/25/5000/3333.jpg?hmac=yCz9LeSs-i72Ru0YvvpsoECnCTxZjzGde805gWrAHkM',
                            ),
                          ).addPadding(horizontal: 12, vertical: 6),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Georgie Wilkerson',
                                style: TextStyle(
                                  color: Color(0xFFD3A45C),
                                  fontSize: 16,
                                ),
                              ),
                              2.height,
                              Text(
                                '+12 333 4444 55',
                                style: TextStyle(
                                  // color: Color(0xFFD3A45C),
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ).addPadding(vertical: 6),
                        ],
                      ),
                      // 6.width,

                      Container(
                        height: context.screenHeight * 0.14,
                        width: context.screenWidth * 0.14,

                        decoration: BoxDecoration(
                          color: Color(0xFF4C4B4B),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/phone_icon.svg',
                          height: context.screenHeight * 0.12,
                          fit: BoxFit.scaleDown,
                          width: context.screenWidth * 0.14,
                        ),
                        // backgroundImage:
                        //     SvgPicture.asset('assets/icons/phone_icon.svg') ,
                      ).addPadding(horizontal: 12, vertical: 6),
                    ],
                  ),
                ).addPadding(horizontal: 18, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
