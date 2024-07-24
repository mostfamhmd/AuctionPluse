import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class TimeStartingLive extends StatelessWidget {
  const TimeStartingLive({
    super.key,
    required this.timeStartingLive,
  });
  final String timeStartingLive;
  @override
  Widget build(BuildContext context) {
    return Text(
      timeStartingLive,
      style: TextStyle(
        color: AppColors.kBlue,
        fontFamily: AppFonts.kInter500,
        fontSize: 16.sp,
      ),
    );
  }
}
