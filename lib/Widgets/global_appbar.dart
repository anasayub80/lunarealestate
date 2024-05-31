import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Config/spacing_ext.dart';

class GlobalAppBar extends StatelessWidget {
  const GlobalAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 75,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FittedBox(
                child: CircleAvatar(
                  radius: 41,
                  backgroundColor: Color(0xFF3E434E),
                  child: SvgPicture.asset(
                    'assets/icons/menu.svg',
                    height: 14,
                    width: 14,
                    fit: BoxFit.fill,
                  ),
                ).addPadding(
                  horizontal: 12,
                ),
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nur Pit',
                      style: TextStyle(
                          color: AppThemes.whiteColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          wordSpacing: 3.1),
                    ),
                    // 4.height,
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppThemes.secondarycolor,
                          size: 20,
                        ),
                        4.width,
                        Text(
                          'California, USA',
                          style: TextStyle(
                            color: AppThemes.whiteColor,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          CircleAvatar(
            radius: 41,
            backgroundImage: NetworkImage('https://picsum.photos/200/300'),
          ),
        ],
      ).addPadding(
        horizontal: 6,
        top: 12,
      ),
    );
  }
}
