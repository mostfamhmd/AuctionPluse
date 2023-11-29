import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/styles.dart';

class NameBestSeller extends StatelessWidget {
  const NameBestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      width: 90.w,
      child: Text(
        "T800 Ultra Smart Watch 49mm - Wireless Charging - NFC",
        maxLines: 6,
        style: AppStyles.kPoppins700.copyWith(
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
