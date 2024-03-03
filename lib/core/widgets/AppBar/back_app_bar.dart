import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/utils/styles.dart';

PreferredSizeWidget backAppBar(BuildContext context, String nameView) {
  return AppBar(
    elevation: 3,
    toolbarHeight: 80.h,
    backgroundColor: Colors.white,
    leading: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: SvgPicture.asset(
        AppIcons.kArrowBack,
        fit: BoxFit.none,
      ),
    ),
    title: Text(
      nameView,
      style: AppStyles.kPoppins700.copyWith(fontSize: 16.sp),
    ),

  );
}
