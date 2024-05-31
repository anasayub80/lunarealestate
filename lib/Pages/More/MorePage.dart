import 'package:flutter/material.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import 'package:lunarestate/Pages/More/Pages/AboutUs.dart';
import 'package:lunarestate/Pages/More/Pages/TermsAndCondition.dart';
import 'package:lunarestate/Service/backend.dart';
import 'package:lunarestate/Widgets/global_appbar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: BgTwo(
        child: Column(
          children: [
            65.height,
            GlobalAppBar(),
            80.height,
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return AboutUsPage();
                  },
                ));
              },
              title: Text(
                'About Us',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: Icon(
                Icons.info_outline,
                color: AppThemes.primaryColor,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return TermsAndCondition();
                  },
                ));
              },
              title: Text(
                'Terms & Conditions',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: Icon(
                EvaIcons.fileTextOutline,
                color: AppThemes.primaryColor,
              ),
            ),
            ListTile(
              onTap: () {
                backend().launchInBrowser(Uri.parse(
                    'https://sites.google.com/view/lunaenterprises/home'));
              },
              title: Text(
                'Privacy Policy',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              leading: Icon(
                Icons.security,
                color: AppThemes.primaryColor,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                backend().launchInBrowser(
                    Uri.parse('https://lunaenterprises.info/'));
              },
              child: Text(
                'lunaenterprises.info',
                style: TextStyle(
                  color: Colors.amber,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}
