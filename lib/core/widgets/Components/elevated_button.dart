import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';

ElevatedButton customElevatedButton(
  BuildContext context, {
  double? fontSize,
  required String title,
  required void Function() onPressed,
  Color backgroundColor = AppColors.kLightBlue,
}) {
  return ElevatedButton(
    style: ButtonStyle(
      fixedSize: WidgetStatePropertyAll(
        Size(181.w, 57.h),
      ),
      backgroundColor: WidgetStatePropertyAll(
        backgroundColor,
      ),
      foregroundColor: const WidgetStatePropertyAll(
        AppColors.kBlack,
      ),
    ),
    onPressed: onPressed,
    child: Text(
      title,
      style: TextStyle(
        fontSize: fontSize ?? 14.sp,
        fontFamily: AppFonts.kPoppins700,
      ),
    ),
  );
}
