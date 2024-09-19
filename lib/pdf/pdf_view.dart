import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
// import 'package:printing/printing.dart'; // Optional for newer Android SDK versions

Future generatePdf(
  String name,
  String email,
  String phone,
  String address,
  bool isEnglish,
  String todayDate,
  String svg,
) async {
  final svgImage = pw.SvgImage(svg: svg);

  final pdf = pw.Document(
      // pageMode: Pagemod

      );

  pdf.addPage(
    pw.Page(
      build: (buildContext) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              isEnglish ? '5-Day Agreement' : "5-Day Agreement",
              style: pw.TextStyle(
                fontSize: 21,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 12),
            pw.Text(
              isEnglish
                  ? 'This Agreement is entered into as of $todayDate, by and between'
                  : "This Agreement is entered into as of $todayDate, by and between",
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 12),
            pw.Text(
              isEnglish ? 'Property Owner(s): ' : "Property Owner(s): ",
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 12),
            pw.Row(children: [
              pw.Text(
                isEnglish ? 'Name/Company Name: ' : "Name/Company Name: ",
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                name,
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.normal,
                ),
              ),
            ]),
            pw.SizedBox(height: 12),
            pw.Row(children: [
              pw.Text(
                isEnglish ? 'Address: ' : "Address: ",
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                address,
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.normal,
                ),
              ),
            ]),
            pw.SizedBox(height: 12),
            pw.Row(children: [
              pw.Text(
                isEnglish ? 'Phone Number: ' : "Phone Number: ",
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                phone,
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.normal,
                ),
              ),
            ]),
            pw.SizedBox(height: 12),
            pw.Row(children: [
              pw.Text(
                isEnglish ? 'Email Address: ' : "Email Address: ",
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.normal,
                ),
              ),
              pw.Text(
                email,
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ]),
            pw.SizedBox(height: 12),
            pw.Container(
              height: 2,
              width: double.infinity,
              color: const PdfColor.fromInt(0xffE0E0E0),
              padding: const pw.EdgeInsets.all(4),
            ),
            pw.SizedBox(height: 12),
            pw.Text(
              isEnglish ? 'Luna Enterprises LLC: ' : 'Luna Enterprises LLC: ',
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              isEnglish ? 'Luna@lunaent.io' : 'Luna@lunaent.io',
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.normal,
                color: PdfColor.fromInt(0xFF0000FF),
              ),
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              isEnglish
                  ? '5 Cowboys Way Frisco Texas 75034 ste 300'
                  : '5 Cowboys Way Frisco Texas 75034 ste 300',
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.normal,
              ),
            ),
            pw.SizedBox(height: 12),
            pw.Text(
              isEnglish ? '1. Purpose:' : '1. Purpose:',
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              isEnglish
                  ? 'This Agreement provides Luna with a five-day period to conduct proper research for the identification of a specific property.'
                  : 'This Agreement provides Luna with a five-day period to conduct proper research for the identification of a specific property.',
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.normal,
              ),
            ),
            pw.SizedBox(height: 12),
            pw.Text(
              isEnglish ? '2. Term:' : '2. Term:',
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              isEnglish
                  ? 'This Agreement shall commence on [Start Date] and shall expire on [End Date], five days later.'
                  : 'This Agreement shall commence on [Start Date] and shall expire on [End Date], five days later.',
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.normal,
              ),
            ),
            pw.SizedBox(height: 12),
            pw.Text(
              isEnglish ? '3. No Solicitation:' : '3. No Solicitation:',
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              isEnglish
                  ? 'During this five-day period, the Property Owner agrees not to solicit or negotiate the sale of the identified property with any other parties.'
                  : 'During this five-day period, the Property Owner agrees not to solicit or negotiate the sale of the identified property with any other parties.',
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.normal,
              ),
            ),
            pw.SizedBox(height: 12),
            pw.Text(
              isEnglish
                  ? '4. Ownership and Age Verification:'
                  : '4. Ownership and Age Verification:',
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              isEnglish
                  ? 'By signing below, each party certifies that they have the legal authority to enter into this Agreement, are claiming ownership of the property, and are over the age of 18.'
                  : 'By signing below, each party certifies that they have the legal authority to enter into this Agreement, are claiming ownership of the property, and are over the age of 18.',
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.normal,
              ),
            ),
          ],
        );
      },
    ),
  );

  pdf.addPage(pw.Page(build: (c) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.SizedBox(height: 12),
          pw.Text(
            isEnglish ? '5. Not a Sales Contract:' : '5. Not a Sales Contract:',
            style: pw.TextStyle(
              fontSize: 18,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 4),
          pw.Text(
            isEnglish
                ? 'This Agreement does not constitute a sales contract or any offer to sell the property. The purpose is to conduct preliminary research on the property to verify correct information regarding its status and details'
                : 'This Agreement does not constitute a sales contract or any offer to sell the property. The purpose is to conduct preliminary research on the property to verify correct information regarding its status and details',
            style: pw.TextStyle(
              fontSize: 14,
              fontWeight: pw.FontWeight.normal,
            ),
          ),
          pw.SizedBox(height: 12),
          pw.Text(
            isEnglish
                ? '6. Approximate Asking Price:'
                : '6. Approximate Asking Price:',
            style: pw.TextStyle(
              fontSize: 18,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 4),
          pw.Text(
            'Asking Price',
            style: pw.TextStyle(
              fontSize: 14,
              fontWeight: pw.FontWeight.normal,
            ),
          ),
          pw.SizedBox(height: 12),
          pw.Text(
            isEnglish ? '7. Confidentiality' : '7. Confidentiality',
            style: pw.TextStyle(
              fontSize: 18,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 4),
          pw.Text(
            isEnglish
                ? 'Both parties agree to keep all information exchanged during this period confidential.'
                : 'Both parties agree to keep all information exchanged during this period confidential.',
            style: pw.TextStyle(
              fontSize: 14,
              fontWeight: pw.FontWeight.normal,
            ),
          ),
          pw.SizedBox(height: 12),
          pw.Text(
            isEnglish ? '8. Governing Law:' : '8. Governing Law:',
            style: pw.TextStyle(
              fontSize: 18,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 4),
          pw.Text(
            isEnglish
                ? 'This Agreement shall be governed by the laws of [Your State]'
                : 'This Agreement shall be governed by the laws of [Your State]',
            style: pw.TextStyle(
              fontSize: 14,
              fontWeight: pw.FontWeight.normal,
            ),
          ),
          pw.SizedBox(height: 12),
          pw.Text(
            isEnglish
                ? 'Signing Authority, the property owner have executed this Agreement as of the date first above written.'
                : 'Signing Authority, the property owner have executed this Agreement as of the date first above written.',
            style: pw.TextStyle(
              fontSize: 14,
              fontWeight: pw.FontWeight.normal,
            ),
          ),
          pw.SizedBox(height: 12),
          pw.Container(
            height: 2,
            width: double.infinity,
            color: const PdfColor.fromInt(0xffE0E0E0),
            padding: const pw.EdgeInsets.all(4),
          ),
          pw.Text(
            'Signature: ',
            style: pw.TextStyle(
              fontSize: 18,
              fontWeight: pw.FontWeight.normal,
            ),
          ),
          // pw.SvgImage(
          //   svg: svgPackage.SvgPicture(pictureProvider),
          // ),
          pw.SizedBox(child: svgImage),
        ]);
  }));
  final output = await getTemporaryDirectory();
  final file = File("${output.path}/Invoice.pdf");
  await file.writeAsBytes(await pdf.save());
  // debugPrint("Invoice PDF saved to ${file.path}");

  // await FileSaver.instance.saveFile(name: 'name${DateTime.now().millisecond}', bytes: file.readAsBytesSync());
  await Printing.layoutPdf(
    onLayout: (format) async => pdf.save(),
  );
}
