import 'package:flutter/material.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Config/bc_ext.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Survery/pages/sell_house.dart';
import 'package:lunarestate/Widgets/custom_gradient_elevated_button.dart';
import 'package:page_transition/page_transition.dart';

void showSellBottomSheet(context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 5,
                    width: 77,
                    decoration: BoxDecoration(
                        color: Color(0xff353028),
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                40.height,
                Text(
                  'The Benefits of Selling To Luna Enterprises',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20, fontFamily: 'Outfit'),
                ),
                20.height,
                InfoContainer(
                  title: 'Commissions / Fees:',
                  subtitle:
                      '6% on average is paid by you, the seller-No Commissions by  Luna Enterprises.',
                ),
                15.height,
                InfoContainer(
                  title: 'Who Pays Closing Costs?',
                  subtitle:
                      '2% on average is paid by you, the seller. We split close closing cost.',
                ),
                15.height,
                OtherBenifits(
                  title: 'Other Benefits.',
                ),
                20.height,
                CustomGradientElevatedButton(
                    height: 62,
                    width: double.infinity,
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          PageTransition(
                            isIos: true,
                            duration: Duration(milliseconds: 700),
                            child: InitializedSellHouse(),
                            type: PageTransitionType.fade,
                          ));
                    },
                    child: Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            color: Color(0xff222326),
                            fontSize: 20,
                            fontFamily: 'Outfit'),
                      ),
                    ))
              ],
            ),
          ),
        ),
        width: double.infinity,
        height: context.screenHeight * 0.8,
        decoration: BoxDecoration(
            color: Color(0xff3C4045),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      );
    },
  );
}

class InfoContainer extends StatelessWidget {
  const InfoContainer({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: AppThemes.secondarycolor,
                  fontSize: 18,
                  fontFamily: 'Outfit'),
            ),
            5.height,
            Text(
              subtitle,
              style: TextStyle(
                  color: Colors.white, fontSize: 18, fontFamily: 'Outfit'),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xff383B40),
      ),
    );
  }
}

class OtherBenifits extends StatelessWidget {
  OtherBenifits({super.key, required this.title});

  final String title;

  final List<String> bulletPoints = [
    'No Showing',
    'No out of pocket repair cost.',
    'No dealing with multiple inspectors hassling or nitpick your home.',
    'Fast quick and cash.',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xff383B40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppThemes.secondarycolor,
                fontSize: 18,
                fontFamily: 'Outfit',
              ),
            ),
            10.height,
            Column(
              children: bulletPoints.map((point) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: AppThemes.secondarycolor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      12.width,
                      Expanded(
                        child: Text(
                          point,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Outfit',
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
