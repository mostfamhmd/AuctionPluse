import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/rating_widget.dart';

class PriceRatingProduct extends StatelessWidget {
  const PriceRatingProduct(
      {super.key, required this.productPrice, required this.rating});
  final String productPrice;
  final num rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          productPrice,
          style: AppStyles.kInter700
              .copyWith(fontSize: 22.sp, color: AppColors.kLightBlue),
        ),
        const Spacer(),
        RatingWidget(
          rating: rating,
        )
      ],
    );
  }
}
