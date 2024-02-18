import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/utils/styles.dart';

class RatingBestSeller extends StatelessWidget {
  const RatingBestSeller({super.key, required this.productRating});
final String productRating;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          productRating,
          style: AppStyles.kInter400
              .copyWith(fontSize: 11.sp, color: AppColors.kBlack, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          width: 5.w,
        ),
        SvgPicture.asset(AppIcons.kStar),
      ],
    );
  }
}
