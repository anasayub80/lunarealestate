import 'package:flutter/material.dart';

class roundButton extends StatelessWidget {
  final VoidCallback onClick;
  final String text;
  final double horizontalPadding;
  final double buttonWidth;
  final double height;
  final Color? textColor;
  final double circleBorder;
  roundButton({
    required this.onClick,
    required this.text,
    this.horizontalPadding = 55,
    this.textColor,
    this.buttonWidth = double.infinity,
    this.height = 40,
    this.circleBorder = 12,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFD3A45C), Color(0xFFDCA249)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(circleBorder),
        ),
        height: height,
        width: buttonWidth,
        child: ElevatedButton(
          onPressed: onClick,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              // primary: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(circleBorder),
              ),
              minimumSize: Size.fromWidth(size.width)),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: textColor ?? Color(0xff25272A),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
