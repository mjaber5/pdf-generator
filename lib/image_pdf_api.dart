import 'dart:io';

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf_gen/save_and_open.dart';

class ImagePdfApi {
  static Future<File> generateTablePdf() async {
    final pdf = Document();

    final imageOne = (await rootBundle.load('assets/images/avatar.jpeg'))
        .buffer
        .asUint8List();

    final pageTheme = PageTheme(
      pageFormat: PdfPageFormat.a4,
      buildBackground: (context) {
        if (context.pageNumber == 2) {
          return FullPage(
            ignoreMargins: true,
            child: Image(
              MemoryImage(imageOne),
              fit: BoxFit.cover,
            ),
          );
        } else {
          return Container();
        }
      },
    );

    pdf.addPage(
      MultiPage(
        pageTheme: pageTheme,
        build: (context) => [
          Image(MemoryImage(imageOne)),
          Center(
            child: Image(
              MemoryImage(imageOne),
              width: pageTheme.pageFormat.availableHeight / 2,
              height: 600,
              alignment: Alignment.center,
            ),
          ),
          ClipRRect(
            verticalRadius: 32,
            horizontalRadius: 32,
            child: Image(
              MemoryImage(imageOne),
            ),
          ),
        ],
      ),
    );

    return SaveAndOpenDoucment.savePdf(name: 'Image_pdf', pdf: pdf);
  }
}
