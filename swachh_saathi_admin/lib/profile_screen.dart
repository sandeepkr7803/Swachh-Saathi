import 'dart:io';
import 'package:flutter/material.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swachh_saathi_admin/authentication/controller/auth_Controller.dart';
import './constants.dart';

final EmailAuthController authController = Get.find();

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? image;
  String email = '';
  String password = '';
  String name = ' ';
  String phoneNo = ' ';

  @override
  void initState() {
    super.initState();
    fetchUserData(); // fetch user data on load
  }

  void fetchUserData() async {
    final user = firebaseAuth.currentUser;
    if (user != null) {
      final doc = await firestore.collection('user_admin').doc(user.uid).get();
      if (doc.exists) {
        setState(() {
          email = doc['email'] ?? '';
          password = doc['password'] ?? '';
          phoneNo = doc['phone_no'] ?? ' ';
          name = doc['name'] ?? ' ';
        });
      }
    }
  }

  void bottomSheet() {
    showModalBottomSheet(
        context: context,
        constraints: BoxConstraints(minHeight: 100.h),
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
                    size: 60.sp,
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
                    size: 60.sp,
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
            // AppBar section remains unchanged...
            Material(
              color: themeColor,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.r),
                  bottomLeft: Radius.circular(30.r),
                ),
              ),
              child: Container(
                height: 240.h,
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.white54),
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
                              radius: 60.r,
                              backgroundImage:
                                  image != null ? FileImage(image!) : null,
                              child: image != null
                                  ? null
                                  : Icon(
                                      Icons.person_2_rounded,
                                      size: 70,
                                    ),
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            child: ListTile(
                              title: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  'Hi! \n $name ',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 60.sp,
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
            SizedBox(height: 20.h),
            cardData(Icons.person_2_rounded, email),
            cardData(Icons.phone, phoneNo),
            cardData(Icons.location_on, 'Dehradun'),
            cardData(Icons.star, "Rate Us"),
            SizedBox(height: 20.h),
            ElevatedButton(
                style: ElevatedButton.styleFrom(elevation: 5),
                onPressed: () {
                  authController.logout();
                },
                child: Text('Sign Out', style: TextStyle(fontSize: 16.sp))),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                      backgroundColor: themeColor,
                      radius: 25.r,
                      child: Icon(Icons.language, color: Colors.white)),
                  CircleAvatar(
                      backgroundColor: themeColor,
                      radius: 25.r,
                      child: Icon(FontAwesomeIcons.instagram,
                          color: Colors.white)),
                  CircleAvatar(
                      backgroundColor: themeColor,
                      radius: 25.r,
                      child:
                          Icon(FontAwesomeIcons.twitter, color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget cardData(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 5.h,
      ),
      child: Card(
        elevation: 5,
        child: ListTile(
          leading: Icon(
            icon,
            color: themeColor,
          ),
          title: Text(
            text,
            style: TextStyle(fontSize: 18.sp, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
