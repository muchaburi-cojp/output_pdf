import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfPreviewPage extends StatelessWidget {
  final String filePath;

  const PdfPreviewPage({required this.filePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('pdfプレビュー'),
        actions: const [
          // IconButton(
          //   onPressed: () async {
          //     await Share.shareXFiles([XFile(filePath)], text: '参加者一覧pdfを共有します。');
          //   },
          //   icon: const Icon(Icons.share),
          // )
        ],
      ),
      body: PDFView(
        filePath: filePath,
      ),
    );
  }
}
