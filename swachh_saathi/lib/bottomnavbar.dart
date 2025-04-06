import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './complaintscreen.dart';
import './homescreen.dart';
import './newsandarticles.dart';
import './profile.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int index = 0;
  final Screens = [
    HomeScreen(),
    NewsandArticles(),
    ComplaintScreen(),
    UserProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: GNav(
            onTabChange: (index) {
              setState(() {
                this.index = index;
              });
            },
            tabMargin: EdgeInsets.all(10.r),
            tabBackgroundColor: Colors.orangeAccent,
            padding: EdgeInsets.all(10.r),
            gap: 8,
            backgroundColor: Theme.of(context).primaryColor,
            color: Colors.white,
            activeColor: Colors.white,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              // GButton(
              //   icon: Icons.money_rounded,
              //   text: 'Donation',
              // ),
              // GButton(
              //   icon: Icons.directions,
              //   text: 'Find',
              // ),
              GButton(
                icon: Icons.newspaper,
                text: 'News and Articles',
              ),
              GButton(
                icon: Icons.file_copy,
                text: 'Complaints',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ]),
        body: Screens[index]);
  }
}
