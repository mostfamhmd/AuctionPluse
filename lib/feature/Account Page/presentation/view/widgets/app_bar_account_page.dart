import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';

AppBar appBarAccountPage() {
  return AppBar(
    elevation: 3,
    toolbarHeight: 80.h,
    title: Text(
      'Account',
      style: TextStyle(
        fontFamily: AppFonts.kPoppins700,
        color: AppColors.kDarkBlue,
        fontSize: 16.sp,
      ),
    ),
  );
}
