import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_tracker/src/repository/login/login_repo.dart';

class LoginControllerController extends GetxController {
  final LoginRepository repository;
  LoginControllerController({required this.repository});

  final userName = ''.obs;
  final password = ''.obs;

  // sign in
  Future signIn(String email, String password) async {
    Get.dialog(Center(
      child: CircularProgressIndicator(),
    ));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    Get.back();
  }
}
