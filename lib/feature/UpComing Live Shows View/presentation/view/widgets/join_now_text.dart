import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class JoinNowText extends StatelessWidget {
  const JoinNowText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Join Now",
      style: TextStyle(
        fontFamily: AppFonts.kInter500,
        fontSize: 12.sp,
        color: AppColors.kBlack,
      ),
    );
  }
}
