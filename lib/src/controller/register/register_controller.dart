import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_tracker/src/repository/register/register_repo.dart';
import '../../constants/firebase_constants.dart';

class RegisterController extends GetxController {
  final RegisterRepository repository;
  RegisterController({required this.repository});
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final userName = ''.obs;
  final password = ''.obs;
  final confirmPassword = ''.obs;

  // get user id
  getCurrentUserId() {
    final User? user = _firebaseAuth.currentUser;
    final uid = user!.uid.toString();
    print('user id :' + uid);
    return uid;
  }

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

  // save user information
  void createUser(
      String email, String name, String surname, String dailyActivity) {
    String userId = getCurrentUserId();
    FirebaseFirestore.instance
        .collection(FirestoreConstants.users)
        .doc(userId)
        .set(
      {
        FirestoreConstants.email: email,
        FirestoreConstants.userId: userId,
        FirestoreConstants.name: name,
        FirestoreConstants.surname: surname,
        FirestoreConstants.dailyActivity: dailyActivity
      },
      // SetOptions(merge: true),
    );
  }
}
