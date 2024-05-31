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
                          '6% on average is paid by you, the seller - No Commissions by Luna Enterprises',
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
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: AutoSizeText(
                          'WHO PAYS CLOSING COSTS?:',
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
                          '2% on average is paid by you, the seller. We split close closing cost',
                          maxLines: 3,
                          presetFontSizes: [14, 12, 10],
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
                          '$bullet No showing \n$bullet No out of pocket repair cost. \n$bullet No dealing with multiple inspectors hassling or nitpick your home \n$bullet Fast quick and cash.',
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
