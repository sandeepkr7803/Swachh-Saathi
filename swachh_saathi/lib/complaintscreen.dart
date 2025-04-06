import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({super.key});

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  String selectedValue = 'Select State';

  File? image;

  void bottomSheet() {
    showModalBottomSheet(
        // backgroundColor: Theme.of(context).primaryColor,
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
                  onPressed: () => pickImageFromGallery(),
                  icon: Icon(
                    Icons.browse_gallery,
                    color: Theme.of(context).primaryColor,
                    size: 60.sp,
                  ),
                ),
                TextButton.icon(
                  label: Text(
                    'camera',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  onPressed: () => pickImageFromCamera(),
                  icon: Icon(
                    Icons.camera,
                    size: 60.sp,
                    color: Theme.of(context).primaryColor,
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(
          "Complaints",
          style: TextStyle(color: Colors.white, fontSize: 30.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 170.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: image == null
                    ? GestureDetector(
                        onTap: bottomSheet,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Select Image",
                              style: TextStyle(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "(Try uploading in Landscape)",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ))
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: Image.file(
                          image!,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text("Location", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter the Area/Street',
                  labelText: 'Area, Street',
                  prefixIcon: Icon(
                    Icons.location_pin,
                    color: Theme.of(context).primaryColor,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r)),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter the Sector/Village',
                  labelText: 'Sector, Village',
                  prefixIcon: Icon(
                    Icons.location_pin,
                    color: Theme.of(context).primaryColor,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r)),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter the landmark',
                  labelText: 'Landmark',
                  prefixIcon: Icon(
                    Icons.location_pin,
                    color: Theme.of(context).primaryColor,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r)),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter the Pincode',
                        labelText: 'Pincode',
                        prefixIcon: Icon(
                          Icons.location_pin,
                          color: Theme.of(context).primaryColor,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter the Town/City Name',
                        labelText: 'Town/City',
                        prefixIcon: Icon(
                          Icons.location_pin,
                          color: Theme.of(context).primaryColor,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(103, 0, 0, 0),
                      width: 1.0.w), // Border properties
                  borderRadius: BorderRadius.circular(15.r), // Border radius
                ),
                height: 50.h,
                width: double.infinity,
                child: DropdownButton<String>(
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(20.r),
                  value: selectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue = value!;
                    });
                  },
                  items: <String>[
                    'Select State',
                    'Andhra Pradesh',
                    'Arunachal Pradesh',
                    'Assam',
                    'Bihar',
                    'Chhattisgarh',
                    'Delhi',
                    'Goa',
                    'Gujarat',
                    'Haryana',
                    'Himachal Pradesh',
                    'Jharkhand',
                    'Karnataka',
                    'Kerala',
                    'Madhya Pradesh',
                    'Maharashtra',
                    'Manipur',
                    'Meghalaya',
                    'Mizoram',
                    'Nagaland',
                    'Odisha',
                    'Punjab',
                    'Rajasthan',
                    'Sikkim',
                    'Tamil Nadu',
                    'Telangana',
                    'Tripura',
                    'Uttar Pradesh',
                    'Uttarakhand',
                    'West Bengal',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextField(
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: 'Enter the Description',
                  labelText: 'Description (Optional)',
                  prefixIcon: Icon(
                    Icons.description,
                    color: Theme.of(context).primaryColor,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r)),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 50.h,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r)))),
                    child: Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white, fontSize: 20.sp),
                      ),
                    )),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
