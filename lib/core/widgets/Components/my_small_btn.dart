import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/styles.dart';

class MySmallBTN extends StatelessWidget {
  const MySmallBTN({
    super.key,
    required this.nameButton,
    this.onTap,
    this.child,
  });
  final String nameButton;
  final void Function()? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: IntrinsicWidth(
        child: Container(
          height: 45.h,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
            color: AppColors.kLightBlue,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: child ??
              Center(
                child: Text(
                  nameButton,
                  style: AppStyles.kPoppins500
                      .copyWith(fontSize: 18.sp, color: AppColors.kBlack),
                ),
              ),
        ),
      ),
    );
  }
}
