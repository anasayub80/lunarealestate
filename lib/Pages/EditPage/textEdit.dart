import 'package:floading/floading.dart';
import 'package:flutter/material.dart';
import 'package:lunarestate/Config/bc_ext.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Background/bg_one.dart';
import 'package:lunarestate/Widgets/global_appbar.dart';
import 'package:lunarestate/Widgets/header_text.dart';

import '../../Service/backend.dart';
import '../../Widgets/Utils.dart';
import '../../Widgets/customAppBar.dart';
import '../../Widgets/roundbutton.dart';
import '../../Widgets/textBox.dart';

// ignore: must_be_immutable
class TextEditPage extends StatefulWidget {
  String val;
  String column;
  String formid;
  String title;
  TextEditPage({
    super.key,
    required this.val,
    required this.column,
    required this.formid,
    required this.title,
  });

  @override
  State<TextEditPage> createState() => _TextEditPageState();
}

class _TextEditPageState extends State<TextEditPage> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _textEditingController.text = widget.val == '--' ? '' : widget.val;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: BgTwo(
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CustomAppBarWithCircleback().addPadding(overall: 8),
            4.height,
            GlobalAppBar().addPadding(overall: 8),
            getHeader('Edit Property').addPadding(overall: 8),
            SizedBox(
              height: 40,
            ),
            textBox(
                    icon: Icons.edit,
                    controller: _textEditingController,
                    Ktype: TextInputType.name,
                    validator: (p0) {
                      return null;
                    },
                    hint: 'Enter ${widget.title}')
                .center()
                .addPadding(horizontal: 12, vertical: 8),

            40.height,
            roundButton(
              buttonWidth: context.screenWidth,
              onClick: (() async {
                FocusManager.instance.primaryFocus?.unfocus();
                if (_textEditingController.text.trim().isEmpty) {
                  Utils().showSnackbar('Enter Details!', Colors.red, context);
                } else {
                  FLoading.show(
                    context,
                    loading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/icon.png",
                          width: 200,
                          height: 200,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        CircularProgressIndicator()
                      ],
                    ),
                    closable: false,
                    color: Colors.black.withOpacity(0.7),
                  );
                  var res = await backend().update({
                    'value': _textEditingController.text,
                    'column': widget.column,
                    'table': 'house_details',
                    'id': widget.formid,
                  });

                  if (res['status'] == 'success') {
                    debugPrint('success');
                    FLoading.hide();
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context, 'success');
                  } else {
                    FLoading.hide();
                    debugPrint('fail');
                    // ignore: use_build_context_synchronously
                    Utils().showSnackbar(res['msg'], Colors.red, context);
                  }
                }
              }),
              text: 'Update',
            ).center().addPadding(bottom: 21),
            // Spacer(),
          ],
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.s,
        )),
      ),
    );
  }
}
