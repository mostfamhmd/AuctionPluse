import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/BestSeller/rating_best_seller.dart';

class PriceAndRatingBestSeller extends StatelessWidget {
  const PriceAndRatingBestSeller({super.key, required this.productOfferPrice, required this.productRating});
final String productOfferPrice;
final String productRating;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          productOfferPrice,
          style: AppStyles.kPoppins700.copyWith(
            fontSize: 13.sp,
            color: AppColors.kBlue,
          ),
        ),
        RatingBestSeller(productRating: productRating,),
      ],
    );
  }
}
