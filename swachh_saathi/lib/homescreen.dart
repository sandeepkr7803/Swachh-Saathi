import 'package:flutter/cupertino.dart';

/// The line `import 'package:flutter/material.dart';` in Dart is used to import the material library
/// from the Flutter framework. This library provides a set of widgets and classes that implement
/// Material Design, a popular design language developed by Google. By importing this library, you gain
/// access to pre-built widgets and styles that can be used to create visually appealing and consistent
/// user interfaces in your Flutter applications.
import 'package:flutter/material.dart';

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
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50))),
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
          ],
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
