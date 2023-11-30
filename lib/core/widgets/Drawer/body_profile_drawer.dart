import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Drawer/profile_picture.dart';

class BodyProfileDrawer extends StatelessWidget {
  const BodyProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(children: [
        const ProfilePicture(),
        SizedBox(
          height: 20.h,
        ),
        Text(
          "Eslam Nasr",
          style: AppStyles.kInter700.copyWith(fontSize: 32.sp),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          "eslamnasr@gmail.com",
          style: AppStyles.kInter400
              .copyWith(fontSize: 18.sp, color: AppColors.kGray),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          height: 55.h,
          width: 270.w,
          decoration: BoxDecoration(
            color: AppColors.kLightBlue,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Text(
              "Edit Profile",
              style: AppStyles.kInter500
                  .copyWith(fontSize: 20.sp, color: AppColors.kBlack),
            ),
          ),
        ),
      ]),
    );
  }
}
