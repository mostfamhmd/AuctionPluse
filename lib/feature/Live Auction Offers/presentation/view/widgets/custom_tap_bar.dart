import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class CustomTapBar extends StatelessWidget {
  const CustomTapBar(
      {super.key,
      required this.index,
      required this.curent,
      required this.title,
      this.onTap});
  final int index;
  final ValueNotifier<int> curent;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ValueListenableBuilder(
        valueListenable: curent,
        builder: (BuildContext context, value, Widget? child) =>
            AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
          width: 100.w,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.5.w,
              color: value == index ? AppColors.kLightBlue : AppColors.kGray,
            ),
            borderRadius: BorderRadius.circular(25.r),
            color: value == index ? AppColors.kLightBlue : AppColors.kWhite,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                fontFamily: AppFonts.kPoppins500,
                color: value == index ? AppColors.kBlack : AppColors.kGray,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
