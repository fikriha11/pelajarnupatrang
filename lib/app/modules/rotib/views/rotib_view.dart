import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'package:get/get.dart';

import '../controllers/rotib_controller.dart';

class RotibView extends GetView<RotibController> {
  RotibView({Key? key}) : super(key: key);
  late PDFViewController pdfViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rotibul Haddad',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: PDFView(
        filePath: 'assets/doc/rotib.pdf',
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        onError: (error) {
          print(error.toString());
        },
        onPageError: (page, error) {
          print('$page: ${error.toString()}');
        },
        onViewCreated: (PDFViewController vc) {
          pdfViewController = vc;
        },
      ),
    );
  }
}
