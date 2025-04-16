// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lunarestate/Admin/new/home_page.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import 'package:lunarestate/Pages/HomePage/HomePage.dart';
import 'package:lunarestate/Pages/Login/login_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../../Service/UserData.dart';
import 'dart:io' show Platform;

class SplashPage extends StatefulWidget {
  final bool? isFromLogin;
  const SplashPage({super.key, this.isFromLogin = false});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    Future.delayed(const Duration(seconds: 1), () {
      _controller.forward();
    });
    checkLogin();
  }

  @override
  void dispose() {
    timer?.cancel();
    _controller.dispose();
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
    var email = prefs.getString('email');
    bool isLogin = prefs.getBool('isLogin') ?? false;
    debugPrint("get saved Email ${email}");
    if (isLogin || widget.isFromLogin!) {
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
                    child: MyHomePage(),
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
                  // AnimatedOpacity(
                  //   opacity: _visible ? 1.0 : 0.0,
                  //   duration: const Duration(milliseconds: 500),
                  //   child: Container(
                  //     child: Image.asset(
                  //       'assets/icons/logo.png',
                  //       fit: BoxFit.fill,
                  //     ),
                  //     width: size.width * 0.50,
                  //     height: 175,
                  //   ),
                  // ),
                  ScaleTransition(
                    scale: _animation,
                    child: Image.asset(
                      "assets/icons/logo.png",
                      width: 200,
                      height: 200,
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
                'Property Investors',
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
