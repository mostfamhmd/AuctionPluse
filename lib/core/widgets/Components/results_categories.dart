import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';
import '../../utils/styles.dart';

class ResultsAndCategories extends StatelessWidget {
  const ResultsAndCategories(
      {super.key, required this.numResults, required this.widget});

  final int numResults;
  final Widget widget;

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
/*Text(
          "Category",
          style: AppStyles.kPoppins700.copyWith(
            fontSize: 13.sp,
            color: AppColors.kDarkBlue,
          ),
        ),*/
        /*RotatedBox(
          quarterTurns: 0,
          child: SvgPicture.asset(
            AppIcons.kArrowMenu,
          ),
        ),*/