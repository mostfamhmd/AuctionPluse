import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class RateText extends StatelessWidget {
  const RateText({
    super.key,
    required this.rate,
  });
  final num rate;
  @override
  Widget build(BuildContext context) {
    return Text(
      rate.toString(),
      style: TextStyle(
        color: AppColors.kOrange,
        fontFamily: AppFonts.kPoppins700,
        fontSize: 16.sp,
      ),
    );
  }
}
