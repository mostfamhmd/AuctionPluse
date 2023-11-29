import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/Drawer/body_profile_drawer.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/Drawer/options_drawer.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 340.w,
      child: Padding(
        padding: EdgeInsets.only(top: 40.h, left: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BodyProfileDrawer(),
            SizedBox(
              height: 25.h,
            ),
            Text(
              "Menu",
              style: AppStyles.kInter600.copyWith(
                fontSize: 28.sp,
                color: AppColors.kBlack,
              ),
            ),
            SizedBox(
              width: 100.w,
              child: Divider(
                color: AppColors.kBlack,
                thickness: 3.h,
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            const OptionsDrawer(),
          ],
        ),
      ),
    );
  }
}
