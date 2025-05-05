import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_project/modules/global_widgets/button_widget.dart';
import 'package:wallet_project/modules/global_widgets/textformfield.dart';
import 'package:wallet_project/routes/app_routes.dart';
import '../controller/auth_controller.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: true,
      //   title: Text("Créer un compte"),

      //   backgroundColor: Get.theme.primaryColor,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: Get.height * 0.3,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Get.theme.colorScheme.primary,
                        Get.theme.colorScheme.secondary,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.shade400, // Couleur de l'ombre
                    //     spreadRadius: 2, // Étend l'ombre
                    //     blurRadius: 10, // Flou de l'ombre
                    //     offset: Offset(3, 3), // Décalage de l'ombre (X, Y)
                    //   ),
                    // ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35),
                    ),
                  ),
                ),
                Positioned(
                  // bottom: 250,
                  // left: 10,
                  bottom: Get.height * 0.1,
                  left: Get.width * 0.03,
                  child: Image.asset(
                    'assets/logo/Pochi_.png',
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
                  bottom: Get.height * 0.16,
                  left: Get.width * 0.2,
                  child: Text(
                    "Votre poche notre soucis",
                    style: TextStyle(
                      fontSize: Get.textScaleFactor * 24,
                      fontWeight: FontWeight.bold,
                      color: Get.theme.colorScheme.secondary,
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: controller.registerformKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    TextFieldWidget(
                      label: "Nom et prénom",
                      validator:
                          (input) =>
                              input!.length < 3
                                  ? "Plus de 3 caractères sont nécessaires"
                                  : null,
                    ),
                    TextFieldWidget(
                      label: "Email",
                      onSaved: (input) => controller.email.value = input!,
                      validator:
                          (input) =>
                              !input!.contains('@')
                                  ? "Adresse email non valide".tr
                                  : null,
                    ),

                    TextFieldWidget(label: "Numéro de téléphone"),

                    TextFieldWidget(
                      label: "Mot de passe",
                      onSaved: (input) => controller.password.value = input!,
                      validator:
                          (input) =>
                              input!.length < 3 ? "Plus de 3 caractères" : null,
                    ),

                    TextFieldWidget(label: "Confirmer le mot de passe"),
                  ],
                ),
              ),
            ),

            Obx(
              () =>
                  controller.isLoading.value
                      ? CircularProgressIndicator()
                      : ButtonWidget(
                        textColor: Get.theme.scaffoldBackgroundColor,
                        height: 45,

                        color: Get.theme.primaryColor,
                        width: Get.width - 20,
                        text: "Créer un compte",
                        onPressed: () => controller.register,
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
                            Get.toNamed(AppRoutes.login);
                          },
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
