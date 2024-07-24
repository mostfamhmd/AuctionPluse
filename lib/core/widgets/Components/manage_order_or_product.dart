import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'item_specific_product.dart';

class ManageOrderOrProduct extends StatelessWidget {
  const ManageOrderOrProduct(
      {super.key,
      required this.urlLinkImage,
      required this.productName,
      required this.productDescription,
      required this.productBrand,
      required this.rating,
      required this.productPrice,
      required this.isEdit,
      this.onPressedRemove,
      this.onPressedEdit});

  final String urlLinkImage;
  final String productName;
  final String productDescription;
  final String productBrand;
  final num rating;
  final String productPrice;
  final bool isEdit;
  final void Function()? onPressedRemove;
  final void Function()? onPressedEdit;

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
      child: ItemSpecificProduct(
          onPressedEdit: onPressedEdit,
          onPressedRemove: onPressedRemove,
          isEdit: isEdit,
          urlLinkImage: urlLinkImage,
          productName: productName,
          productDescription: productDescription,
          productBrand: productBrand,
          rating: rating,
          productPrice: productPrice),
    );
  }
}
