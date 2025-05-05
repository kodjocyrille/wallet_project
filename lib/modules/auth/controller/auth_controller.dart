import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_project/models/user_model.dart';
import 'package:wallet_project/provider/firebase_provider.dart';

class AuthController extends GetxController {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final RxString email = ''.obs;
  final RxString password = ''.obs;
  final FirebaseProvider _auth = Get.find<FirebaseProvider>();
  late GlobalKey<FormState> loginformKey = GlobalKey<FormState>();
  late GlobalKey<FormState> registerformKey = GlobalKey<FormState>();

  final UserModel user = UserModel();
  var isLoading = false.obs;

  Future<void> login() async {
    // if (emailController.text.isEmpty || passwordController.text.isEmpty) {
    //   Get.snackbar(
    //     "Erreur",
    //     "Veuillez remplir tous les champs",
    //     snackPosition: SnackPosition.BOTTOM,
    //   );
    //   return;
    // }

    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(email.value, password.value);
      Get.offNamed('/home'); // Redirige après connexion
    } catch (e) {
      Get.snackbar("Erreur", e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> register() async {
    if (password.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Erreur",
        "Veuillez remplir tous les champs",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      isLoading.value = true;
      await _auth.signUpWithEmailAndPassword(email.value, password.value);
      Get.offNamed('/home'); // Redirige après inscription
    } catch (e) {
      Get.snackbar("Erreur", e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }
}
