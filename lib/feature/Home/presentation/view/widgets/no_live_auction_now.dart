import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class NoLiveAuctionNow extends StatelessWidget {
  const NoLiveAuctionNow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "There are no live shows at the moment",
          style: TextStyle(
            color: AppColors.kGray,
            fontFamily: AppFonts.kPoppins500,
            fontSize: 12.sp,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          "Start live streaming now",
          style: TextStyle(
            color: Colors.red,
            fontFamily: AppFonts.kPoppins700,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
