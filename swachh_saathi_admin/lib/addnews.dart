import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swachh_saathi_admin/Services/firebase_services.dart';

class AddNewsScreen extends StatefulWidget {
  const AddNewsScreen({super.key});

  @override
  State<AddNewsScreen> createState() => _AddNewsScreenState();
}

class _AddNewsScreenState extends State<AddNewsScreen> {
  File? image;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final FirebaseService firebaseService = FirebaseService();

  bool isLoading = false;

  void bottomSheet() {
    showModalBottomSheet(
      context: context,
      constraints: BoxConstraints(minHeight: 100.h),
      builder: (context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton.icon(
            label: Text(
              'Gallery',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            onPressed: () {
              pickImageFromGallery();
              Get.back();
            },
            icon: Icon(
              Icons.browse_gallery,
              color: Theme.of(context).primaryColor,
              size: 60.sp,
            ),
          ),
          TextButton.icon(
            label: Text(
              'Camera',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            onPressed: () {
              pickImageFromCamera();
              Get.back();
            },
            icon: Icon(
              Icons.camera,
              size: 60.sp,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Future pickImageFromCamera() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedImage == null) return;
      setState(() => image = File(pickedImage.path));
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageFromGallery() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
      setState(() => image = File(pickedImage.path));
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<void> handleSubmit() async {
    if (image == null ||
        titleController.text.trim().isEmpty ||
        descriptionController.text.trim().isEmpty) {
      Get.snackbar("Error", "Please fill all fields and select an image");
      return;
    }

    setState(() => isLoading = true);

    try {
      await firebaseService.uploadArticle(
        title: titleController.text.trim(),
        description: descriptionController.text.trim(),
        // imageFile: image!,
      );
      Get.snackbar("Success", "Article uploaded successfully");

      // Clear fields after upload
      setState(() {
        image = null;
        titleController.clear();
        descriptionController.clear();
      });
    } catch (e) {
      Get.snackbar("Error", "Upload failed: ${e.toString()}");
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News and Articles',
          style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: bottomSheet,
                child: Container(
                  width: double.infinity,
                  height: 200.h,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: image == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Click Image ",
                              style: TextStyle(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "Try Uploading in Landscape ",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: Image.file(
                            image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
              SizedBox(height: 20.h),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'Enter Title',
                  labelText: 'Title',
                  prefixIcon: Icon(
                    Icons.title,
                    color: Theme.of(context).primaryColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              TextField(
                controller: descriptionController,
                maxLines: 8,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Enter Description',
                  labelText: 'Description',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 50.h,
                child: ElevatedButton(
                  onPressed: handleSubmit,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      Theme.of(context).primaryColor,
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),
                  ),
                  child: Center(
                    child: isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
