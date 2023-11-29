import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/styles.dart';

class TimerSlider extends StatelessWidget {
  const TimerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideCountdownSeparated(
      duration: const Duration(hours: 9),
      style: AppStyles.kPoppins700.copyWith(
        fontSize: 16.sp,
        color: AppColors.kDarkBlue,
      ),
      separator: ":",
      separatorStyle: AppStyles.kPoppins700.copyWith(
        fontSize: 14.sp,
        color: AppColors.kWhite,
      ),
      separatorPadding: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.all(
          Radius.circular(5.r),
        ),
      ),
    );
  }
}
