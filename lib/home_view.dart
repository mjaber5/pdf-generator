import 'package:flutter/material.dart';
import 'package:pdf_gen/image_pdf_api.dart';
import 'package:pdf_gen/save_and_open.dart';
import 'package:pdf_gen/simple_pdf_api.dart';
import 'package:pdf_gen/table_pdf_api.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 111, 201),
        centerTitle: true,
        title: const Text('Pdf Package Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(
                onPressed: () async {
                  final simplePdfFile =
                      await SimplePdfApi.generateSimpleTextPdf(
                    'Sample Text',
                    'Flutter Developer',
                  );
                  SaveAndOpenDoucment.openPdf(simplePdfFile);
                },
                text: 'Simple Pdf'),
            const SizedBox(height: 20),
            buildButton(
                onPressed: () async {
                  final simplePdfFile =
                      await SimplePdfApi.generateSimpleTextPdf(
                    'Sample Text',
                    'Flutter Developer',
                  );
                  SaveAndOpenDoucment.openPdf(simplePdfFile);
                },
                text: 'Paragraph Pdf'),
            const SizedBox(height: 20),
            buildButton(
                onPressed: () async {
                  final tablePdf = await TablePdfApi.generateTablePdf();
                  SaveAndOpenDoucment.openPdf(tablePdf);
                },
                text: 'Table Pdf'),
            const SizedBox(height: 20),
            buildButton(
                onPressed: () async {
                  final imagePdf = await ImagePdfApi.generateTablePdf();
                  SaveAndOpenDoucment.openPdf(imagePdf);
                },
                text: 'Image Pdf'),
          ],
        ),
      ),
    );
  }

  ElevatedButton buildButton(
      {required Function() onPressed, required String text}) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
