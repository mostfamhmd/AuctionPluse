import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/BestSeller/rating_best_seller.dart';

class PriceAndRatingBestSeller extends StatelessWidget {
  const PriceAndRatingBestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          r"$299,43",
          style: AppStyles.kPoppins700.copyWith(
            fontSize: 14.sp,
            color: AppColors.kBlue,
          ),
        ),
        const RatingBestSeller(),
      ],
    );
  }
}
