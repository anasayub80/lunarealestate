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
        image: DecorationImage(
            image: AssetImage('assets/images/bgOne.png'), fit: BoxFit.fill),
      ),
      child: child,
    );
  }
}
