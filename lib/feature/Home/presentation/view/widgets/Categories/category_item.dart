import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/images.dart';
import 'package:smart_auction/core/utils/styles.dart';

class CategriesItem extends StatelessWidget {
  const CategriesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 110.h,
          width: 70.w,
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Image.asset(
                  AppImages.kIphone13,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 25.h,
                ),
                Text(
                  "Iphone 13",
                  style: AppStyles.kPoppins500.copyWith(
                    color: AppColors.kBlack,
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
