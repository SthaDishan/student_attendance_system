import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../teacherhome.dart';

class auth_teachercontrol extends GetxController {
  //static auth_control instance = Get.find();
  FirebaseAuth auth = FirebaseAuth.instance;
  String? errorMessage;
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> signIn(String email, String password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {Get.to(teacherattendance())});
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";
          log(errorMessage!);
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          log(errorMessage!);
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          log(errorMessage!);
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          log(errorMessage!);
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          log(errorMessage!);
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          log(errorMessage!);
          break;
        default:
          errorMessage = "This field can't be empty!";
          log(errorMessage!);
      }
      Fluttertoast.showToast(msg: errorMessage!);
      print(error.code);
    }
  }
}
