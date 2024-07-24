import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/widgets/Components/image_component.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/BestSeller/name_best_seller.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/BestSeller/price_rating_best_seller.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({
    super.key,
    required this.index,
    required this.urlLinkImage,
    required this.productName,
    required this.productRating,
    required this.productRealPrice,
    required this.productOfferPrice,
    required this.productOfferPercentage,
    required this.length,
  });

  final int index;
  final String urlLinkImage;
  final String productName;
  final String productRating;
  final String productRealPrice;
  final String productOfferPrice;
  final String productOfferPercentage;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: index == 0
            ? firstBoxShadow
            : index < length - 1
                ? middleBoxShadow
                : latestBoxShadow,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Center(
              child: ImageComponent(
                urlImage: urlLinkImage,
                height: 120.h,
                width: 150.w,
                radius: 5.r,
              ),
            ),
            const Spacer(),
            NameBestSeller(
              productName: productName,
            ),
            const Spacer(),
            PriceAndRatingBestSeller(
              productOfferPrice: productOfferPrice,
              productRating: productRating == "null" ? "0.0" : productRating,
            ),
            // const Spacer(),
            // SaleBestSeller(
            //   productRealPrice: productRealPrice,
            //   productOfferPercentage: productOfferPercentage,
            // ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

List<BoxShadow> middleBoxShadow = [
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
];
List<BoxShadow> firstBoxShadow = [
  BoxShadow(
    color: AppColors.kGray.withOpacity(0.3),
    blurRadius: 4,
    blurStyle: BlurStyle.normal,
    offset: const Offset(8, 0),
  ),
];
List<BoxShadow> latestBoxShadow = [
  BoxShadow(
    color: AppColors.kGray.withOpacity(0.3),
    blurRadius: 4,
    blurStyle: BlurStyle.normal,
    offset: const Offset(-8, 0),
  ),
];
