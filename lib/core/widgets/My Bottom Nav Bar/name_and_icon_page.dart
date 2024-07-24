import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors.dart';
import '../../utils/styles.dart';

class NameAndIconPage extends StatelessWidget {
  const NameAndIconPage(
      {super.key,
      required this.currentIndex,
      required this.myIndex,
      required this.pageName,
      required this.pageIcon});

  final int currentIndex;
  final int myIndex;
  final String pageName;
  final String pageIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          pageIcon,
          colorFilter: ColorFilter.mode(
              currentIndex == myIndex ? AppColors.kLightBlue : AppColors.kGray,
              BlendMode.srcIn),
        ),
        Text(
          pageName,
          style: currentIndex == myIndex
              ? AppStyles.kPoppins700.copyWith(
                  fontSize: 10.sp,
                  color: AppColors.kLightBlue,
                )
              : AppStyles.kPoppins400.copyWith(
                  fontSize: 10.sp,
                  color: AppColors.kGray,
                ),
        ),
      ],
    );
  }
}
