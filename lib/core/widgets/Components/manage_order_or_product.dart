import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/image_component.dart';
import 'package:smart_auction/core/widgets/Components/price_rating_item.dart';
import 'package:smart_auction/core/widgets/Components/quantity_order_or_product.dart';

import '../../../feature/Product Mangement/presentation/view/widgets/edit_remove.dart';

class ManageOrderOrProduct extends StatelessWidget {
  const ManageOrderOrProduct(
      {super.key,
      required this.urlLinkImage,
      required this.productName,
      required this.productDescription,
      required this.productBrand,
      required this.rating,
      required this.productPrice,
      required this.isEdit});

  final String urlLinkImage;
  final String productName;
  final String productDescription;
  final String productBrand;
  final num rating;
  final String productPrice;
  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 10.h,
        bottom: 10.h,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              offset: const Offset(10, 10),
              color: AppColors.kGray.withOpacity(0.2),
              spreadRadius: 10.r,
              blurRadius: 10.r,
              blurStyle: BlurStyle.normal,
            ),
            BoxShadow(
              offset: const Offset(-10, -10),
              color: AppColors.kGray.withOpacity(0.2),
              spreadRadius: 10.r,
              blurRadius: 10.r,
              blurStyle: BlurStyle.normal,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isEdit == true ? const EditRemove() : const Center(),
          Align(
            alignment: Alignment.topCenter,
            child: ImageComponent(
              urlImage: urlLinkImage,
              height: 200.h,
              width: 400.w,
              radius: 0,
            ),
          ),
          const Spacer(),
          isEdit == false
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      productName,
                      style: AppStyles.kInter600.copyWith(
                        fontSize: 20.sp,
                      ),
                    ),
                    SvgPicture.asset(AppIcons.kRemove),
                  ],
                )
              : Row(
                  children: [
                    Text(
                      productName,
                      style: AppStyles.kInter600.copyWith(
                        fontSize: 20.sp,
                      ),
                    ),
                    const Spacer(
                      flex: 6,
                    ),
                    SvgPicture.asset(AppIcons.kMinus),
                    const Spacer(),
                    Text(
                      "1",
                      style: AppStyles.kPoppins400.copyWith(
                        fontSize: 18.sp,
                        color: AppColors.kBlack,
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset(AppIcons.kPlus),
                  ],
                ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            productDescription,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.kInter400
                .copyWith(fontSize: 16.sp, color: AppColors.kGray),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "The brand : $productBrand",
            style: AppStyles.kInter400.copyWith(
                fontSize: 17.sp,
                color: AppColors.kDarkBlue,
                fontWeight: FontWeight.w500),
          ),
          isEdit == false ? const QuantityProduct() : const Center(),
          PriceRatingProduct(
            rating: rating,
            productPrice: productPrice,
          ),
        ],
      ),
    );
  }
}
