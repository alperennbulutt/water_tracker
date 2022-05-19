import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_tracker/src/repository/login/login_repo.dart';
import 'package:water_tracker/src/utils/routes/app_pages.dart';

class LoginControllerController extends GetxController {
  final LoginRepository repository;
  LoginControllerController({required this.repository});

  final userName = ''.obs;
  final password = ''.obs;

  // sign in
  Future signIn(String email, String password) async {
    try {
      Get.dialog(Center(
        child: CircularProgressIndicator(),
      ));
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      Get.back();

      Get.toNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Uyarı",
        middleText: 'Kullanıcı Adı veya Şifre Yanlış!!!',
      );
    }
  }
}
