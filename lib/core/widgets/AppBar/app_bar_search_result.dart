import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/widgets/Components/search_field.dart';
import 'package:smart_auction/feature/Filter%20Page/presentation/view/filter_page.dart';

import '../../../feature/Sort Page/presentation/view/sort_page.dart';

PreferredSizeWidget searchResultAppBar(BuildContext context) {
  return AppBar(
    elevation: 3,
    toolbarHeight: 80.h,
    backgroundColor: AppColors.kWhite,
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
      Builder(builder: (BuildContext context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SortPage(),
                  ),
                );
              },
              child: SvgPicture.asset(
                AppIcons.kSortBy,
                fit: BoxFit.none,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FilterPage(),
                  ),
                );
              },
              child: SvgPicture.asset(AppIcons.kFilter),
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
