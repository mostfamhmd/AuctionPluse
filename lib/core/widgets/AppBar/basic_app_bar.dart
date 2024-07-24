import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/feature/Search%20Page/presentation/view/search_page.dart';

import '../../utils/icons.dart';
import '../../utils/styles.dart';

PreferredSizeWidget basicAppBar(BuildContext context, String nameView) {
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
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchPage(),
                      ),
                    );
                  },
                  child: SvgPicture.asset(
                    AppIcons.kSearch,
                    height: 24.h,
                    width: 24.w,
                    colorFilter: const ColorFilter.mode(
                        AppColors.kGray, BlendMode.srcIn),
                  ),
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
                  },
                ),
              ],
            ),
          );
        },
      )
    ],
  );
}
