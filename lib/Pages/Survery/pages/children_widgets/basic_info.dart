import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Survery/pages/children_widgets/property_info.dart';
import 'package:lunarestate/Pages/Survery/pages/sell_house.dart';
import 'package:lunarestate/Widgets/header_text.dart';
import 'package:lunarestate/Widgets/roundbutton.dart';
import 'package:lunarestate/Widgets/textBox.dart';
import 'package:page_transition/page_transition.dart';

class BasicInfo extends StatelessWidget {
  BasicInfo({super.key});
  final TextEditingController nameOfOwner = TextEditingController();
  final TextEditingController contact = TextEditingController();
  final TextEditingController title = TextEditingController();
  final TextEditingController address1 = TextEditingController();
  final TextEditingController address2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getHeader(
          'Basic Info',
        ),
        20.height,
        textBox(
          emailController: nameOfOwner,
          hint: 'Name of owner',
          icon: SvgPicture.asset(
            'assets/icons/person_icon.svg',
          ),
          isSvg: true,
          Ktype: TextInputType.name,
        ).addPadding(
          horizontal: 10,
        ),
        20.height,
        textBox(
          emailController: contact,
          hint: 'Best Number to contact you?',
          icon: SvgPicture.asset(
            'assets/icons/phone_icon.svg',
          ),
          isSvg: true,
          Ktype: TextInputType.number,
        ).addPadding(
          horizontal: 10,
        ),
        20.height,
        textBox(
          emailController: title,
          hint: 'Property Title',
          icon: SvgPicture.asset(
            'assets/icons/title_icon.svg',
          ),
          isSvg: true,
          Ktype: TextInputType.text,
        ).addPadding(
          horizontal: 10,
        ),
        20.height,
        textBox(
          emailController: address1,
          hint: 'Address here 1',
          icon: SvgPicture.asset(
            'assets/icons/location.svg',
          ),
          isSvg: true,
          Ktype: TextInputType.text,
        ).addPadding(
          horizontal: 10,
        ),
        20.height,
        textBox(
          emailController: address2,
          hint: 'Address here 2',
          icon: SvgPicture.asset(
            'assets/icons/location.svg',
          ),
          isSvg: true,
          Ktype: TextInputType.text,
        ).addPadding(
          horizontal: 10,
        ),
        40.height,
        roundButton(
          buttonWidth: double.infinity,
          horizontalPadding: 15,
          onClick: () {
            // Navigator.push(context, MaterialPageRoute(
            //   builder: (context) {
            //     return SellHousePage(
            //       child: PropertyInfo(),
            //     );
            //   },
            // ));
            Navigator.push(
                context,
                PageTransition(
                  isIos: true,
                  duration: Duration(milliseconds: 700),
                  child: SellHousePage(
                    child: PropertyInfo(),
                  ),
                  type: PageTransitionType.fade,
                ));
          },
          text: 'NEXT',
        ),
      ],
    );
  }
}
