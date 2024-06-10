import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Survery/pages/children_widgets/upload_photos.dart';
import 'package:lunarestate/Pages/Survery/pages/sell_house.dart';
import 'package:lunarestate/Widgets/header_text.dart';
import 'package:lunarestate/Widgets/roundbutton.dart';
import 'package:lunarestate/Widgets/textBox.dart';
import 'package:page_transition/page_transition.dart';

class PropertyInfo extends StatelessWidget {
  PropertyInfo({super.key});
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
          'Property Info',
        ),
        45.height,
        textBox(
          emailController: nameOfOwner,
          hint: 'Lot Size',
          icon: SvgPicture.asset(
            'assets/icons/lot_size_icon.svg',
          ),
          isSvg: true,
          Ktype: TextInputType.number,
        ).addPadding(
          horizontal: 10,
        ),
        20.height,
        textBox(
          emailController: contact,
          hint: 'How many bedrooms?',
          icon: SvgPicture.asset(
            'assets/icons/bedroom_icon.svg',
          ),
          isSvg: true,
          Ktype: TextInputType.number,
        ).addPadding(
          horizontal: 10,
        ),
        20.height,
        textBox(
          emailController: title,
          hint: 'How may bathrooms?',
          icon: SvgPicture.asset(
            'assets/icons/bathroom_icon.svg',
          ),
          isSvg: true,
          Ktype: TextInputType.number,
        ).addPadding(
          horizontal: 10,
        ),
        20.height,
        textBox(
          emailController: address1,
          hint: 'How many stories?',
          icon: SvgPicture.asset(
            'assets/icons/stories_icon.svg',
          ),
          isSvg: true,
          Ktype: TextInputType.number,
        ).addPadding(
          horizontal: 10,
        ),
        20.height,
        textBox(
          emailController: address2,
          hint: 'How many stories?',
          icon: SvgPicture.asset(
            'assets/icons/ft_icon.svg',
          ),
          isSvg: true,
          Ktype: TextInputType.number,
        ).addPadding(
          horizontal: 10,
        ),
        40.height,
        roundButton(
          horizontalPadding: 15,
          buttonWidth: double.infinity,
          height: 55,
          circleBorder: 30,
          onClick: () {
            Navigator.push(
                context,
                PageTransition(
                  isIos: true,
                  duration: Duration(milliseconds: 700),
                  child: SellHousePage(
                    child: UploadPhotos(),
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
