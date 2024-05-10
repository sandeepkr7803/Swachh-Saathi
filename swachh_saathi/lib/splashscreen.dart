import 'dart:async';

import 'package:flutter/material.dart';
import 'package:swachh_saathi/bottomnavbar.dart';
import 'package:swachh_saathi/loginscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Theme.of(context).primaryColor,
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //         begin: Alignment.topLeft,
        //         end: Alignment.bottomRight,
        //         colors: [
        //       Color.fromARGB(255, 31, 217, 158),
        //       Color.fromARGB(255, 255, 17, 0)
        //     ])),
        child: Center(child: Image.asset("assets/images/anilogo.gif")));
  }
}
