import 'package:flutter/material.dart';

class roundButton extends StatelessWidget {
  final VoidCallback onClick;
  final String text;

  roundButton({required this.onClick, required this.text});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 55.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFD3A45C), Color(0xFFDCA249)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(18.0),
        ),
        height: 40,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onClick,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              // primary: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              minimumSize: Size.fromWidth(size.width)),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff25272A),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
