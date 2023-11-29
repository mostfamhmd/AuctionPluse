import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/styles.dart';

class CustomMore extends StatelessWidget {
  const CustomMore({super.key, required this.type, required this.typeMore});
  final String type;
  final String typeMore;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          type,
          style: AppStyles.kPoppins700.copyWith(fontSize: 14.sp),
        ),
        Text(
          typeMore,
          style: AppStyles.kPoppins700.copyWith(
            fontSize: 14.sp,
            color: AppColors.kLightBlue,
          ),
        )
      ],
    );
  }
}
