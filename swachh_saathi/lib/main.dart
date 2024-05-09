import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:swachh_saathi/bottomnavbar.dart';
import 'package:swachh_saathi/homescreen.dart';
import 'package:swachh_saathi/loginscreen.dart';
import 'package:swachh_saathi/registerscreen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/1screen': (BuildContext context) => BottomNavigation(),
          '/2screen': (BuildContext context) => RegisterScreen(),
          '/3screen': (BuildContext context) => LoginScreen(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Swachh Saathi',
        theme: ThemeData(
          primaryColor: Color.fromARGB(255, 0, 111, 74),
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 0, 111, 74),
              primary: Color.fromARGB(255, 0, 111, 74)),
          useMaterial3: true,
        ),
        home: LoginScreen());
  }
}
