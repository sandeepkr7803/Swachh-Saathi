import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './complaints_tracking.dart';
import 'constants.dart';
import 'news.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 6.w),
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
          "Swachh Saathi",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30.sp),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 20.h),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.r), topRight: Radius.circular(50.r))),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome to",
                style: TextStyle(
                  fontSize: 38.sp,
                ),
              ),
              Row(
                children: [
                  InkWell(
                      onTap: () {},
                      child: buildCard("17", "Report \n Issues", 140.w)),
                  SizedBox(
                    width: 15.w,
                  ),
                  InkWell(
                      onTap: () {
                        Get.to(() => ComplaintsTracking());
                      },
                      child: buildCard("17", "Track \n Progress", 180.w)),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, right: 10),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 130.h,
                    decoration: BoxDecoration(
                        color: Color(0xFDDFFFFA),
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "14",
                          style: TextStyle(
                              fontSize: 50.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "News & Articles",
                          style: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Today's News",
                style: TextStyle(
                  fontSize: 28.sp,
                ),
              ),
              SizedBox(
                height: 300,
                // width: 600.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => const NewsArticle());
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                              left: 5,
                              right: 10,
                            ),
                            child: Container(
                              height: 120,
                              padding: EdgeInsets.only(top: 10),
                              // width: 500,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: cardColor,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.r),
                                      child: Image.asset(
                                        'assets/images/illustration2.png',
                                        height: 140.h,
                                        width: 140.w,
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 0,
                                          child: Text(
                                            'Waste Management Awareness Campaign',
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.sp,
                                              color: Color.fromARGB(255, 0, 111, 74),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 0,
                                          child: Text(
                                            'Waste Management Awareness Campaign has been started to raise awareness among the people towards clean and green city.',
                                            maxLines: 3,
                                            // overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
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
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(String label, String number, double Width) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h,),
      child: Container(
        padding: EdgeInsets.only(left: 20.w),
        width: Width,
        height: 130.h,
        decoration: BoxDecoration(
            color: Color(0xFDDFFFFA), borderRadius: BorderRadius.circular(20.r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
            ),
            Text(number),
          ],
        ),
      ),
    );
  }
}
