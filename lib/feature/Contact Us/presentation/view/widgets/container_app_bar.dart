import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/fonts.dart';
import '../../../../../core/utils/icons.dart';
import '../../../../../core/utils/images.dart';
import '../../../../../core/utils/styles.dart';

class ContainerAppBar extends StatelessWidget {
  const ContainerAppBar({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: 305.h,
          padding: EdgeInsets.only(top: 60.h),
          decoration: BoxDecoration(
            color: AppColors.kLightBlue,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25.r),
              bottomRight: Radius.circular(25.r),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 4,
              ),
              Text(
                "Contact Us",
                style: AppStyles.kPoppins700.copyWith(
                  color: Colors.black,
                  fontFamily: AppFonts.kPoppins700,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              InkWell(
                onTap: onTap,
                child: SvgPicture.asset(
                  AppIcons.kCancel,
                  colorFilter:
                      const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
        Positioned(
          top: 25.h,
          left: -40.w,
          child: Image.asset(AppImages.kContactUs),
        ),
        Positioned(
          top: 150.h,
          right: 15.w,
          child: SvgPicture.asset(
            AppIcons.kRotatedLogo,
          ),
        ),
        Positioned(
          top: 215.h,
          right: 50.w,
          child: Image.asset(AppImages.kPlus),
        ),
        Positioned(
          bottom: 15.h,
          right: 26.w,
          child: Image.asset(
            AppImages.kAuction,
            filterQuality: FilterQuality.high,
          ),
        ),
      ],
    );
  }
}
