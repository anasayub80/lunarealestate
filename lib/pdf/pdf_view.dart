import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
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
              isEnglish ? '5-Day Agreement' : "Acuerdo de 5 Días",
              style: pw.TextStyle(
                fontSize: 21,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 12),
            pw.Text(
              isEnglish
                  ? 'This Agreement is entered into as of $todayDate, by and between'
                  : "Este Acuerdo se celebra a partir del $todayDate, entre",
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 12),
            pw.Text(
              isEnglish
                  ? 'Property Owner(s): '
                  : "PrPropietario de la Propiedad: ",
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 12),
            pw.Row(children: [
              pw.Text(
                isEnglish
                    ? 'Name/Company Name: '
                    : "Nombre/Nombre de la Empresa: ",
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
                isEnglish ? 'Address: ' : "Dirección: ",
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
                isEnglish ? 'Phone Number: ' : "Número de Teléfono: ",
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
                isEnglish
                    ? 'Email Address: '
                    : "Dirección de Correo Electrónico: ",
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
              isEnglish ? '1. Purpose:' : '1. Propósito:',
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              isEnglish
                  ? 'This Agreement provides Luna with a five-day period to conduct proper research for the identification of a specific property.'
                  : 'Este Acuerdo proporciona a Luna un periodo de cinco días para realizar la investigación adecuada para la identificación de una propiedad específica.',
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.normal,
              ),
            ),
            pw.SizedBox(height: 12),
            pw.Text(
              isEnglish ? '2. Term:' : '2. Plazo:',
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              isEnglish
                  ? 'This Agreement shall commence on [Start Date] and shall expire on [End Date], five days later.'
                  : 'Este Acuerdo comenzará el [Fecha de Inicio] y expirará el [Fecha de Finalización], cinco días después.',
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.normal,
              ),
            ),
            pw.SizedBox(height: 12),
            pw.Text(
              isEnglish ? '3. No Solicitation:' : '3. No Solicitud:',
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              isEnglish
                  ? 'During this five-day period, the Property Owner agrees not to solicit or negotiate the sale of the identified property with any other parties.'
                  : 'Durante este período de cinco días, el Propietario de la Propiedad se compromete a no solicitar ni negociar la venta de la propiedad identificada con ninguna otra parte.',
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.normal,
              ),
            ),
            pw.SizedBox(height: 12),
            pw.Text(
              isEnglish
                  ? '4. Ownership and Age Verification:'
                  : '4. Verificación de Propiedad y Edad:',
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              isEnglish
                  ? 'By signing below, each party certifies that they have the legal authority to enter into this Agreement, are claiming ownership of the property, and are over the age of 18.'
                  : 'Al firmar a continuación, cada parte certifica que tiene la autoridad legal para celebrar este Acuerdo, está reclamando la propiedad de la propiedad y tiene más de 18 años.',
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
            isEnglish
                ? '5. Not a Sales Contract:'
                : '5. No es un Contrato de Venta:',
            style: pw.TextStyle(
              fontSize: 18,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 4),
          pw.Text(
            isEnglish
                ? 'This Agreement does not constitute a sales contract or any offer to sell the property. The purpose is to conduct preliminary research on the property to verify correct information regarding its status and details'
                : 'Este Acuerdo no constituye un contrato de venta ni ninguna oferta para vender la propiedad. El propósito es realizar una investigación preliminar sobre la propiedad para verificar la información correcta respecto a su estado y detalles.',
            style: pw.TextStyle(
              fontSize: 14,
              fontWeight: pw.FontWeight.normal,
            ),
          ),
          pw.SizedBox(height: 12),
          pw.Text(
            isEnglish
                ? '6. Approximate Asking Price:'
                : '6. Precio Aproximado de Venta:',
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
            isEnglish ? '7. Confidentiality' : '7. Confidencialidad:',
            style: pw.TextStyle(
              fontSize: 18,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 4),
          pw.Text(
            isEnglish
                ? 'Both parties agree to keep all information exchanged during this period confidential.'
                : 'Ambas partes acuerdan mantener toda la información intercambiada durante este período en confidencialidad.',
            style: pw.TextStyle(
              fontSize: 14,
              fontWeight: pw.FontWeight.normal,
            ),
          ),
          pw.SizedBox(height: 12),
          pw.Text(
            isEnglish ? '8. Governing Law:' : '8. Ley Aplicable:',
            style: pw.TextStyle(
              fontSize: 18,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 4),
          pw.Text(
            isEnglish
                ? 'This Agreement shall be governed by the laws of [Your State]'
                : 'Este Acuerdo se regirá por las leyes de [Tu Estado].',
            style: pw.TextStyle(
              fontSize: 14,
              fontWeight: pw.FontWeight.normal,
            ),
          ),
          pw.SizedBox(height: 12),
          pw.Text(
            isEnglish
                ? 'Signing Authority, the property owner have executed this Agreement as of the date first above written.'
                : 'EN TESTIMONIO DE LO CUAL, las partes de interés en vender han ejecutado este Acuerdo en la fecha primero escrita.',
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
  var date = DateTime.now().microsecondsSinceEpoch;
  final file = File("${output.path}/PropertyAgreement${date}.pdf");
  await file.writeAsBytes(await pdf.save());
  // debugPrint("Invoice PDF saved to ${file.path}");

  // await Printing.layoutPdf(onLayout: (format) async {
  return pdf.save();
  // });
}
