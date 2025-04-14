import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_project/modules/global_widgets/button_widget.dart';
import 'package:wallet_project/modules/global_widgets/textformfield.dart';
import '../controller/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,

        backgroundColor: Get.theme.primaryColor,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: Get.height * 0.4,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [Color(0xff07c1d5), Color(0xff0090ac)],
                    center: Alignment.center,
                    radius: 0.5,
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
                bottom: 250,
                left: 10,
                child: Image.asset(
                  'assets/logo/Pochi_.png',
                  height: 200,
                  width: 250,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 290,
                left: 70,
                child: Text(
                  "Votre poche notre soucis",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff07c1d5),
                  ),
                ),
              ),
              Positioned(
                left: 70,
                top: 100,
                child: Image.asset(
                  'assets/logo/Wallet-pochi.png',
                  height: 250,
                  width: Get.width * 0.7,
                  fit: BoxFit.cover,
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
                TextFieldWidget(label: "Email"),
                SizedBox(height: 20),
                TextFieldWidget(label: "Mot de passe"),
                SizedBox(height: Get.height * 0.08),
                Obx(
                  () =>
                      controller.isLoading.value
                          ? CircularProgressIndicator()
                          : ButtonWidget(
                            textColor: Get.theme.scaffoldBackgroundColor,
                            height: 55,
                            color: Get.theme.primaryColor,
                            width: Get.width,
                            text: "Se connecter",
                            onPressed: () => controller.login(),
                          ),
                ),
                SizedBox(height: Get.height * 0.03),
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
                          color: Color(0xff67dcff),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xff67dcff),
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
    );
  }
}
