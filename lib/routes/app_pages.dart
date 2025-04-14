import 'package:get/get.dart';
import 'package:wallet_project/modules/auth/views/login.dart';
import 'package:wallet_project/modules/home/views/home.dart';
import 'package:wallet_project/modules/auth/views/register.dart';

import 'package:wallet_project/modules/auth/binding/auth_binding.dart';

import 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.login;
  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => RegisterView(),
      binding: AuthBinding(),
    ),
  ];
}
