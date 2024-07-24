import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/fonts.dart';

class ContainerPriceForPayment extends StatelessWidget {
  const ContainerPriceForPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.symmetric(
        horizontal: 25.w,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30.r),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            color: AppColors.kGray.withOpacity(0.2),
            spreadRadius: 30.r,
            blurRadius: 30.r,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "For payment:",
                style: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.grey,
                  fontFamily: AppFonts.kInter600,
                ),
              ),
              const Spacer(),
              Text(
                r"$240,55",
                style: TextStyle(
                  fontSize: 24.sp,
                  color: AppColors.kGray,
                  fontFamily: AppFonts.kInter600,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Including VAT (21%)",
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey,
              fontFamily: AppFonts.kInter500,
            ),
          ),
        ],
      ),
    );
  }
}
