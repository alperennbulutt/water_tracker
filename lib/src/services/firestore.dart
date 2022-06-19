import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // get user id
  getCurrentUserId() {
    final User? user = _firebaseAuth.currentUser;
    final uid = user!.uid.toString();
    print('user id :' + uid);
    return uid;
  }
}
