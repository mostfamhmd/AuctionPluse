import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/fonts.dart';

class Specification extends StatelessWidget {
  const Specification({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "6.7-inch Super Retina XDR display with Always On and Pro Motion functionality\n48-megapixel main camera with 4 times higher resolution\nCinema mode now in Dolby Vision at 4K resolution up to 30 frames per second\nMotion mode for smooth, freely shot videos IMPORTANT SAFETY FEATURE - Accident detection, call",
      style: TextStyle(
        fontFamily: AppFonts.kPoppins400,
        fontSize: 14.sp,
        color: AppColors.kGray,
      ),
    );
  }
}
