import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/feature/Waiting%20Room/presentation/view/widgets/followers_count.dart';
import 'package:smart_auction/feature/Waiting%20Room/presentation/view/widgets/user_data.dart';

class NameOfHost extends StatelessWidget {
  const NameOfHost({
    super.key,
    required this.name,
    required this.rate,
    required this.onFollowTap,
    required this.followers,
  });
  final String name;
  final num rate;
  final void Function() onFollowTap;
  final int followers;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            fontFamily: AppFonts.kInter500,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 10.h),
        // user data
        userData(context, rate: rate, onFollowTap: onFollowTap),
        // followers count
        followersCount(followers: followers),
      ],
    );
  }
}
