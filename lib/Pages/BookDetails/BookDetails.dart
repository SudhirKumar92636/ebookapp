
import 'package:flutter/material.dart';

import '../../config/colors.dart';
import '../../modles/bookmodle.dart';
import 'BookActionsBtn.dart';
import 'BookHeaders.dart';

class BookDetails extends StatelessWidget {
  final BookModel book;
  const BookDetails({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(padding: const EdgeInsets.all(20),
              color: primaryColor,
              child: Row(
                children: [
                  Expanded(
                    child: BookDetailsHeader(
                      coverUrl: book.coverUrl!,
                      title: book.title!,
                      author: book.author!,
                      description: book.description!,
                      rating: book.rating!,
                      pages: book.pages.toString(),
                      langugae: book.language.toString(),
                      audioLen: book.audioLen!,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "About book",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          book.description!,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "About book",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          book.aboutAuthor!,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  BookActionBtn(
                    bookUrl: book.bookurl!,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
