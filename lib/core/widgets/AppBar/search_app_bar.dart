import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/icons.dart';

import '../../../feature/Favorite Page/presentation/view/favorite_page.dart';
import '../Components/search_field.dart';

PreferredSizeWidget searchAppBar(BuildContext context) {
  return AppBar(
    elevation: 3,
    backgroundColor: AppColors.kWhite,
    toolbarHeight: 80.h,
    leading: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(AppIcons.kArrowBack),
        ),
        SizedBox(
          width: 270.w,
          height: 55.h,
          child: SearchField(
            textEditingController: TextEditingController(),
          ),
        ),
      ],
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
