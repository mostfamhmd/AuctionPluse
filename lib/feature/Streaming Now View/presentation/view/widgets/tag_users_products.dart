import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class TagUsersProducts extends StatelessWidget {
  const TagUsersProducts({
    super.key,
    required this.tagName,
    this.onTap,
  });
  final String tagName;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: 130.w,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.kLightBlue, width: 2.w),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(
            'Tag $tagName +',
            style: TextStyle(
              fontFamily: AppFonts.kPoppins400,
              fontSize: 14.sp,
              color: AppColors.kBlack,
            ),
          ),
        ),
      ),
    );
  }
}
