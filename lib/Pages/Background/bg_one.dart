import 'package:flutter/material.dart';

class BgOne extends StatelessWidget {
  const BgOne({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff3d4146), Color(0xff232426)],
          begin: AlignmentDirectional.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}

class SplashBg extends StatelessWidget {
  const SplashBg({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/bgOne.png'), fit: BoxFit.fill),
      ),
      child: child,
    );
  }
}

class BgTwo extends StatelessWidget {
  const BgTwo({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff3d4146), Color(0xff232426)],
          begin: AlignmentDirectional.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}
