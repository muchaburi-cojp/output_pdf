import 'package:flutter/services.dart';
import 'package:output_pdf/pdf_icon.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

class PdfPage {
  static Future<Uint8List> create() async {
    // var pathToFile = await rootBundle.load('- your icon font file (.ttf) -');
    // final ttf = Font.ttf(pathToFile);
    // final fontData = await rootBundle.load('assets/ShipporiMincho-Regular.ttf');
    // final font = Font.ttf(fontData);

    final pdf = Document();

    // 表紙
    final cover = Page(
      pageTheme: PageTheme(
        theme: ThemeData.withFont(
          // base: await PdfGoogleFonts.varelaRoundRegular(),
          // bold: await PdfGoogleFonts.varelaRoundRegular(),
          icons: await PdfGoogleFonts.materialIcons(),
        ),
        // theme: ThemeData.withFont(base: font),
        pageFormat: PdfPageFormat.a4,
        // orientation: PageOrientation.portrait,
        // buildBackground: (context) => Opacity(
        //   opacity: 0.3,
        //   child: FlutterLogo(),
        // ),
      ),
      build: (Context context) {
        return Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '請求書',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('Apple, inc'),
                    SizedBox(height: 2),
                    Text('東京'),
                    SizedBox(height: 2),
                    Text('コンクリートジャングル'),
                    SizedBox(height: 16),
                    Text(
                      '注文番号：  11111',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '請求番号：  12345',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: pdfIcon(),
                    ),
                    SizedBox(height: 32),
                    Text(
                      '請求先',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 2),
                    Text(
                      '東京 コンクリートジャングル',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 100,
                  width: 200,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: PdfColors.black, width: 2),
                      bottom: BorderSide(color: PdfColors.black, width: 2),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '製品番号',
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 2,
                  color: PdfColors.black,
                ),
                Container(
                  height: 100,
                  width: 200,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: PdfColors.black, width: 2),
                      bottom: BorderSide(color: PdfColors.black, width: 2),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '製品名',
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );

    pdf.addPage(cover);
    return await pdf.save();
    // return pdf;
  }
}
