import 'package:flutter/material.dart';

// ignore: must_be_immutable
class roundButton extends StatelessWidget {
  roundButton({required this.onClick, required this.text});
  var onClick;
  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 55.0),
      child: ElevatedButton(
        onPressed: onClick,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.white)),
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) return Colors.amber;
              return Colors.transparent; // Use the component's default.
            },
          ),
        ),
      ),
    );
  }
}
