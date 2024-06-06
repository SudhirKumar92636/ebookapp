
import 'package:ebookapp/Pages/HomePage/Widgets/AppBar.dart';
import 'package:ebookapp/Pages/HomePage/Widgets/MyInputTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/bookcard.dart';
import '../../../components/booktitle.dart';
import '../../../components/mydrawer.dart';
import '../../../controller/AuthController.dart';
import '../../../controller/BookController.dart';
import '../../../modles/data.dart';
import '../../BookDetails/BookDetails.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    BookController bookController = Get.put(BookController());
    bookController.getUserBook();
    return Scaffold(
      drawer: myDrawer,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              color: Theme.of(context).colorScheme.primary,
              // height: 500,
              child: Expanded(
                child:
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          const HomeAppBar(),
                          const SizedBox(height: 50),
                          Row(
                            children: [
                              Text(
                                "WelCome To ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .background,
                                ),
                              ),
                              Text("${authController.auth.currentUser!.displayName}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .background,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  "Time to read book and enhance your knowledge",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const MyInputTextField(),
                          const SizedBox(height: 20),
                          // Row(
                          //   children: [
                          //     Text(
                          //       "Topics",
                          //       style: Theme.of(context)
                          //           .textTheme
                          //           .labelMedium
                          //           ?.copyWith(
                          //         color: Theme.of(context)
                          //             .colorScheme
                          //             .background,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // const SizedBox(height: 10),
                          // SingleChildScrollView(
                          //   scrollDirection: Axis.horizontal,
                          //   child: Row(
                          //     children: categoryData
                          //         .map(
                          //           (e) => CategoryWidget(
                          //           iconPath: e["icon"]!,
                          //           btnName: e["lebel"]!),
                          //     )
                          //         .toList(),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Trending",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Obx(() => Row(
                          children: bookController.bookData
                              .map((e) => BookCard(
                              title: e.title!,
                              coverUrl: e.coverUrl!,
                              ontap: () {
                                Get.to(BookDetails(
                                  book: e,
                                ));
                              },
                            ),
                          ).toList(),
                        ),
                      )
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "Your Interests",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Obx(() => Column(
                    children: bookController.bookData.map((e) => BookTile(
                        ontap: () {
                          Get.to(BookDetails(book: e));
                        },
                        title: e.title!,
                        coverUrl: e.coverUrl!,
                        author: e.author!,
                        price: e.price!,
                        rating: e.rating!,
                        totalRating: 5,
                      ),
                    )
                        .toList(),
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
