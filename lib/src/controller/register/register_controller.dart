import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_tracker/src/repository/register/register_repo.dart';

class RegisterController extends GetxController {
  final RegisterRepository repository;
  RegisterController({required this.repository});
  // sign up
  Future signUp(String email, String password) async {
    Get.dialog(Center(
      child: CircularProgressIndicator(),
    ));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    Get.back();
  }

  final userName = ''.obs;
  final password = ''.obs;
  final confirmPassword = ''.obs;
}
