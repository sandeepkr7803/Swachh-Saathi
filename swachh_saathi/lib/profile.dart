import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swachh_saathi/complaints_tracking.dart';
import '../Controller/auth_controller1.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final authController = Get.put(AuthController1());
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
    return SingleChildScrollView(
          child: Column(
    children: [
      Material(
          elevation: 8,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)),
          child: Container(
            height: 240,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            child: Align(
              alignment: Alignment.bottomCenter,
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
            ),
          )),
      SizedBox(
        height: 15,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Card(
          elevation: 5,
          child: InkWell(
            onTap: () {
              Get.to(() => ComplaintsTracking());
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                leading: Text(
                  "Track Your Complaints",
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
                trailing: Icon(Icons.arrow_forward_rounded, color: Color.fromARGB(255, 0, 111, 74),),
              ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.stretch,
              //   children: [
              //
              //     Text(
              //       "Track Your Complaints",
              //       style: TextStyle(fontSize: 20),
              //     ),
              //     SizedBox(height: 10,),
              //     Align(
              //         alignment: Alignment.centerRight,
              //         child: Icon(Icons.arrow_forward_rounded, size: 25,)),
              //   ],
              // ),
            ),
          ),
        ),
      ),
      _cardData(context, "Phone Number", Icons.phone),
      _cardData(context, "Address", Icons.location_pin),
      _cardData(context, "Rate Us", Icons.star),
      SizedBox(
        height: 20,
      ),
      ElevatedButton(
        onPressed: () {
          authController.logout();
        },
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
        );
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
            title: Text(label, style: TextStyle(fontSize: 20),),
          ),
        ),
      ),
    );
  }
}
