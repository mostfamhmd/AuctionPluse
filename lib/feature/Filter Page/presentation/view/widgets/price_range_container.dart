import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class PriceRangeContainer extends StatelessWidget {
  const PriceRangeContainer({super.key, required this.priceRange});

  final String priceRange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 180.w,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(color: AppColors.kGray.withOpacity(0.5)),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          r"$" + priceRange,
          style: AppStyles.kPoppins700
              .copyWith(color: AppColors.kGray, fontSize: 14.sp),
        ),
      ),
    );
  }
}