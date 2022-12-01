import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 50.0; // change this for different heights

  const CustomAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black.withOpacity(0.4),
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.amber,
          fontSize: 24.0,
          fontFamily: 'Satisfy',
          fontWeight: FontWeight.bold,
        ),
      ),
      pinned: true,
      floating: true,
    );
  }
}

class CustomAppBarwithBackButton extends StatelessWidget {
  final String title;
  final double barHeight = 60.0; // change this for different heights

  const CustomAppBarwithBackButton(this.title);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black.withOpacity(0.4),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.keyboard_arrow_left),
        color: Colors.amber,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.amber,
          fontSize: 24.0,
          fontFamily: 'Satisfy',
          fontWeight: FontWeight.bold,
        ),
      ),
      pinned: true,
      floating: true,
    );
  }
}
