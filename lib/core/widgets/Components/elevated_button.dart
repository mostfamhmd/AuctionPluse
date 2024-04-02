import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';

ElevatedButton customElevatedButton(
  BuildContext context, {
  required String title,
  required void Function() onPressed,
  Color backgroundColor = AppColors.kLightBlue,
}) {
  return ElevatedButton(
    style: ButtonStyle(
      fixedSize: MaterialStatePropertyAll(
        Size(181.w, 57.h),
      ),
      backgroundColor: MaterialStatePropertyAll(
        backgroundColor,
      ),
      foregroundColor: const MaterialStatePropertyAll(
        AppColors.kBlack,
      ),
    ),
    onPressed: onPressed,
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontFamily: AppFonts.kPoppins700,
      ),
    ),
  );
}
