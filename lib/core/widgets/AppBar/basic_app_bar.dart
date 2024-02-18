import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';

import '../../utils/icons.dart';
import '../../utils/styles.dart';

PreferredSizeWidget basicAppBar(BuildContext context, String nameView) {
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
          child: Row(
            children: [
              SvgPicture.asset(
                AppIcons.kSearch,
                height: 24.h,
                width: 24.w,
                colorFilter: const ColorFilter.mode(AppColors.kGray, BlendMode.srcIn),
              ),
              SizedBox(
                width: 20.w,
              ),
              Builder(
                builder: (context) {
                  return InkWell(
                    onTap: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    child: SvgPicture.asset(AppIcons.kMore),
                  );
                }
              ),
            ],
          ),
        );
      })
    ],
  );
}
