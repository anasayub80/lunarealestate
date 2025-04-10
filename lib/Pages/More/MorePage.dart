import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Config/bc_ext.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import 'package:lunarestate/Pages/More/Pages/AboutUs.dart';
import 'package:lunarestate/Pages/More/Pages/TermsAndCondition.dart';
import 'package:lunarestate/Pages/ProfilePage/ProfilePage.dart';
import 'package:lunarestate/Pages/Splash/SplashPage.dart';
import 'package:lunarestate/Service/UserData.dart';
import 'package:lunarestate/Service/backend.dart';
import 'package:lunarestate/Widgets/custom_gradient_elevated_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<bool> clear() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      return preferences.clear();
    }

    return Scaffold(
      body: BgTwo(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              20.height,
              SafeArea(
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        context.popFromScreen();
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 12,
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    20.width,
                    Text(
                      'Setting & Info',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'Outfit'),
                    ),
                  ],
                ),
              ),
              40.height,
              Row(
                children: [
                  Hero(
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
                  20.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        Provider.of<UserData>(context, listen: true)
                            .name
                            .toString(),
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'Outfit'),
                      ),
                      Text(
                        Provider.of<UserData>(context, listen: true)
                            .email
                            .toString(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontFamily: 'Outfit'),
                      )
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
                    child: SvgPicture.asset(
                      'assets/icons/edit_pencil.svg',
                      height: 25,
                    ),
                  ),
                  10.width,
                ],
              ),
              40.height,
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
                    fontSize: 18,
                    fontFamily: 'Outfit',
                    color: Colors.white,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: AppThemes.secondarycolor,
                  size: 17,
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
                    fontSize: 18,
                    fontFamily: 'Outfit',
                    color: Colors.white,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: AppThemes.secondarycolor,
                  size: 17,
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
                    fontSize: 18,
                    fontFamily: 'Outfit',
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  'Review our privacy policy.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Outfit',
                    color: Colors.white,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: AppThemes.secondarycolor,
                  size: 17,
                ),
              ),

              // GestureDetector(
              //   onTap: () {
              //     backend().launchInBrowser(
              //         Uri.parse('https://lunaenterprises.info/'));
              //   },
              //   child: Text(
              //     'lunaenterprises.info',
              //     style: TextStyle(
              //       color: Colors.amber,
              //       decoration: TextDecoration.underline,
              //     ),
              //   ),
              // ),
              Spacer(),
              CustomGradientElevatedButton(
                  height: 55,
                  width: double.infinity,
                  gradient: LinearGradient(
                      colors: [Color(0xffFF4346), Color(0xffFF4346)]),
                  onPressed: () async {
                    var res = await clear();
                    if (res) {
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return SplashPage();
                        },
                      ));
                    }
                  },
                  child: Center(
                    child: Text(
                      'Logout',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'Outfit'),
                    ),
                  )),
              80.height,
            ],
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
