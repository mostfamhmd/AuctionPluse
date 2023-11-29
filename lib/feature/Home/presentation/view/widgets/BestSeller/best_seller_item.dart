import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/images.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/BestSeller/name_best_seller.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/BestSeller/price_rating_best_seller.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/BestSeller/sale_best_seller.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270.h,
      width: 150.w,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.kGray.withOpacity(0.3),
            blurRadius: 4,
            blurStyle: BlurStyle.normal,
            offset: const Offset(8, 0),
          ),
          BoxShadow(
            color: AppColors.kGray.withOpacity(0.3),
            blurRadius: 4,
            blurStyle: BlurStyle.normal,
            offset: const Offset(-8, 0),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.h,
            ),
            Center(
              child: Image.asset(AppImages.kTUltraSmartWatch),
            ),
            const NameBestSeller(),
            const PriceAndRatingBestSeller(),
            const SaleBestSeller(),
          ],
        ),
      ),
    );
  }
}
