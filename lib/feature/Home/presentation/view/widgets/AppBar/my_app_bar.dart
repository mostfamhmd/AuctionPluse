import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/AppBar/search_field.dart';

PreferredSizeWidget myAppBar() {
  return AppBar(
    elevation: 1,
    toolbarHeight: 90.h,
    backgroundColor: Colors.white,
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
      Builder(builder: (BuildContext innerContext) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              AppIcons.kFavorite,
              fit: BoxFit.none,
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
