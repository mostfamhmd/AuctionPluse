// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/utils/icons.dart';

class ViewTabBar extends StatelessWidget {
  const ViewTabBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // There are no live shows at the moment
        Text(
          'There are no live shows at the moment for $title',
          style: TextStyle(
            fontFamily: AppFonts.kPoppins500,
            fontSize: 14.sp,
            color: AppColors.kGray,
          ),
        ),

        SizedBox(height: 30.h),

        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppIcons.kVoice),
        ),

        SizedBox(height: 30.h),

        // start live streaming now
        Text(
          'Start live streaming now',
          style: TextStyle(
            fontFamily: AppFonts.kPoppins500,
            color: AppColors.kRed,
            fontSize: 18.sp,
          ),
        ),
      ],
    );
  }
}
