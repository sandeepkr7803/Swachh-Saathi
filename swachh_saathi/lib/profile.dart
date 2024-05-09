import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
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
                  onPressed: () => pickImageFromGallery(),
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
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Material(
              elevation: 8,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              child: Container(
                height: 220,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: bottomSheet,
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.white,
                        foregroundImage:
                            image != null ? FileImage(image!) : null,
                        child: image != null
                            ? null
                            : Icon(Icons.person_2_rounded, size: 100),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                        SizedBox(
                          width: 180,
                          child: Text(
                            "Afraz Hasan Naqvi",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.white,
                                fontSize: 22),
                            maxLines: 3,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
          SizedBox(
            child: Card(
              elevation: 5,
              child: ListTile(
                leading: Text(
                  "Track You Complaint",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(Icons.arrow_circle_right),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          _cardData(context, "Phone Number", Icons.phone),
          _cardData(context, "Address", Icons.location_pin),
          _cardData(context, "Rate Us", Icons.star),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Sign Out",
              style: TextStyle(fontSize: 18),
            ),
            style: ElevatedButton.styleFrom(elevation: 5),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 25,
                child: Icon(
                  Icons.language,
                  color: Colors.white,
                ),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              CircleAvatar(
                radius: 25,
                child: Icon(
                  FontAwesomeIcons.instagram,
                  color: Colors.white,
                ),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              CircleAvatar(
                radius: 25,
                child: Icon(
                  FontAwesomeIcons.twitter,
                  color: Colors.white,
                ),
                backgroundColor: Theme.of(context).primaryColor,
              ),
            ],
          )
        ],
      ),
    ));
  }

  Widget _cardData(BuildContext context, String label, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(label),
          ),
        ),
      ),
    );
  }
}
