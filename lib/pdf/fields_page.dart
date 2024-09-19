import 'dart:typed_data';

import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:http/http.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Widgets/roundbutton.dart';
import 'package:lunarestate/Widgets/textBox.dart';
import 'package:lunarestate/pdf/pdf_view.dart';
import 'package:signature/signature.dart';

TextEditingController nameController = TextEditingController();
TextEditingController addressController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();
TextEditingController emailAddressController = TextEditingController();

class FormFields extends StatefulWidget {
  FormFields({super.key});

  @override
  State<FormFields> createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {
  // final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 4,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  redo() {
    _controller.redo();
    setState(() {});
  }

  clear() {
    _controller.clear();
    setState(() {});
  }

  redoUndo() {
    _controller.pushCurrentStateToUndoStack();
    setState(() {});
  }

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    phoneNumberController.dispose();
    emailAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
              child: Text('Enter Details'),
            ),
            textBox(
              controller: nameController,
              hint: 'Name or Company Name',
              icon: Icons.person,
              validator: (validator) {
                return null;
              },
              Ktype: TextInputType.text,
            ).addPadding(overall: 12),
            SizedBox(
              height: 20,
            ),
            textBox(
              controller: addressController,
              hint: 'Address',
              icon: Icons.house_outlined,
              validator: (validator) {
                return null;
              },
              Ktype: TextInputType.text,
            ).addPadding(overall: 12),
            SizedBox(
              height: 20,
            ),
            textBox(
              controller: phoneNumberController,
              hint: 'Phone Number',
              icon: Icons.phone,
              validator: (validator) {
                return null;
              },
              Ktype: TextInputType.text,
            ).addPadding(overall: 12),
            textBox(
              controller: emailAddressController,
              hint: 'Email address',
              icon: Icons.phone,
              validator: (validator) {
                return null;
              },
              Ktype: TextInputType.text,
            ).addPadding(overall: 12),
            Container(
              color: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Signature(
                      controller: _controller,
                      width: 300,
                      height: 300,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            clear();
                          },
                          child: Icon(Icons.cancel),
                        ),
                        InkWell(
                          onTap: () {
                            _controller.undo();
                          },
                          child: Icon(Icons.undo),
                        ),
                        InkWell(
                          onTap: () {
                            _controller.redo();
                          },
                          child: Icon(Icons.redo),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            12.height,
            roundButton(
              onClick: () async {
                if (_controller.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please draw your signature, First'),
                    ),
                  );
                  return;
                }
                Uint8List? bytes = await _controller.toPngBytes();

                generatePdf(
                    nameController.text.trim(),
                    emailAddressController.text.trim(),
                    phoneNumberController.text.trim(),
                    addressController.text.trim(),
                    true,
                    '12-21-2024',
                    _controller.toRawSVG() ?? '');
              },
              text: "Submit Form",
            ),
          ],
        ),
      ),
    );
  }
}
