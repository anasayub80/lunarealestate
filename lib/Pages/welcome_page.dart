import 'package:flutter/material.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Login/login_page.dart';
import 'package:lunarestate/Widgets/custom_gradient_elevated_button.dart';
import 'package:page_transition/page_transition.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/welcomeBG.png"),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.9), // Adjust opacity as needed
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.9)
                  ],
                  stops: [0.0, 0.8],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'FIND A HOME OF YOUR DREAMS',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: 'Outfit',
                          height: 1.2,
                          fontWeight: FontWeight.w700,
                          fontSize: 41,
                          color: Color(0xffDAA34F),
                        ),
                  ),
                  Text(
                    'Find a place to live can be a difficult task, therefore we have done our best to simplify it',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                        fontSize: 20,
                        height: 1.2),
                  ),
                  40.height,
                  CustomGradientElevatedButton(
                    gradient: LinearGradient(
                        colors: [Color(0xffDAA34F), Color(0xffDAA34F)]),
                    height: 62,
                    width: double.infinity,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: LoginPage(),
                              isIos: true,
                              duration: Duration(milliseconds: 700),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontFamily: 'Outfit',
                              color: Colors.black,
                              fontSize: 20,
                            ),
                      ),
                    ),
                  ),
                  20.height,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
