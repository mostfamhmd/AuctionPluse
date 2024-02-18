import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/feature/Filter%20Page/presentation/view/filter_page.dart';
import 'package:smart_auction/core/widgets/Components/search_field.dart';

import '../../../feature/Sort Page/presentation/view/sort_page.dart';

PreferredSizeWidget searchResultAppBar() {
  return AppBar(
    elevation: 1,
    toolbarHeight: 90.h,
    backgroundColor: AppColors.kWhite.withOpacity(0.8),
    leading: Padding(
      padding: EdgeInsets.only(left: 25.w, top: 10.h),
      child: SizedBox(
        width: 280.w,
        child: SearchField(
          textEditingController: TextEditingController(),
        ),
      ),
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
                child: SvgPicture.asset(AppIcons.kFilter)),
            SizedBox(
              width: 20.w,
            ),
          ],
        );
      })
    ],
  );
}
