import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import './bottomnavbar.dart';
import './loginscreen.dart';
import './registerscreen.dart';
import './splashscreen.dart';
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
    return ScreenUtilInit(
      builder: (_ , child) {
        return GetMaterialApp(
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
              // useMaterial3: true,
            ),
            home: child);
      },
      child: SplashScreen(),
    );

  }
}
