import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class FollowText extends StatelessWidget {
  const FollowText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Follow',
      style: TextStyle(
          color: AppColors.kBlack,
          fontFamily: AppFonts.kPoppins700,
          fontSize: 14.sp),
    );
  }
}
