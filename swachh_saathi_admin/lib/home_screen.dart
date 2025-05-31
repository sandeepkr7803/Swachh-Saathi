import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:swachh_saathi_admin/addnews.dart';
import './complaint_screen.dart';
import './news_screen.dart';
import './profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Padding(
            padding: EdgeInsets.all(6.r),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/img/logo.jpg'),
              // radius: 20,
              // child: Image.asset('assets/img/logo.jpg')
            ),
          ),
          title: Text(
            'Swachh Saathi',
            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w500),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0.r),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                  ),
                  children: [
                    cardItems(Icons.note_alt_outlined, 'Complaints', () {
                      Get.to(() => const ComplaintScreen());
                    }),
                    cardItems(Icons.article_rounded, 'Add News\nand Article',
                        () {
                      Get.to(() => const AddNewsScreen());
                    }),
                    cardItems(Icons.article_outlined, 'News and \n Articles',
                        () {
                      Get.to(() => const NewsScreen());
                    }),
                    cardItems(Icons.person_2_rounded, 'Profile', () {
                      Get.to(() => const ProfileScreen());
                    }),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: Opacity(
                    opacity: 0.5,
                    child: Image.asset(
                      'assets/img/clean-city.png',
                      fit: BoxFit.cover,
                      width: double.maxFinite,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardItems(IconData icon, String text, void Function()? onTap) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30.sp,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 25.sp),
            ),
          ],
        ),
      ),
    );
  }
}
