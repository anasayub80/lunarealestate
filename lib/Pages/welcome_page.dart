import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Color(0xff1A1100),
        decoration: BoxDecoration(
          color: Color(0xff1A1100),
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xff1A1100)],
            begin: AlignmentDirectional.centerStart,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Opacity(
          opacity: 0.8,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/welcomeBG.png"),
                fit: BoxFit.fill,
              ),
              // color: Color(0xff1A1100),
            ),
          ),
        ),
      ),
    );
  }
}
