// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/widgets/Components/image_component.dart';
import 'package:smart_auction/core/widgets/Components/rating_widget.dart';

import '../../utils/colors.dart';
import '../../utils/icons.dart';
import '../../utils/styles.dart';

class BodyViewProduct extends StatelessWidget {
  const BodyViewProduct(
      {super.key,
      required this.imageUrl,
      required this.nameProduct,
      required this.overPrice,
      required this.productPrice,
      required this.percentageOver,
      required this.rating,
      this.isDelete,
      this.onTap});

  final String imageUrl;
  final String nameProduct;
  final String overPrice;
  final String productPrice;
  final String percentageOver;
  final dynamic rating;
  final bool? isDelete;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: ImageComponent(
                urlImage: imageUrl,
                height: 150.h,
                width: MediaQuery.sizeOf(context).width,
                radius: 5.r),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Text(
              nameProduct,
              style: AppStyles.kPoppins700.copyWith(fontSize: 18.sp),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Flexible(
            fit: FlexFit.tight,
            child: RatingWidget(rating: rating),
          ),
          SizedBox(
            height: 5.h,
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Text(
              overPrice,
              style: AppStyles.kPoppins700
                  .copyWith(color: AppColors.kBlue, fontSize: 15.sp),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  productPrice,
                  style: AppStyles.kPoppins400.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                Text(
                  "$percentageOver% Off",
                  style: AppStyles.kPoppins700
                      .copyWith(color: AppColors.kRed, fontSize: 14.sp),
                ),
                isDelete == true
                    ? InkWell(
                        onTap: onTap, child: SvgPicture.asset(AppIcons.kDelete))
                    : const Center(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
