import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:printing/printing.dart';

class PdfPreviewPage extends StatelessWidget {
  final Uint8List pdfData;

  const PdfPreviewPage({required this.pdfData, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('pdfプレビュー'),
      ),
      body: PdfPreview(
        build: (format) {
          return pdfData;
        },
      ),
    );
  }
}
