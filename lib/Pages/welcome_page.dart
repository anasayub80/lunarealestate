import 'package:flutter/material.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Login/login_page.dart';
import 'package:lunarestate/Widgets/custom_gradient_elevated_button.dart';
import 'package:page_transition/page_transition.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
            ScaleTransition(
              scale: _animation,
              child: Image.asset(
                "assets/icons/logo.png",
                width: 200,
                height: 200,
              ),
            ),
            120.height,
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
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: Column(
                        children: [
                          Text(
                            'Where Deals Get Done',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontFamily: 'Outfit',
                                      height: 1.2,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 41,
                                      color: Color(0xffDAA34F),
                                    ),
                          ),
                          Text(
                            'Find out what we can do for you. Partner with Luna.',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                    fontSize: 20,
                                    height: 1.2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  60.height,
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
