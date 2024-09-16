import 'package:flutter/material.dart';
import 'package:lunarestate/Config/bc_ext.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import '../../../Admin/AppTheme.dart';
import 'bullet_points.dart';

class BenefitsWidget extends StatelessWidget {
  const BenefitsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Center(
            child: Text(
              'The Benefits of Selling To Luna Enterprises',
              style: TextStyle(
                color: AppThemes.whiteColor,
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
              ),
            ),
          ),
        ).addPadding(
          vertical: 4,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: 50,
            child: Divider(
              thickness: 1.8,
              color: AppThemes.secondarycolor,
            ),
          ),
        ).addPadding(
          left: 5,
          vertical: 0,
        ),
        // ? -x-x-x-x-x-x-x-x Card One -x-x-xx-x-x-x-x-x-x-x-x
        20.height,
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Commissions / Fees:",
              style: TextStyle(
                color: AppThemes.secondarycolor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            )),
        10.height,
        Container(
          width: context.screenWidth,
          // height: 65,
          decoration: BoxDecoration(
            color: Color(0xFF22252A),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 1,
              color: Color(0xFF494748),
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '6% on average is paid by you, the seller-No Commissions by  Luna Enterprises.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ).addPadding(horizontal: 20, vertical: 10),
          ),
        ),
        // ? -x-x-x-x-x-x-x-x Card One -x-x-xx-x-x-x-x-x-x-x-x

        25.height,
        // ? -x-x-x-x-x-x-x-x Card Two -x-x-xx-x-x-x-x-x-x-x-x
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Who Pays Closing Costs?",
              style: TextStyle(
                color: AppThemes.secondarycolor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            )),
        10.height,
        Container(
          width: context.screenWidth,
          decoration: BoxDecoration(
            color: Color(0xFF22252A),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 1,
              color: Color(0xFF494748),
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '2% on average is paid by you, the seller. We split close closing cost.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ).addPadding(horizontal: 20, vertical: 10),
          ),
        ),
        // ? -x-x-x-x-x-x-x-x Card Two -x-x-xx-x-x-x-x-x-x-x-x
        20.height,
        // ? -x-x-x-x-x-x-x-x Card Three -x-x-xx-x-x-x-x-x-x-x-x
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Other Benefits.",
              style: TextStyle(
                color: AppThemes.secondarycolor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            )),
        10.height,
        Container(
          decoration: BoxDecoration(
            color: Color(0xFF22252A),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 1,
              color: Color(0xFF494748),
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                10.height,
                BenefitsBulletPoints(title: "No showing."),
                BenefitsBulletPoints(title: "No out of pocket repair cost."),
                BenefitsBulletPoints(
                    title:
                        "No dealing with multiple inspectors hassling or nitpick your home."),
                BenefitsBulletPoints(title: "Fast quick and cash"),
                10.height,
              ],
            ),
          ),
        ),
        // ? -x-x-x-x-x-x-x-x Card Three -x-x-xx-x-x-x-x-x-x-x-x
        20.height,
      ],
    ).addPadding(horizontal: 25);
  }
}
