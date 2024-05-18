import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';

import 'mic_icon.dart';
import 'name_and_host.dart';

class UserDataWhoMakeHost extends StatelessWidget {
  const UserDataWhoMakeHost({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.kGray.withOpacity(.3),
      ),
      child: Row(
        children: [
          // user avatar
          const CircleAvatar(
            backgroundColor: AppColors.kBlack,
          ),
          SizedBox(width: 10.w),
          // user name
          NameAndHost(
            name: name,
          ),
          const Spacer(),
          // mic
          const MicIcon(),
        ],
      ),
    );
  }
}
