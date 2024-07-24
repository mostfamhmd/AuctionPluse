import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class NameHost extends StatelessWidget {
  const NameHost({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        fontFamily: AppFonts.kPoppins700,
        color: AppColors.kGray,
        fontSize: 12.sp,
      ),
    );
  }
}
