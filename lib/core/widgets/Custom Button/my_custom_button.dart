import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/styles.dart';

class MyCustomButton extends StatelessWidget {
  const MyCustomButton({super.key, required this.nameButton});
  final String nameButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: 180.w,
      decoration: BoxDecoration(
        color: AppColors.kLightBlue,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
          child: Text(
        nameButton,
        style: AppStyles.kPoppins500
            .copyWith(fontSize: 18.sp, color: AppColors.kBlack),
      )),
    );
  }
}
