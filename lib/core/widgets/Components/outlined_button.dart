import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';

OutlinedButton customOutlinedButton(
  BuildContext context, {
  required void Function() onPressed,
  required String title,
}) {
  return OutlinedButton(
    style: ButtonStyle(
      fixedSize: WidgetStatePropertyAll(
        Size(181.w, 57.h),
      ),
      foregroundColor: const WidgetStatePropertyAll(
        AppColors.kWhite,
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(
            color: AppColors.kLightBlue,
          ),
        ),
      ),
    ),
    onPressed: onPressed,
    child: Text(title),
  );
}
