import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Widgets/header_text.dart';
import 'package:lunarestate/Widgets/roundbutton.dart';
import 'package:lunarestate/Widgets/textBox.dart';

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
        20.height,
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
          buttonWidth: double.infinity,
          horizontalPadding: 15,
          onClick: () {
            // Navigator.push(context, route);
          },
          text: 'NEXT',
        ),
      ],
    );
  }
}
