import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/fonts.dart';
import '../../../../../core/utils/images.dart';

class BuyingContainer extends StatelessWidget {
  const BuyingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(
          color: AppColors.kGray.withOpacity(0.3),
          width: 1.w,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(AppImages.kIphone15),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "iPhone 15 pro max",
                style: TextStyle(
                  color: AppColors.kDarkBlue,
                  fontFamily: AppFonts.kPoppins700,
                  fontSize: 12.sp,
                ),
              ),
              const Spacer(),
              Text(
                "256G , Full Box ",
                style: TextStyle(
                  color: AppColors.kGray,
                  fontFamily: AppFonts.kPoppins400,
                  fontSize: 11.sp,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Text(
                r"$299,43",
                style: TextStyle(
                  color: AppColors.kBlue,
                  fontFamily: AppFonts.kPoppins700,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: AppColors.kGray.withOpacity(0.4),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "-",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontFamily: AppFonts.kPoppins400,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "1",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontFamily: AppFonts.kPoppins400,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "+",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontFamily: AppFonts.kPoppins400,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
