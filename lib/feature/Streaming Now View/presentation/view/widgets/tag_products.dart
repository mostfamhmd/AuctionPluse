import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class TagProducts extends StatelessWidget {
  const TagProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 130.w,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kLightBlue, width: 2.w),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: Text(
          'Tag Products +',
          style: TextStyle(
            fontFamily: AppFonts.kPoppins400,
            fontSize: 14.sp,
            color: AppColors.kBlack,
          ),
        ),
      ),
    );
  }
}
