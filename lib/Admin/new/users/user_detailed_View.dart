import 'package:flutter/material.dart';
import 'package:lunarestate/Admin/widgets/app_bar_global.dart';
import 'package:lunarestate/Config/bc_ext.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import 'package:lunarestate/Widgets/customAppBar.dart';
import 'package:lunarestate/Widgets/header_text.dart';

class UserDetailedView extends StatelessWidget {
  const UserDetailedView({super.key});

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
            getHeader('User').addPadding(
              horizontal: 8,
              top: 12,
            ),
            20.height,
            CircleAvatar(
              radius: context.screenHeight * 0.1,
              backgroundImage: NetworkImage(
                'https://fastly.picsum.photos/id/48/5000/3333.jpg?hmac=y3_1VDNbhii0vM_FN6wxMlvK27vFefflbUSH06z98so',
              ),
            ),
            20.height,
            Text(
              'Georgie Wilkerson',
              style: TextStyle(
                color: Color(0xFFD3A45C),
                fontSize: 21,
              ),
            ),
            2.height,
            Text(
              '+12 333 4444 55',
              style: TextStyle(
                // color: Color(0xFFD3A45C),
                color: Colors.white,
                fontSize: 18,
              ),
            ).addPadding(vertical: 6),
            20.height,
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(41),
                color: Color(0xFF65C570),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone, color: Colors.white),
                  4.width,
                  Text(
                    'Call',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              width: context.screenWidth * 0.39,
              // color: Colors.green,
            ),
            18.height,
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(41),
                color: Color(0xFF4B4B4A),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email, color: Colors.white),
                  7.width,
                  Text(
                    'Email',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              width: context.screenWidth * 0.39,
              // color: Colors.green,
            ),
            18.height,
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(41),
                color: Color(0xFFFF3E3E),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.delete, color: Colors.white),
                  4.width,
                  Text(
                    'Delete',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              width: context.screenWidth * 0.39,
              // color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
