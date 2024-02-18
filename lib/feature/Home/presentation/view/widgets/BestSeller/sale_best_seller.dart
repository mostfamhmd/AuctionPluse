import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/styles.dart';

class SaleBestSeller extends StatelessWidget {
  const SaleBestSeller({super.key, required this.productRealPrice, required this.productOfferPercentage});
final String productRealPrice;
final String productOfferPercentage;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          productRealPrice,
          style: AppStyles.kInter400.copyWith(
              fontSize: 13.sp,
              color: AppColors.kGray,
              decoration: TextDecoration.lineThrough,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          "$productOfferPercentage Off",
          style: AppStyles.kPoppins700
              .copyWith(color: AppColors.kRed, fontSize: 12.sp),
        ),
      ],
    );
  }
}
