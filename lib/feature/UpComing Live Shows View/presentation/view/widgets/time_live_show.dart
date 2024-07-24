import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class TimeLiveShow extends StatelessWidget {
  const TimeLiveShow({
    super.key,
    required this.timeLiveShow,
  });
  final String timeLiveShow;
  @override
  Widget build(BuildContext context) {
    return Text(
      timeLiveShow,
      style: TextStyle(
        fontFamily: AppFonts.kPoppins700,
        fontSize: 16.sp,
      ),
    );
  }
}
