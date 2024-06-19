import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/widgets/Components/custom_title.dart';

class AppBarScheduleLive extends StatelessWidget {
  const AppBarScheduleLive({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      margin: EdgeInsets.only(bottom: 50.h),
      width: double.infinity,
      color: AppColors.kWhite,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios,
                size: 20.sp,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            CustomTitle(
              title: 'Upcoming live shows',
              fontSize: 16.sp,
            ),
            const Spacer(
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }
}
