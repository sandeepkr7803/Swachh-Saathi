import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import './constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

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
                Get.back();
                },
              icon: Icon(
                Icons.browse_gallery,
                size: 60,
              ),
            ),
            TextButton.icon(
              label: Text('camera'),
              onPressed: () {
                pickImageFromCamera();
                Get.back();
                },
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
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Material(
              color: themeColor,
              elevation: 8,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
              ),
              child: Container(
                height: 240,
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                  // horizontal: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          style: const ButtonStyle(
                            backgroundColor:
                            MaterialStatePropertyAll(Colors.white54),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              bottomSheet();
                            },
                            child: CircleAvatar(
                              radius: 70,
                              backgroundImage: image != null? FileImage(image!): null,
                              child: image != null ? null: const Icon(Icons.person_2_rounded, size: 70,) ,
                            ),
                          ),
                          const SizedBox(
                            width: 200,
                            child: ListTile(
                              title: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  'Hi! \nSandeep Kumar',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              subtitle: Text(
                                'Designation',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w200,
                                ),
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
            const SizedBox(height: 20,),
            cardData(Icons.person_2_rounded, 'User1234'),
            cardData(Icons.phone, '438923945'),
            cardData(Icons.location_on, 'Dehradun'),
            cardData(Icons.star, "Rate Us"),
            SizedBox(height: 20,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                ),
                onPressed: () {},
                child: Text('Sign Out', style: const TextStyle(fontSize: 20),)),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                      backgroundColor: themeColor,
                      radius: 25,
                      child: Icon(Icons.language, color: Colors.white,)),
                  CircleAvatar(
                      backgroundColor: themeColor,
                      radius: 25,
                      child: Icon(FontAwesomeIcons.instagram, color: Colors.white,)),
                  CircleAvatar(
                      backgroundColor: themeColor,
                      radius: 25,
                      child: Icon(FontAwesomeIcons.twitter, color: Colors.white,)),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget cardData (IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      child: Card(
        elevation: 5,
        child: ListTile(
          leading: Icon(icon, color: themeColor,),
          title: Text(text, style: const TextStyle(fontSize: 20),),
        ),
      ),
    );
  }
}
