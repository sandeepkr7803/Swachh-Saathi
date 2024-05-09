import 'package:flutter/material.dart';

class NewsandArticles extends StatelessWidget {
  const NewsandArticles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Complaints",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
              height: 110,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color(0xFDDFFFFA),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  Image(image: AssetImage("assets/images/logo.png")),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Container $index',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Container Description ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ));
        },
      ),
    );
  }
}
