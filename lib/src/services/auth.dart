import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // register in with email & password

  Future<void> createUser(
      String firstName, String lastName, String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      _firestore.collection("User").doc(userCredential.user!.uid).set({
        "email": email,
        "uid": userCredential.user!.uid,
      });
    } catch (e, st) {
      print(e);
      print(st);
      throw ("already used");
    }
  }

  // sing in with email & password

}
