import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swachh_saathi/constraints.dart';

import 'news.dart';

class NewsandArticles extends StatelessWidget {
  const NewsandArticles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "News and Articles",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => const NewsArticle());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5, horizontal: 10),
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: cardColor,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/illustration1.png',
                              // height: 72,
                            ),
                          ),
                        ),

                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                flex: 0,
                                child: Text(
                                  'Waste Management Awareness Campaign',
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 0, 111, 74),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 0,
                                child: Text(
                                  'Waste Management Awareness Campaign has been started to raise awareness among the people towards clean and green city.',
                                  maxLines: 3,
                                  // overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
