import 'package:flutter/material.dart';
import 'package:lunarestate/Config/spacing_ext.dart';

import '../../../Admin/AppTheme.dart';

class BenefitsBulletPoints extends StatelessWidget {
  final String title;
  const BenefitsBulletPoints({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 12,
        ),
        CircleAvatar(
          radius: 2,
          backgroundColor: AppThemes.secondarycolor,
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Text(
            title,
            softWrap: true,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ],
    ).addPadding(horizontal: 8, vertical: 5);
  }
}
