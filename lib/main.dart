import 'dart:async';
import 'dart:io';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:lunarestate/Config/config.dart';
import 'package:lunarestate/Pages/Gallery/GalleryPage.dart';
import 'package:lunarestate/Pages/SellHistory/SellHistory.dart';
import 'package:lunarestate/Pages/Survery/SurvProvider.dart';
import 'package:lunarestate/Pages/Survery/SurveryPage.dart';
import 'package:lunarestate/Service/UserData.dart';
import 'Pages/HomePage/HomePage.dart';
import 'Pages/More/MorePage.dart';
import 'Pages/Splash/SplashPage.dart';
import 'l10n/l10n.dart';
import 'provider/languageProvider.dart';

// SKU FOR APPSTORE DOTCLICK-LUNA-SKU
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(locale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => UserData(),
          ),
          ChangeNotifierProvider(
            create: (_) => SurvProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => SurvProvider(),
          ),
          ChangeNotifierProvider<SingleNotifier>(
              create: (_) => SingleNotifier()),
        ],
        child: MaterialApp(
          title: 'Luna Estate',
          locale: _locale,
          debugShowCheckedModeBanner: false,
          builder: BotToastInit(), //1. call BotToastInit
          navigatorObservers: [BotToastNavigatorObserver()],
          supportedLocales: L10n.all,
          localizationsDelegates: [
            // AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          theme: ThemeData(
            fontFamily: 'Aspekta',
            appBarTheme: AppBarTheme(
                backgroundColor: mainColor,
                foregroundColor: Colors.white //here you can give the text color
                ),
            primarySwatch: Colors.amber,
          ),
          home: SplashPage(),
        ),
      );
    });
  }
}

class MyNavigation extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyNavigationState createState() => _MyNavigationState();
}

class _MyNavigationState extends State<MyNavigation> {
  late PageController _pageController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    exitFullScreen();
    _pageController = PageController(initialPage: selectedIndex);
  }

  void exitFullScreen() async {
    // await FullScreen.exitFullScreen();
  }

  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      BotToast.showText(text: 'Tap Again to leave');
      return Future.value(false);
    }
    exit(0);
  }

  List<Widget> children = <Widget>[
    MyHomePage(),
    SellHistoryPage(from: 'nav'),
    GalleryPage(),
    MorePage(),
  ];
  final iconList = <IconData>[
    EvaIcons.home,
    Icons.history,
    EvaIcons.gift,
    Icons.more,
  ];
  void onButtonPressed(int index) {
    print("${index.toString()} my index***");
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
  }

  void pageChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      selectedIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // onWillPop: onWillPop,
      onPopInvoked: (didPop) {
        DateTime now = DateTime.now();
        if (currentBackPressTime == null ||
            now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
          currentBackPressTime = now;
          BotToast.showText(text: 'Tap Again to leave');
          // return Future.value(false);
        }
        exit(0);
      },
      child: Scaffold(
        backgroundColor: Color(0xff141414),
        // body: children.elementAt(_bottomNavIndex),
        body: PageView(
          // physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: children,
          onPageChanged: (index) {
            pageChanged(index);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    child: SuerveyPage(),
                    type: PageTransitionType.bottomToTop));
          },
          child: Icon(
            Icons.sell_outlined,
            color: Colors.white,
          ),
          backgroundColor: mainColor,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          splashColor: Colors.white,
          backgroundColor: mainColor,
          inactiveColor: Colors.white38,
          activeColor: Colors.white,
          height: 65.0,
          icons: iconList,
          activeIndex: selectedIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.defaultEdge,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          onTap: (i) {
            bottomTapped(i);
          },
        ),
      ),
    );
  }
}
