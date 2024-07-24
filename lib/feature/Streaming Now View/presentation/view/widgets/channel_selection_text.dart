import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class ChannelSelectionText extends StatelessWidget {
  const ChannelSelectionText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // channel selection
        Text(
          'Channel selection',
          style: TextStyle(
            fontFamily: AppFonts.kPoppins700,
            fontSize: 16.sp,
          ),
        ),

        // Select the channel for live broadcast
        Text(
          'Select the channel for live broadcast',
          style: TextStyle(
            fontFamily: AppFonts.kPoppins400,
            fontSize: 14.sp,
            color: AppColors.kGray,
          ),
        ),
      ],
    );
  }
}
