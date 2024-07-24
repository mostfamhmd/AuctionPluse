import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors.dart';
import '../../utils/icons.dart';
import '../../utils/styles.dart';

PreferredSizeWidget nameAppBar(
  BuildContext context,
  String nameView,
) {
  return AppBar(
    elevation: 3,
    toolbarHeight: 80.h,
    backgroundColor: AppColors.kWhite,
    title: Padding(
      padding: EdgeInsets.only(
        left: 10.w,
      ),
      child: Text(
        nameView,
        style: AppStyles.kPoppins700.copyWith(fontSize: 16.sp),
      ),
    ),
    actions: [
      Builder(
        builder: (BuildContext innerContext) {
          return Padding(
            padding: EdgeInsets.only(
              right: 10.w,
            ),
            child: InkWell(
              onTap: () {
                Scaffold.of(innerContext).openEndDrawer();
              },
              child: SvgPicture.asset(AppIcons.kMore),
            ),
          );
        },
      ),
    ],
  );
}
