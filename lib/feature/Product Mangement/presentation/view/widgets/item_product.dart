import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/images.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Products/price_rating_item.dart';
import 'package:smart_auction/feature/Product%20Mangement/presentation/view/widgets/edit_remove.dart';
import 'package:smart_auction/feature/Product%20Mangement/presentation/view/widgets/name_product_and_quantity.dart';

class ItemProduct extends StatelessWidget {
  const ItemProduct({super.key});

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
          const EditRemove(),
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(AppImages.kMacBookPro),
          ),
          SizedBox(
            height: 30.h,
          ),
          const NameProductAndQuantity(),
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
          const PriceRatingProduct(),
        ],
      ),
    );
  }
}
