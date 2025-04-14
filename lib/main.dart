import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_project/modules/auth/views/login.dart';
import 'package:wallet_project/themeData.dart';

import 'modules/auth/binding/login_binding.dart';
import 'modules/auth/controller/login_controller.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Get.put(LoginController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeService.lightTheme,
      themeMode: ThemeMode.light,
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginView(),
          binding: LoginBinding(),
        ),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
