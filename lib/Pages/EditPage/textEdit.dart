import 'package:floading/floading.dart';
import 'package:flutter/material.dart';

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
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                opacity: 0.2,
                image: AssetImage(
                  'assets/images/tower.jpg',
                ),
                fit: BoxFit.cover,
              )),
          child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [CustomAppBar('Edit Property')];
              },
              body: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  textBox(
                      icon: Icons.edit,
                      emailController: _textEditingController,
                      Ktype: TextInputType.name,
                      hint: 'Enter ${widget.title}'),
                  SizedBox(
                    height: 25,
                  ),
                  roundButton(
                    onClick: (() async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (_textEditingController.text.trim().isEmpty) {
                        Utils().showSnackbar(
                            'Enter Details!', Colors.red, context);
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
                    text: 'UPDATE',
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              )),
        ),
      ),
    );
  }
}
