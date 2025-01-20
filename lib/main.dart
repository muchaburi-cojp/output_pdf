import 'dart:io';

import 'package:flutter/material.dart';
import 'package:output_pdf/pdf_page.dart';
import 'package:output_pdf/pdf_preview_page.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _incrementCounter() async {
    final pdfData = await PdfPage.create();
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/document.pdf');
    await file.writeAsBytes(pdfData);
    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return PdfPreviewPage(filePath: file.path);
        },
      ),
    );
  }

  /// PDFのデザイン作成
  // Future<Uint8List> generatePdf() async {
  //   final pdf = pw.Document();
  //
  //   pdf.addPage(
  //     pw.Page(
  //       pageFormat: pf.PdfPageFormat.a4,
  //       build: (pw.Context context) {
  //         return pw.Column(
  //           children: [
  //             pw.Row(
  //               mainAxisSize: pw.MainAxisSize.max,
  //               mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
  //               children: [
  //                 pw.Column(
  //                   crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                   children: [
  //                     pw.Text(
  //                       '請求書',
  //                       style: pw.TextStyle(
  //                         fontSize: 20,
  //                         fontWeight: pw.FontWeight.bold,
  //                       ),
  //                     ),
  //                     pw.SizedBox(height: 8),
  //                     pw.Text('Apple, inc'),
  //                     pw.SizedBox(height: 2),
  //                     pw.Text('東京'),
  //                     pw.SizedBox(height: 2),
  //                     pw.Text('コンクリートジャングル'),
  //                     pw.SizedBox(height: 16),
  //                     pw.Text(
  //                       '注文番号：  11111',
  //                       style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
  //                     ),
  //                     pw.Text(
  //                       '請求番号：  12345',
  //                       style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
  //                     ),
  //                   ],
  //                 ),
  //                 pw.Column(
  //                   children: [
  //                     pw.Align(alignment: pw.Alignment.centerRight, child: pdfIcon()),
  //                     pw.SizedBox(height: 32),
  //                     pw.Text(
  //                       '請求先',
  //                       style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
  //                     ),
  //                     pw.SizedBox(height: 2),
  //                     pw.Text(
  //                       '東京 コンクリートジャングル',
  //                       style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //             pw.Row(
  //               mainAxisSize: pw.MainAxisSize.max,
  //               children: [
  //                 pw.Container(
  //                   height: 100,
  //                   width: 200,
  //                   decoration: const pw.BoxDecoration(
  //                     border: pw.Border(
  //                       top: pw.BorderSide(color: pf.PdfColors.black, width: 2),
  //                       bottom: pw.BorderSide(color: pf.PdfColors.black, width: 2),
  //                     ),
  //                   ),
  //                   child: pw.Align(
  //                     alignment: pw.Alignment.centerLeft,
  //                     child: pw.Text(
  //                       '製品番号',
  //                     ),
  //                   ),
  //                 ),
  //                 pw.Container(
  //                   height: 100,
  //                   width: 2,
  //                   color: pf.PdfColors.black,
  //                 ),
  //                 pw.Container(
  //                   height: 100,
  //                   width: 200,
  //                   decoration: const pw.BoxDecoration(
  //                     border: pw.Border(
  //                       top: pw.BorderSide(color: pf.PdfColors.black, width: 2),
  //                       bottom: pw.BorderSide(color: pf.PdfColors.black, width: 2),
  //                     ),
  //                   ),
  //                   child: pw.Align(
  //                     alignment: pw.Alignment.centerLeft,
  //                     child: pw.Text(
  //                       '製品名',
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         );
  //       },
  //     ),
  //   );
  //
  //   await Future.delayed(const Duration(seconds: 5));
  //
  //   return await pdf.save();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'pdf',
        child: const Icon(Icons.picture_as_pdf),
      ),
    );
  }
}
