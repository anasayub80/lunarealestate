import 'package:flutter/material.dart';
import 'package:lunarestate/Config/bc_ext.dart';
import 'package:lunarestate/Config/spacing_ext.dart';

import '../Admin/AppTheme.dart';

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

class CustomAppBarWithCircleback extends StatelessWidget {
  const CustomAppBarWithCircleback({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        50.height,
        Align(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  context.popFromScreen();
                },
                child: CircleAvatar(
                  backgroundColor: AppThemes.primaryColor,
                  radius: 16,
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                "Back",
                style: TextStyle(
                  color: Colors.white,
                ),
              ).addPadding(left: 10)
            ],
          ).addPadding(left: 10),
        ),
      ],
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
