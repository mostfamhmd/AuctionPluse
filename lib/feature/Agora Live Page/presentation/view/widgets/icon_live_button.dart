import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/utils/icons.dart';

class IconLiveButton extends StatelessWidget {
  const IconLiveButton({
    super.key,
    this.name,
    this.icon,
  });
  final String? name;
  final dynamic icon;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: name != null && name!.isNotEmpty ? 40.r : 30.r,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon is String
                ? icon == AppIcons.kAuction
                    ? SvgPicture.asset(
                        icon,
                        height: 30.h,
                        width: 30.w,
                        colorFilter: const ColorFilter.mode(
                            AppColors.kBlack, BlendMode.srcIn),
                      )
                    : SvgPicture.asset(
                        icon,
                        fit: BoxFit.fill,
                      )
                : Icon(icon, color: Colors.black, size: 25.sp),
            if (name != null && name!.isNotEmpty)
              Text(name!,
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black,
                      fontFamily: AppFonts.kPoppins500))
          ],
        ),
      ),
    );
  }
}
