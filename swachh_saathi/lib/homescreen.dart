import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swachh_saathi/newsandarticles.dart';

import 'constraints.dart';
import 'news.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/affu.jpg"),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.language,
                color: Colors.white,
              ))
        ],
        title: Text(
          "Swachh Saathi ",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, top: 20),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50))),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome to",
                style: TextStyle(
                  fontSize: 38,
                ),
              ),
              Row(
                children: [
                  InkWell(
                      onTap: () {},
                      child: buildCard("17", "Report \n Issues", 130)),
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                      onTap: () {},
                      child: buildCard("17", "Track \n Progress", 200)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 0, right: 20),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 170,
                    decoration: BoxDecoration(
                        color: Color(0xFDDFFFFA),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "14",
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "News & Articles",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Today's News",
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
              SizedBox(
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListView.builder(
                      itemCount: 3,
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
                
                                  const Expanded(
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(String label, String number, double Width) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 0),
      child: Container(
        padding: EdgeInsets.only(left: 20),
        width: Width,
        height: 170,
        decoration: BoxDecoration(
            color: Color(0xFDDFFFFA), borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(number),
          ],
        ),
      ),
    );
  }
}
