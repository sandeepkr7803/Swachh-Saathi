import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Controller/auth_controller1.dart';

var firebaseAuth = FirebaseAuth.instance;
var buttonColor = const Color(0xFF006F4A);
var backgroundColor = const Color(0xB28ED58E);
var firestore = FirebaseFirestore.instance;
const cardColor = Color(0xFDDFFFFA);
var authController = AuthController1.instance;