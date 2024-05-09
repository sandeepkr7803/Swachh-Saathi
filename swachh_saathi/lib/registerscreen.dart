import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  File? image;

  void bottomSheet() {
    showModalBottomSheet(
        context: context,
        constraints: BoxConstraints(minHeight: 100),
        builder: (context) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  label: Text('Gallery'),
                  onPressed: () {
                    pickImageFromGallery();
                  },
                  icon: Icon(
                    Icons.browse_gallery,
                    size: 60,
                  ),
                ),
                TextButton.icon(
                  label: Text('camera'),
                  onPressed: () => pickImageFromCamera(),
                  icon: Icon(
                    Icons.camera,
                    size: 60,
                  ),
                ),
              ],
            ));
  }

  Future pickImageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: SliverAppBar(expandedHeight: 200,),
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter the Pincode',
                          labelText: 'Pincode',
                          prefixIcon: Icon(
                            Icons.person_2,
                            color: Theme.of(context).primaryColor,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: bottomSheet,
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundImage:
                            image != null ? FileImage(image!) : null,
                        child: image != null
                            ? null
                            : Text(
                                'Upload \n Profile',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 9,
                                ),
                              ),
                        radius: 30,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextField(
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
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your phone Address',
                    labelText: 'Address',
                    prefixIcon: Icon(
                      Icons.location_pin,
                      color: Theme.of(context).primaryColor,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/1screen');
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).primaryColor),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)))),
                      child: Text(
                        "SignUp",
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
                      "Already have an Account!",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/3screen');
                      },
                      child: Text(
                        "SignIn",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )));
  }
}
