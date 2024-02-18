import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors.dart';
import '../../utils/icons.dart';
import '../../utils/styles.dart';

class ResultsAndCategories extends StatelessWidget {
  const ResultsAndCategories({super.key, required this.numResults});

  final int numResults;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$numResults Result",
          style: AppStyles.kPoppins700.copyWith(
            fontSize: 16.sp,
            color: AppColors.kGray,
          ),
        ),
        const Spacer(
          flex: 15,
        ),
        Text(
          "Category",
          style: AppStyles.kPoppins700.copyWith(
            fontSize: 13.sp,
            color: AppColors.kDarkBlue,
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        RotatedBox(
          quarterTurns: 0,
          child: SvgPicture.asset(
            AppIcons.kArrowMenu,
          ),
        )
      ],
    );
  }
}
