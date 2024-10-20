import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf_gen/save_and_open.dart';

class SimplePdfApi {
  static Future<File> generateSimpleTextPdf(String text, String text2) async {
    final pdf = Document();

    pdf.addPage(MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (context) => [
        customHeader(),
        customHeadLine(),
        createLink(),
        ...bulletPoints(),
        Header(
          text: 'Pdf Paragraph',
          textStyle: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
        Paragraph(
          text: LoremText().paragraph(60),
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        Paragraph(
          text: LoremText().paragraph(60),
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        Paragraph(
          text: LoremText().paragraph(60),
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        Paragraph(
          text: LoremText().paragraph(60),
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ],
      header: (context) => buildPageNumber(context),
      footer: (context) => buildPageNumber(context),
    ));
    return SaveAndOpenDoucment.savePdf(name: 'simple_pdf.pdf', pdf: pdf);
  }

  static Widget customHeader() => Container(
        padding: const EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: PdfColors.blue,
            ),
          ),
        ),
        child: Row(
          children: [
            PdfLogo(),
            SizedBox(width: 0.5 * PdfPageFormat.cm),
            Text(
              ' Create your pdf',
              style: TextStyle(
                fontSize: 50,
                color: PdfColors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );

  static customHeadLine() => Header(
        child: Text(
          'Another headline',
          style: TextStyle(
            fontSize: 50,
            color: PdfColors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        padding: const EdgeInsets.all(8.0),
      );

  static Widget createLink() => UrlLink(
        child: Text(
          'Go to heyflutter.com',
          style: TextStyle(
            fontSize: 30,
            color: PdfColors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        destination: 'https://heyflutter.com',
      );

  static List<Bullet> bulletPoints() => [
        Bullet(
          text: 'First bullet',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          bulletMargin: const EdgeInsets.only(top: 20, right: 5),
        ),
        Bullet(
          text: 'Second bullet',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          bulletMargin: const EdgeInsets.only(top: 20, right: 5),
        ),
        Bullet(
          text: 'Third bullet',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          bulletMargin: const EdgeInsets.only(top: 20, right: 5),
        ),
      ];

  static buildPageNumber(Context context) => Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 10),
        child: Text(
          'Page ${context.pageNumber} of ${context.pagesCount}',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
