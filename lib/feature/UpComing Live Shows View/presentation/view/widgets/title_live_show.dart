import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class TitleLiveShow extends StatelessWidget {
  const TitleLiveShow({
    super.key,
    required this.titleLiveShow,
  });
  final String titleLiveShow;
  @override
  Widget build(BuildContext context) {
    return Text(
      titleLiveShow,
      style: TextStyle(
        fontFamily: AppFonts.kPoppins700,
        fontSize: 20.sp,
      ),
    );
  }
}
