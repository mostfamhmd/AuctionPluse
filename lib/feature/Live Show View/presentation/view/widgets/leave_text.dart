import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class LeaveText extends StatelessWidget {
  const LeaveText({
    super.key,
    required this.leave,
  });
  final String leave;
  @override
  Widget build(BuildContext context) {
    return Text(
      leave,
      style: TextStyle(
        fontFamily: AppFonts.kInter700,
        color: AppColors.kRed,
        fontSize: 16.sp,
      ),
    );
  }
}
