import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.title, this.fontSize});

  final String title;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize ?? 14.sp,
        fontFamily: AppFonts.kPoppins700,
        color: AppColors.kDarkBlue,
      ),
    );
  }
}
