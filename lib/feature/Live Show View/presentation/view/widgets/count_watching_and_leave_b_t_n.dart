import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/feature/Live%20Show%20View/presentation/view/widgets/leave_b_t_n.dart';

class CountWatchingAndLeaveBTN extends StatelessWidget {
  const CountWatchingAndLeaveBTN({
    super.key,
    required this.watching,
    required this.leave,
  });
  final int watching;
  final String leave;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.remove_red_eye, size: 16.sp),
        Text(
          watching.toString(),
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: AppFonts.kPoppins500,
          ),
        ),
        LeaveBTN(
          leave: leave,
        ),
      ],
    );
  }
}
