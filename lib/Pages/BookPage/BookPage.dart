import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../controller/PdfController.dart';

class BookPage extends StatelessWidget {
  final String bookUrl;
  const BookPage({super.key, required this.bookUrl});
  @override
  Widget build(BuildContext context) {
    PdfController pdfController = Get.put(PdfController());
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Theme.of(context).colorScheme.background,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Book title",
          style: Theme.of(context).textTheme.headlineMedium
              ?.copyWith(color: Theme.of(context).colorScheme.background),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pdfController.pdfViewerKey.currentState?.openBookmarkView();
        },
        child: Icon(
          Icons.bookmark,
          color: Theme.of(context).colorScheme.background,
        ),
      ),
      body: SfPdfViewer.network(
        bookUrl,
        key: pdfController.pdfViewerKey,
      ),
    );
  }
}
