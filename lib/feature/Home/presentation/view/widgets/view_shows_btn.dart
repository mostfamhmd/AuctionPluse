import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/fonts.dart';

class ViewShowsBTN extends StatelessWidget {
  const ViewShowsBTN({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: 85.w,
      decoration: BoxDecoration(
        color: AppColors.kLightBlue,
        borderRadius: BorderRadius.circular(
          10.r,
        ),
      ),
      child: Center(
        child: Text(
          "View Shows",
          style: TextStyle(
            color: Colors.black,
            fontSize: 10.sp,
            fontFamily: AppFonts.kPoppins500,
          ),
        ),
      ),
    );
  }
}
