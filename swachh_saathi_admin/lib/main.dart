import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import './constants.dart';
import 'firebase_options.dart';
import './login_screen.dart';

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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Swachh Saathi Admin',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: themeColor,
          foregroundColor: backgroundColor,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: themeColor,
          primary: themeColor,
        ),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
