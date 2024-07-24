import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class ShareText extends StatelessWidget {
  const ShareText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Share',
      style: TextStyle(
        color: AppColors.kBlue,
        fontFamily: AppFonts.kPoppins700,
        fontSize: 14.sp,
      ),
    );
  }
}
