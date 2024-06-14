import 'dart:async';
import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Pages/Survery/pages/sell_house.dart';
import 'package:lunarestate/Pages/Survery/pages/sell_house_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:lunarestate/Config/config.dart';
import 'package:lunarestate/Pages/Gallery/GalleryPage.dart';
import 'package:lunarestate/Pages/SellHistory/SellHistory.dart';
import 'package:lunarestate/Pages/Survery/SurvProvider.dart';
import 'package:lunarestate/Service/UserData.dart';
import 'package:ultimate_bottom_navbar/ultimate_bottom_navbar.dart';
import 'Pages/HomePage/HomePage.dart';
import 'Pages/More/MorePage.dart';
import 'Pages/Splash/SplashPage.dart';
import 'l10n/l10n.dart';
import 'provider/languageProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          ChangeNotifierProvider<SellHouseProvider>(
            create: (_) => SellHouseProvider(),
          ),
        ],
        child: MaterialApp(
          title: 'Luna Estate',
          locale: _locale,
          debugShowCheckedModeBanner: false,
          builder: BotToastInit(), //1. call BotToastInit
          navigatorObservers: [BotToastNavigatorObserver()],
          supportedLocales: L10n.all,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          theme: ThemeData(
            // cupertinoOverrideTheme: TextSelectionTheme(data: data, child: child),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: AppThemes.primaryColor,
              selectionColor: AppThemes.primaryColor.withOpacity(.1),
              selectionHandleColor: AppThemes.primaryColor,
            ),

            cupertinoOverrideTheme: CupertinoThemeData(
              primaryColor: AppThemes.primaryColor,
            ),
            checkboxTheme: CheckboxThemeData(
              // checkColor: Colors.white,
              // fillColor: WidgetStateColor.resolveWith((s) {
              //   // if(MaterialState.)
              // }),
              fillColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return mainColor;
                }
                return null;
              }),
            ),
            progressIndicatorTheme:
                ProgressIndicatorThemeData(color: mainColor),
            fontFamily: 'Aspekta',
            appBarTheme: AppBarTheme(
                backgroundColor: mainColor,
                foregroundColor: Colors.white //here you can give the text color
                ),
            primarySwatch: Colors.amber,
          ),
          home: SplashPage(),
          // home: LoginPage(),
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
    GalleryPage(
      from: 'nav',
    ),
    MorePage(),
  ];
  final iconList = <IconData>[
    EvaIcons.home,
    Icons.history,
    EvaIcons.gift,
    Icons.more,
  ];
  final titles = <String>[
    "",
    "",
    "",
    "",
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
        // body: children.elementAt(_bottomNavIndex
        // b),

        body: PageView(
          // physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: children,
          onPageChanged: (index) {
            pageChanged(index);
          },
        ),
        extendBody: true,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    child: InitializedSellHouse(),
                    type: PageTransitionType.bottomToTop));
          },
          child: Icon(
            Icons.sell_outlined,
            color: Colors.white,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
          backgroundColor: AppThemes.primaryColor,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: UltimateBottomNavBar(
          backgroundColor: Color(0xff393B44),
          midCircleBorderRadiusStatic: 30,
          underCurve: true,
          showMidCircleStatic: true,
          foregroundColor: AppThemes.primaryColor,
          unselectedIconColor: Colors.white,
          currentIndex: selectedIndex,
          selectedIconColor: AppThemes.primaryColor,
          titles: titles,
          icons: iconList,
          onTap: (i) {
            bottomTapped(i);
          },
        ),
      ),
    );
  }
}
