import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_project/modules/global_widgets/button_widget.dart';
import 'package:wallet_project/modules/global_widgets/textformfield.dart';
import '../controller/auth_controller.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: true,

      //   backgroundColor: Get.theme.primaryColor,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/logo/pochi_white_.png',
                    // height: 200,
                    // width: 250,
                    height: Get.height * 0.2,
                    width: Get.width * 0.6,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  // bottom: 290,
                  // left: 70,
                  bottom: Get.height * 0.01,
                  left: Get.width * 0.0,
                  child: Text(
                    "Votre poche notre soucis",
                    style: TextStyle(
                      fontSize: Get.textScaleFactor * 20,
                      fontWeight: FontWeight.bold,
                      color: Get.theme.colorScheme.secondary,
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  TextFieldWidget(label: "Nom et prénom"),
                  SizedBox(height: 20),
                  TextFieldWidget(label: "Email"),
                  SizedBox(height: 20),
                  TextFieldWidget(label: "Mot de passe"),
                  SizedBox(height: Get.height * 0.05),
                  Obx(
                    () =>
                        controller.isLoading.value
                            ? CircularProgressIndicator()
                            : ButtonWidget(
                              textColor: Get.theme.scaffoldBackgroundColor,
                              height: 45,
                              color: Get.theme.primaryColor,
                              width: Get.width,
                              text: "Créer un compte",
                              onPressed: () => controller.login(),
                            ),
                  ),
                  SizedBox(height: Get.height * 0.01),
                  Text.rich(
                    TextSpan(
                      text: 'Vous n\'avez pas de compte ?',
                      style: TextStyle(
                        // Couleur du texte normal
                      ),
                      children: [
                        TextSpan(
                          text: 'Créer un compte',
                          style: TextStyle(
                            color: Get.theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: Get.theme.colorScheme.primary,
                            // decorationColor: Appcolor.primary,
                          ),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  // Action quand on clique sur "Créer un compte"
                                  // Get.back();
                                  // Get.toNamed(Routes.ACCOUNT_CHOICE);
                                },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
