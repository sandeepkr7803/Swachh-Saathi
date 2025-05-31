import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swachh_saathi_admin/constants.dart';
import 'package:swachh_saathi_admin/home_screen.dart';
import 'package:swachh_saathi_admin/login_screen.dart';

class EmailAuthController extends GetxController {
  static EmailAuthController instance = Get.put(EmailAuthController());

  RxBool isLoading = false.obs;
  Rx<User?> _user = Rx<User?>(firebaseAuth.currentUser);

  SharedPreferences? prefs;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(firebaseAuth.authStateChanges());
    _user.listen(_onAuthStateChanged);
  }

  Future<void> _onAuthStateChanged(User? user) async {
    prefs = await SharedPreferences.getInstance();
    bool firstTimeLogin = prefs?.getBool('first_time_login') ?? true;

    if (firstTimeLogin) {
      await prefs?.setBool('first_time_login', false);
      Get.offAll(() => const LoginScreen());
    } else {
      if (user == null) {
        Get.offAll(() => const LoginScreen());
      } else {
        Get.offAll(() => const HomeScreen());
      }
    }
  }

  // Future<void> registerUser(String email, String password,String name , String phone_no) async {
  //   isLoading.value = true;
  //   try {
  //     UserCredential userCredential =
  //         await firebaseAuth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );

  //     await firestore
  //         .collection('user_admin')
  //         .doc(userCredential.user!.uid)
  //         .set({
  //       'email': email,
  //       'userId': userCredential.user!.uid,
  //       'usertype': 'user_admin',
  //       'password': password,
  //       'phone_no':phone_no,
  //       "name":name;
  //     }, SetOptions(merge: true));

  //     _showSuccessSnackbar("Registration Successful");
  //     Get.offAll(() => const HomeScreen());
  //   } catch (e) {
  //     _showErrorSnackbar(e.toString());
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  Future<void> loginUser(String email, String password) async {
    isLoading.value = true;
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _showSuccessSnackbar("Login Successful");
      Get.offAll(() => const HomeScreen());
    } catch (e) {
      _showErrorSnackbar("Login Failed: ${e.toString()}");
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await firebaseAuth.signOut();
    Get.offAll(() => const LoginScreen());
  }

  void _showErrorSnackbar(String message) {
    Get.snackbar(
      "Error",
      "",
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
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.red,
          fontSize: 16,
        ),
      ),
      isDismissible: true,
      duration: const Duration(seconds: 3),
    );
  }

  void _showSuccessSnackbar(String message) {
    Get.snackbar(
      "Success",
      "",
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.white.withOpacity(0.3),
      borderRadius: 20,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(16),
      overlayBlur: 5,
      titleText: const Text(
        "✅ Success",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.green,
          fontSize: 16,
        ),
      ),
      isDismissible: true,
      duration: const Duration(seconds: 3),
    );
  }
}
