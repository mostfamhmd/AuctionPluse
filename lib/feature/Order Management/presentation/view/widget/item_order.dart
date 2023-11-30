import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/utils/images.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Products/price_rating_item.dart';
import 'package:smart_auction/feature/Order%20Management/presentation/view/widget/quantity_item.dart';

class ItemOrder extends StatelessWidget {
  const ItemOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 570.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 20.h),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(AppImages.kIphone15),
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "iphone 15 pro",
                style: AppStyles.kInter600.copyWith(
                  fontSize: 20.sp,
                ),
              ),
              SvgPicture.asset(AppIcons.kRemove),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Lorem ipsum dolor sit amet consectetur. Et risus a aliquet id lectus lacus sapien etiam",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.kInter400
                .copyWith(fontSize: 16.sp, color: AppColors.kGray),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "The brand : apple",
            style: AppStyles.kInter400
                .copyWith(fontSize: 16.sp, color: AppColors.kDarkBlue),
          ),
          SizedBox(
            height: 25.h,
          ),
          const QuantityProduct(),
          SizedBox(
            height: 20.h,
          ),
          const PriceRatingProduct(),
        ],
      ),
    );
  }
}
