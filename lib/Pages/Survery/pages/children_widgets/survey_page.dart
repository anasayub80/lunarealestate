import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Widgets/header_text.dart';
import 'package:sizer/sizer.dart';

class SurveryWidget extends StatelessWidget {
  const SurveryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getHeader(
          'Survey',
        ),
        45.height,
        Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF22252A),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 1,
              color: Color(0xFF494748),
            ),
          ),
          child: Row(
            children: [
              12.width,
              Expanded(
                child: Text(
                  '1. Existing Morgage',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              12.width,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (s) {},
                  ),
                  Text(
                    'Yes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (s) {},
                  ),
                  Text(
                    'No',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              12.width,
            ],
          ),
        ).addPadding(
          overall: 8,
        ),
      ],
    );
  }
}
