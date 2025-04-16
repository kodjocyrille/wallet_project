import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseProvider extends GetxService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseProvider> init() async {
    return this;
  }

  // Sign in with email and password
  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      // Get.snackbar("Error", e.toString());
      print("Erreur " + e.toString());
      return null;
    }
  }

  // Sign up with email and password
  Future<User?> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      // Get.snackbar("Error", e.toString());
      print("Erreur " + e.toString());
      return null;
    }
  }
}
