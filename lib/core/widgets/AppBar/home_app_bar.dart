import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/feature/Search%20Page/presentation/view/search_page.dart';

import '../../../feature/Favorite Page/presentation/view/favorite_page.dart';
import '../../utils/styles.dart';

PreferredSizeWidget homeAppBar(BuildContext context) {
  return AppBar(
    elevation: 3,
    backgroundColor: AppColors.kWhite,
    toolbarHeight: 80.h,
    leading: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SearchPage(),
          ),
        );
      },
      child: Container(
        width: 280.w,
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
        ),
        margin: EdgeInsets.only(left: 25.w, top: 10.h),
        decoration: BoxDecoration(
          color: AppColors.kWhite,
          border: Border.all(width: 1.w, color: AppColors.kGray),
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              AppIcons.kSearch,
              fit: BoxFit.none,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "Search Product",
              style: AppStyles.kPoppins400.copyWith(),
            ),
          ],
        ),
      ),
    ),
    leadingWidth: 310.w,
    actions: [
      Builder(builder: (BuildContext innerContext) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavoritePage(),
                  ),
                );
              },
              child: SvgPicture.asset(
                AppIcons.kFavorite,
                fit: BoxFit.none,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
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
