import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/feature/Search%20Result/presentation/view/widgets/rating_result.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class ItemsResult extends StatelessWidget {
  ItemsResult(
      {super.key,
      required this.imageUrl,
      required this.nameProduct,
      required this.overPrice,
      required this.productPrice,
      required this.percentageOver,
      required this.rating});

  final String imageUrl;
  final String nameProduct;
  final String overPrice;
  final String productPrice;
  final String percentageOver;
  late double rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(imageUrl),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            nameProduct,
            style: AppStyles.kPoppins700.copyWith(fontSize: 12.sp),
          ),
          SizedBox(
            height: 5.h,
          ),
          RatingResults(rating : rating),
          SizedBox(
            height: 10.h,
          ),
          Text(
            overPrice,
            style: AppStyles.kPoppins700
                .copyWith(color: AppColors.kBlue, fontSize: 12.sp),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Text(
                productPrice,
                style: AppStyles.kPoppins400.copyWith(
                  fontSize: 13.sp,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                "$percentageOver% Off",
                style: AppStyles.kPoppins700
                    .copyWith(color: AppColors.kRed, fontSize: 12.sp),
              )
            ],
          )
        ],
      ),
    );
  }
}