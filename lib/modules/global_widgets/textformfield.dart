import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final bool? isPassword;
  final TextInputType? keyboardType;
  final IconData? icon;
  final String? Function(String?)? validator;

  const TextFieldWidget({
    super.key,
    this.controller,
    required this.label,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.icon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label ?? "",
          // style: Get.textTheme.bodyLarge,
          style: Get.textTheme.bodyMedium,
        ),
        TextFormField(
          controller: controller,
          obscureText: isPassword ?? false,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Get.theme.primaryColor, width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
            // enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
            prefixIcon: icon != null ? Icon(icon) : null,
          ),
        ),
      ],
    ).paddingOnly(bottom: 20);
  }
}
