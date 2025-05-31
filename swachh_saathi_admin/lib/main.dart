import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:swachh_saathi_admin/splashscreen.dart';
import './constants.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (ctx, child) {
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
          home: child,
        );
      },
      child: const SplashScreen(),
    );
  }
}
