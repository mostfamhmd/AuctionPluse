import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class MinMaxRowRange extends StatelessWidget {
  const MinMaxRowRange({super.key, required this.kMin, required this.kMax});

  final String kMin;
  final String kMax;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          kMin,
          style: AppStyles.kPoppins700
              .copyWith(color: AppColors.kGray, fontSize: 14.sp),
        ),
        Text(
          kMax,
          style: AppStyles.kPoppins700
              .copyWith(color: AppColors.kGray, fontSize: 14.sp),
        ),
      ],
    );
  }
}
