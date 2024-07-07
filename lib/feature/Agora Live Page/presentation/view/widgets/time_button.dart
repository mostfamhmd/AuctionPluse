// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class TimeButton extends StatelessWidget {
  const TimeButton({
    super.key,
    required this.time,
    this.onTap,
  });
  final String time;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        time,
        style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.kGray,
            fontFamily: AppFonts.kPoppins500),
      ),
    );
  }
}
