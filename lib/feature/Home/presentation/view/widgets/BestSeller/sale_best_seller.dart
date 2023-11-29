import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/styles.dart';

class SaleBestSeller extends StatelessWidget {
  const SaleBestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          r"$534,33",
          style: AppStyles.kInter400.copyWith(
              fontSize: 10.sp,
              color: AppColors.kGray,
              decoration: TextDecoration.lineThrough),
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          "24% Off",
          style: AppStyles.kPoppins700
              .copyWith(color: AppColors.kRed, fontSize: 10.sp),
        ),
      ],
    );
  }
}
