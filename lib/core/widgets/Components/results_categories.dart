import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';
import '../../utils/styles.dart';

class ResultsAndCategories extends StatelessWidget {
  const ResultsAndCategories({super.key, required this.numResults});

  final int numResults;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$numResults Result",
          style: AppStyles.kPoppins700.copyWith(
            fontSize: 16.sp,
            color: AppColors.kGray,
          ),
        ),
      ],
    );
  }
}
