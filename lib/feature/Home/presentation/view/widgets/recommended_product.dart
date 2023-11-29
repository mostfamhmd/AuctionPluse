import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/images.dart';
import 'package:smart_auction/core/utils/styles.dart';

class RecommendedProduct extends StatelessWidget {
  const RecommendedProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.h,
        width: double.infinity,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(
              AppImages.kRecommendedProduct,
            ),
            fit: BoxFit.none,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 50.h, left: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 70.h,
                width: 190.w,
                child: Text(
                  "Recomended Product",
                  maxLines: 2,
                  style: AppStyles.kPoppins700
                      .copyWith(fontSize: 24.sp, color: AppColors.kBlack),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "We recommend the best for you",
                style: AppStyles.kPoppins400
                    .copyWith(fontSize: 12.sp, color: AppColors.kBlack),
              ),
            ],
          ),
        ));
  }
}
