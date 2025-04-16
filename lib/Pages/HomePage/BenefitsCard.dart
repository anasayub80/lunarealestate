import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Config/config.dart';

class BenefitCard extends StatelessWidget {
  const BenefitCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: AutoSizeText(
                    'Diversified investment firm in all asset class types. - House, lots, land, multi-family, commercial, etc.',
                    maxLines: 4,
                    presetFontSizes: [13, 12, 10],
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: AutoSizeText(
                          'COMMISSIONS / FEES:',
                          maxLines: 3,
                          minFontSize: 8,
                          presetFontSizes: [14, 12, 10],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    VerticalDivider(
                      color: AppThemes.primaryColor,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                      width: 10,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: AutoSizeText(
                          'Paid fees for you to net max capital covered by us.',
                          maxLines: 4,
                          presetFontSizes: [13, 12, 10],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
              ),
              Divider(
                color: AppThemes.primaryColor,
              ),
              Divider(
                color: AppThemes.primaryColor,
              ),
              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: AutoSizeText(
                          'OTHER BENEFITS:',
                          maxLines: 3,
                          minFontSize: 8,
                          presetFontSizes: [14, 12, 10],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: VerticalDivider(
                        color: AppThemes.primaryColor,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        width: 10,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: AutoSizeText(
                          '$bullet Multi-level exit strategies. \n$bullet We offer what\'s best for the situation given any circumstances. \n$bullet Investment groups at the tap of your fingertips with no commitments. \n$bullet Free muli point evaluation with your property. \n$bullet Pay outs range 5 - 30 days depending on deal to deal basis.\n$bullet Multi million dollar investment funds at hand.',
                          maxLines: 7,
                          presetFontSizes: [14, 12, 10],
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          width: size.width * 0.90,
          height: 320,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(2, 2), // changes position of shadow
                ),
              ],
              color: Color.fromARGB(255, 69, 64, 64),
              borderRadius: BorderRadius.circular(15.0))),
      color: Color.fromARGB(255, 69, 64, 64),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}
