// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class ActionButtonForDialog extends StatelessWidget {
  const ActionButtonForDialog({
    super.key,
    required this.nameBTN,
    this.onTap,
  });
  final String nameBTN;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        child: Text(
          nameBTN,
          style: TextStyle(
            fontFamily: AppFonts.kInter700,
            color: AppColors.kLightBlue,
            fontSize: 16.sp,
          ),
        ));
  }
}
