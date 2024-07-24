import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/fonts.dart';

class CustomPrice extends StatelessWidget {
  const CustomPrice(
      {super.key,
      required this.typePrice,
      required this.price,
      required this.isTotal});

  final String typePrice;
  final String price;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          typePrice,
          style: isTotal == true
              ? TextStyle(
                  color: AppColors.kDarkBlue,
                  fontSize: 12.sp,
                  fontFamily: AppFonts.kPoppins700,
                )
              : TextStyle(
                  fontFamily: AppFonts.kPoppins400,
                  fontSize: 12.sp,
                  color: AppColors.kGray,
                ),
        ),
        Text(
          price,
          style: isTotal == true
              ? TextStyle(
                  color: AppColors.kLightBlue,
                  fontSize: 12.sp,
                  fontFamily: AppFonts.kPoppins700,
                )
              : TextStyle(
                  fontFamily: AppFonts.kPoppins400,
                  fontSize: 12.sp,
                  color: AppColors.kDarkBlue,
                ),
        ),
      ],
    );
  }
}
