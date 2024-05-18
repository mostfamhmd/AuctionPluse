import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class HostText extends StatelessWidget {
  const HostText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Host',
      style: TextStyle(
        color: AppColors.kGray,
        fontFamily: AppFonts.kPoppins400,
        fontSize: 13.sp,
      ),
    );
  }
}
