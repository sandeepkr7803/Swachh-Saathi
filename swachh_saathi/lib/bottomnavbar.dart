import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:swachh_saathi/complaintscreen.dart';
import 'package:swachh_saathi/homescreen.dart';
import 'package:swachh_saathi/loginscreen.dart';
import 'package:swachh_saathi/newsandarticles.dart';
import 'package:swachh_saathi/profile.dart';

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
            tabMargin: EdgeInsets.all(10),
            tabBackgroundColor: Colors.red,
            padding: EdgeInsets.all(10),
            gap: 8,
            backgroundColor: Color.fromARGB(255, 0, 178, 209),
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
                text: 'News and Article',
              ),
              GButton(
                icon: Icons.file_copy,
                text: 'Complaint',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ]),
        body: Screens[index]);
  }
}
