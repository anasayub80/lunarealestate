// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lunarestate/Admin/new/home_page.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import 'package:lunarestate/Pages/Login/login_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:fullscreen/fullscreen.dart';
import 'package:provider/provider.dart';
import '../../Service/UserData.dart';
import '../../main.dart';
import 'dart:io' show Platform;

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    checkLogin();
    // Future.delayed(Duration.zero, () {
    //   Navigator.pushReplacement(
    //     context,
    //     PageTransition(
    //       type: PageTransitionType.bottomToTop,
    //       child: LoginPage(),
    //       isIos: true,
    //       duration: Duration(milliseconds: 800),
    //     ),
    //   );
    // });
    // runAnimate();
    // enterFullScreen();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  runAnimate() {
    if (Platform.isAndroid || Platform.isIOS) {
      timer = Timer.periodic(
        Duration(milliseconds: 700),
        (timer) {
          setState(() {
            _visible = !_visible;
          });
        },
      );
    }
  }

  Timer? timer;
  bool _visible = true;

  enterFullScreen() async {
    // await FullScreen.enterFullScreen(FullScreenMode.EMERSIVE_STICKY);
  }

  checkLogin() async {
    debugPrint("checkLogin Email");

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var displayName = prefs.getString('email');
    debugPrint("get saved Email ${displayName}");
    if (displayName != null) {
      Provider.of<UserData>(context, listen: false).initUserData();

      Future.delayed(
        Duration(seconds: 4),
        () {
          debugPrint(
              'Role is ${Provider.of<UserData>(context, listen: false).role}');
          if (Provider.of<UserData>(context, listen: false).role.toString() ==
              'admin') {
            Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.pushReplacement(
                context,
                PageTransition(
                    child: HomePageAdmin(),
                    isIos: true,
                    duration: Duration(milliseconds: 700),
                    type: PageTransitionType.bottomToTop));
          } else {
            Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.pushReplacement(
                context,
                PageTransition(
                    child: MyNavigation(),
                    isIos: true,
                    duration: Duration(milliseconds: 700),
                    type: PageTransitionType.bottomToTop));
          }
        },
      );
    } else {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.bottomToTop,
          child: LoginPage(),
          isIos: true,
          duration: Duration(milliseconds: 800),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BgOne(
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: Column(
                children: [
                  AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      child: Image.asset(
                        'assets/icons/icon.png',
                        fit: BoxFit.fill,
                      ),
                      width: size.width * 0.50,
                      height: 85,
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                'We Buy Houses',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}
