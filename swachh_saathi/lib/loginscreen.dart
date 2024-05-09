import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: SliverAppBar(expandedHeight: 200,),
        appBar: AppBar(
          toolbarHeight: 300, // Set this height
          flexibleSpace: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            child: Container(
              color: Theme.of(context).primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(
                      "assets/images/logo.png",
                    ),
                    height: 150,
                  ),
                  Text(
                    'Swatch Sathi',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    'From Waste to Wow...',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Enter your phone number',
                  labelText: 'Phone Number',
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Theme.of(context).primaryColor,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/1screen');
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)))),
                  child: Text(
                    "SignIn",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Theme.of(context).primaryColor),
                      height: 2,
                    ),
                  ),
                ),
                Text("Or",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Theme.of(context).primaryColor),
                      height: 2,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Create a new Account!",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/2screen');
                  },
                  child: Text(
                    "SignUp",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .25,
              width: double.maxFinite,
              child: Opacity(
                opacity: .6,
                child: Image(
                  image: AssetImage(
                    "assets/images/illustration1.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        )));
  }

  // Widget _buildInfoCard(String label, IconData icon) {
  //   return Card(
  //     elevation: 2,
  //     child: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Column(
  //         children: [
  //           Icon(icon, size: 32),
  //           SizedBox(height: 8),
  //           Text(label),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
