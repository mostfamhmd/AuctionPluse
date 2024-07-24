import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';

TextFormField customTextFormField({
  TextEditingController? controller,
  required TextInputType keyboardType,
  IconData? prefixIcon,
  String? lableText,
  String? hintText,
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
      //contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      border: outlineInputBorder(),
      enabledBorder: outlineInputBorder(),
      focusedBorder: outlineInputBorder(),
      prefixIcon: Icon(prefixIcon),
      suffixIcon: suffixIcon,
      labelText: lableText,
      labelStyle: const TextStyle(color: AppColors.kGray),
      hintText: hintText,
      hintStyle: const TextStyle(color: AppColors.kGray),
    ),
  );
}

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.r),
    borderSide: const BorderSide(color: AppColors.kGray),
  );
}
