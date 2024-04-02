import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class SigninToContinue extends StatelessWidget {
  const SigninToContinue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Sign in to continue',
        style: TextStyle(
          fontFamily: AppFonts.kInter400,
          color: AppColors.kGray,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
