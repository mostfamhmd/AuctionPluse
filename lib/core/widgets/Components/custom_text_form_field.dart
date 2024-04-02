import 'package:flutter/material.dart';
import 'package:smart_auction/core/utils/colors.dart';

TextFormField customTextFormField({
  TextEditingController? controller,
  required TextInputType keyboardType,
  IconData? prefixIcon,
  String? lableText,
  Widget? suffixIcon,
  bool obscureText = false,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    obscureText: obscureText,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: (value) {
      if (value!.isEmpty) {
        return 'Required';
      }
      return null;
    },
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: AppColors.kGray),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: AppColors.kGray),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: AppColors.kBlack),
      ),
      prefixIcon: Icon(prefixIcon),
      suffixIcon: suffixIcon,
      labelText: lableText,
      labelStyle: const TextStyle(color: AppColors.kBlack),
      hintText: lableText,
      hintStyle: const TextStyle(color: AppColors.kGray),
    ),
  );
}
