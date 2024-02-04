import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/icons.dart';
import '../../../../../core/utils/styles.dart';

PreferredSizeWidget famousBrandsAppBar(BuildContext context, String nameView) {
  return AppBar(
    elevation: 1,
    toolbarHeight: 90.h,
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
    actions: [
      Builder(builder: (BuildContext innerContext) {
        return Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: SvgPicture.asset(
            AppIcons.kSearch,
            fit: BoxFit.fill,
            color: Colors.grey,
          ),
        );
      })
    ],
  );
}
