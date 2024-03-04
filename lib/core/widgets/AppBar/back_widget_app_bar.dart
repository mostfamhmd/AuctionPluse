import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../feature/Search Page/presentation/view/search_page.dart';
import '../../utils/colors.dart';
import '../../utils/icons.dart';
import '../../utils/styles.dart';

PreferredSizeWidget backWidgetAppBar(BuildContext context,
    String nameView,
    String? pathIcon,
    Color? color,
    void Function()? onTap,
    {bool isBack = true}) {
  return AppBar(
    elevation: 3,
    toolbarHeight: 80.h,
    backgroundColor: AppColors.kWhite,
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
      Builder(
        builder: (BuildContext innerContext) {
          return Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: pathIcon != null
                ? Row(
              children: [
                InkWell(
                  onTap: onTap,
                  child: SvgPicture.asset(
                    pathIcon,
                    height: 24.h,
                    width: 24.w,
                    colorFilter:
                    ColorFilter.mode(color!, BlendMode.srcIn),
                  ),
                ),
              ],
            )
                : const Center(),
          );
        },
      )
    ],
  );
}
