import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/utils/styles.dart';

PreferredSizeWidget myCustomAppBar(BuildContext context, String nameView) {
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
    title: Row(
      children: [
        Text(
          nameView,
          style: AppStyles.kPoppins700.copyWith(fontSize: 16.sp),
        ),
        const Spacer(),
        SvgPicture.asset(
          AppIcons.kExplore,
          fit: BoxFit.none,
        ),
      ],
    ),
    actions: [
      Builder(builder: (BuildContext innerContext) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Scaffold.of(innerContext).openEndDrawer();
              },
              child: SvgPicture.asset(AppIcons.kMore),
            ),
            SizedBox(
              width: 20.w,
            ),
          ],
        );
      })
    ],
  );
}
