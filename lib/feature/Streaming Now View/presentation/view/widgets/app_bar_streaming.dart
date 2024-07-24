import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';

AppBar appBarStreamingNow(BuildContext context) {
  return AppBar(
    surfaceTintColor: AppColors.kWhite,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Padding(
        padding: EdgeInsets.only(left: 8.w, top: 10.h),
        child: Icon(
          Icons.close,
          size: 40.sp,
          color: AppColors.kGray,
        ),
      ),
    ),
  );
}
