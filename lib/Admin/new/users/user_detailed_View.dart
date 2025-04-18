import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:floading/floading.dart';
import 'package:flutter/material.dart';
import 'package:lunarestate/Config/bc_ext.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import 'package:lunarestate/Widgets/customAppBar.dart';
import 'package:lunarestate/Widgets/header_text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Service/backend.dart';
import '../../../Widgets/global_appbar.dart';

class UserDetailedView extends StatelessWidget {
  UserDetailedView({
    super.key,
    required this.profile,
    required this.phone,
    required this.id,
    required this.email,
    required this.name,
  });
  final String profile, name, id, phone, email;
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgTwo(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            10.height,
            CustomAppBarWithCircleback().addPadding(left: 12),
            15.height,
            GlobalAppBar().addPadding(horizontal: 12),
            10.height,
            getHeader('User').addPadding(
              horizontal: 8,
              top: 12,
            ),
            20.height,
            CircleAvatar(
              radius: context.screenHeight * 0.1,
              backgroundImage: NetworkImage(
                profile,
              ),
            ),
            20.height,
            Text(
              name,
              style: TextStyle(
                color: Color(0xFFD3A45C),
                fontSize: 21,
              ),
            ),
            2.height,
            Text(
              phone,
              style: TextStyle(
                // color: Color(0xFFD3A45C),
                color: Colors.white,
                fontSize: 18,
              ),
            ).addPadding(vertical: 6),
            20.height,
            InkWell(
              onTap: () {
                _makePhoneCall(phone);
              },
              child: Container(
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
            ),
            // 18.height,
            // Container(
            //   height: 50,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(41),
            //     color: Color(0xFF4B4B4A),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Icon(Icons.email, color: Colors.white),
            //       7.width,
            //       Text(
            //         'Email',
            //         style: TextStyle(color: Colors.white),
            //       ),
            //     ],
            //   ),
            //   width: context.screenWidth * 0.39,
            //   // color: Colors.green,
            // ),
            18.height,
            InkWell(
              onTap: () {
                AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    headerAnimationLoop: false,
                    animType: AnimType.topSlide,
                    title: 'Delete User',
                    desc: 'do you want to delete this user?',
                    btnCancelOnPress: () {},
                    onDismissCallback: (type) {
                      debugPrint('Dialog Dismiss from callback $type');
                    },
                    btnOkText: 'Yes',
                    btnOkOnPress: () async {
                      FLoading.show(
                        context,
                        loading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icons/logo.png",
                              width: 200,
                              height: 200,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            CircularProgressIndicator()
                          ],
                        ),
                        closable: true,
                        color: Colors.black.withOpacity(0.7),
                      );
                      var res = await Backend()
                          .delete({'table': 'users', 'id': id, 'column': 'id'});

                      if (res['status'] == 'success') {
                        FLoading.hide();
                        context.popFromScreen();
                      }
                    }).show();
              },
              child: Container(
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
            ),
          ],
        ),
      ),
    );
  }
}
