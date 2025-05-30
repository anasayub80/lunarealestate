import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Models/SurveyModelMore.dart';
import 'package:lunarestate/Pages/Survery/surveyData.dart';
import 'package:lunarestate/Widgets/roundbutton.dart';
import 'package:lunarestate/Widgets/textBox.dart';
import 'package:lunarestate/pdf/pdf_view.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';
import '../../../../Service/UserData.dart';
import '../../SurvProvider.dart';

class AgreementInfo extends StatefulWidget {
  AgreementInfo({super.key});

  @override
  State<AgreementInfo> createState() => _AgreementInfoState();
}

class _AgreementInfoState extends State<AgreementInfo> {
  bool isClarify = false;
  @override
  void initState() {
    super.initState();
  }

  File? pdfAggre;

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
    // nameController.dispose();
    // addressController.dispose();
    // phoneNumberController.dispose();
    // emailAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<SurvProvider>(context, listen: false);
    return Form(
      key: basicInfoFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Agreement Info',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'Outfit')),
          45.height,
          textBox(
            controller: agreementNameController,
            hint: 'Name',
            icon: null,
            validator: (email) {
              if (agreementNameController.text.isNotEmpty)
                return null;
              else
                return 'Enter Owner Name';
            },
            isSvg: true,
            Ktype: TextInputType.emailAddress,
          ).addPadding(
            horizontal: 10,
          ),
          20.height,
          textBox(
            controller: agreementphoneController,
            Ktype: TextInputType.number,
            validator: (phone) {
              if (agreementphoneController.text.isNotEmpty)
                return null;
              else
                return 'Enter Owner Number';
            },
            hint: 'Your Mobile Number',
            icon: null,
            isSvg: true,
          ).addPadding(
            horizontal: 10,
          ),
          20.height,
          textBox(
            controller: agreementemailController,
            Ktype: TextInputType.emailAddress,
            validator: (phone) {
              if (agreementemailController.text.isNotEmpty)
                return null;
              else
                return 'Enter Address Number';
            },
            hint: 'Enter email address',
            icon: null,
            isSvg: true,
          ).addPadding(
            horizontal: 10,
          ),
          20.height,
          textBox(
            controller: agreementAddressController,
            Ktype: TextInputType.streetAddress,
            onFieldSubmitted: (value) {
              Provider.of<SurvProvider>(context, listen: false)
                  .savePropInfoData(context);
            },
            validator: (address) {
              if (agreementAddressController.text.isNotEmpty)
                return null;
              else
                return 'Enter address';
            },
            hint: 'Address here',
            icon: null,
            isSvg: true,
          ).addPadding(
            horizontal: 10,
          ),
          20.height,
          Row(
            children: [
              Checkbox(
                  value: isClarify,
                  onChanged: (v) {
                    setState(() {
                      isClarify = v ?? false;
                    });
                  }),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'I hereby certify that I am the owner and that all the information provided above is true and correct to the best of my knowledge.',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      height: 1.5,
                      fontFamily: 'Outfit',
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
          20.height,
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Signature',
              style: TextStyle(
                color: AppThemes.whiteColor,
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
              ),
            ),
          ).addPadding(
            horizontal: 19,
            vertical: 4,
          ),
          Container(
            // color: Colors.grey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          clear();
                        },
                        child: Icon(
                          Icons.cancel,
                          color: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _controller.undo();
                        },
                        child: Icon(
                          Icons.undo,
                          color: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _controller.redo();
                        },
                        child: Icon(
                          Icons.redo,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          40.height,
          roundButton(
            buttonWidth: double.infinity,
            horizontalPadding: 15,
            height: 55,
            circleBorder: 30,
            onClick: () async {
              if (!isClarify) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'Please click on the "Certify i am the Owner" checkbox.'),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }
              if (_controller.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please draw your signature, First'),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }
              if (agreementNameController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please enter your name'),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }
              if (agreementemailController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please enter your email'),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }
              if (agreementphoneController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please enter your phone #'),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }
              if (agreementAddressController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please enter your address'),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }
              pdfAggre = await generatePdf(
                agreementNameController.text,
                agreementemailController.text,
                agreementphoneController.text,
                agreementAddressController.text,
                false,
                formatDate(DateTime.now().toString()),
                _controller.toRawSVG() ?? '',
              );
              if (pdfAggre != null) {
                var pdfname = await uploadPDF(context, pdfAggre!);
                if (pdfname != null) {
                  prov.saveSurveyData(
                      Provider.of<UserData>(context, listen: false).id!);
                  SurveyMoreModel surveyMoreData = SurveyMoreModel(
                    userid: Provider.of<UserData>(context, listen: false).id!,
                    taxAmount: backedTaxAmount.text,
                    lopExplain: leanOnProp.text,
                    lockboxPlace: lockBoxPlaced.text,
                    rating: prov.value.toString(),
                    aggrement_pdf: pdfname,
                    fastcash: fastcashY,
                    paymethod: 'autoget',
                    timeFrame: timeFrameofPro.text,
                    tab: 'survey_more',
                    formid: prov.formid,
                  );
                  await submitpropertyInfo(
                      false, surveyMoreData.toJson(), context);

                  prov.activeStepIndex += 1;
                  prov.saveStepIndex(prov.activeStepIndex);
                }
              }
            },
            text: 'NEXT',
          ),
        ],
      ),
    );
  }
}

String formatDate(String input) {
  DateTime dateTime = DateTime.parse(input);
  return DateFormat('dd-MMM-yyyy').format(dateTime);
}
