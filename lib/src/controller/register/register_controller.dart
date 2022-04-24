import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_tracker/src/constants/local_storage_constants.dart';
import 'package:water_tracker/src/data/local_storage.dart';
import 'package:water_tracker/src/repository/register/register_repo.dart';
import '../../constants/firebase_constants.dart';

class RegisterController extends GetxController {
  final RegisterRepository repository;
  RegisterController({required this.repository});
  final localStorage = LocalStorage();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final email = ''.obs;
  final userName = ''.obs;
  final password = ''.obs;
  final confirmPassword = ''.obs;
  final gender = ''.obs;

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

  // save local storage user information
  saveLocalRegisterInformations() {
    print('gelen veri' + email.value);
    print('gelen veri' + userName.value);
    print('gelen veri' + gender.value);

    localStorage.saveString(LocalStorageConstants.email, email.value);
    localStorage.saveString(LocalStorageConstants.userName, userName.value);
    localStorage.saveString(LocalStorageConstants.gender, gender.value);
  }
}
