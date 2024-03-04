import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/fonts.dart';

class ApplyBTN extends StatelessWidget {
  const ApplyBTN({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        height: 70.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.r),
            bottomRight: Radius.circular(10.r),
          ),
          color: AppColors.kLightBlue,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 20.w,
            ),
            Center(
              child: Text(
                "Apply",
                style: TextStyle(
                  fontFamily: AppFonts.kPoppins700,
                  fontSize: 12.sp,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
          ],
        ),
      ),
    );
  }
}
