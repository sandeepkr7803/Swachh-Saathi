import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:swachh_saathi_admin/authentication/controller/auth_Controller.dart';
import './constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final EmailAuthController authController = Get.put(EmailAuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFDDFFFFA),
        appBar: AppBar(
          backgroundColor: backgroundColor,
          toolbarHeight: 250,
          flexibleSpace: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r),
            ),
            child: Container(
              child: Image.asset(
                'assets/img/name2.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Obx(() => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 40.h,
                      left: 20.w,
                      right: 20.w,
                    ),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_rounded),
                        prefixIconColor: themeColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        labelText: 'Email',
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_rounded),
                        prefixIconColor: themeColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _loginUser();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themeColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: authController.isLoading.value
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                              ),
                            ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: double.infinity,
                    child: Opacity(
                      opacity: 0.4,
                      child: Image.asset(
                        'assets/img/clean2.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  void _loginUser() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error",
        "Email and Password cannot be empty!",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white.withOpacity(0.3),
        borderRadius: 20,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(16),
        overlayBlur: 5,
        titleText: const Text(
          "⚠️ Error",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        messageText: const Text(
          "Email and Password cannot be empty!",
          style: TextStyle(
            color: Colors.red,
            fontSize: 16,
          ),
        ),
        isDismissible: true,
        duration: const Duration(milliseconds: 1300),
      );
    } else {
      authController.loginUser(email, password);
    }
  }
}
