import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';

class InviteFriendsBTN extends StatelessWidget {
  const InviteFriendsBTN({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Text(
            'Invite Friends',
            style: TextStyle(
              color: AppColors.kLightBlue,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(width: 5.w),
          Icon(
            Icons.ios_share,
            size: 20.sp,
            color: AppColors.kBlack,
          ),
        ],
      ),
    );
  }
}
