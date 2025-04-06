import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './complaints_details.dart';

class ComplaintsTracking extends StatefulWidget {
  const ComplaintsTracking({super.key});

  @override
  State<ComplaintsTracking> createState() => _ComplaintsTrackingState();
}

class _ComplaintsTrackingState extends State<ComplaintsTracking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Colors.white,),),
        backgroundColor: Color.fromARGB(255, 0, 111, 74),
        title: Text('Complaints Tracking', style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w500, color: Colors.white),),
        centerTitle: true,
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(8.0.r),
              child: InkWell(
                onTap: () {
                  Get.to(()=> const ComplaintsDetails());
                },
                child: Container(
                  width: double.maxFinite,
                  height: 170.h,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/images/illustration1.png"),
                      fit: BoxFit.fill,
                      opacity: 0.6,
                    ),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 2.h,
                          ),
                          child: Text(
                            "5, Marine Beach, Goa",
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 3.h,
                            bottom: 10.h,
                            left: 10.w,
                          ),
                          child: Text(
                            'Status: In-process',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

