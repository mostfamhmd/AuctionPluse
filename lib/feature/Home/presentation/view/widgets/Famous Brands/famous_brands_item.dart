import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/image_component.dart';

class FamousBrandsItem extends StatelessWidget {
  const FamousBrandsItem(
      {super.key, required this.brandImage, required this.brandName});
  final String brandImage;
  final String brandName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, right: 30.w),
      child: Column(
        children: [
          ImageComponent(
            urlImage: brandImage,
            height: 70.h,
            width: 70.w,
            radius: 5.r,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            brandName,
            style: AppStyles.kPoppins500.copyWith(
              color: AppColors.kBlack,
              fontWeight: FontWeight.w700,
              fontSize: 11.sp,
            ),
          ),
        ],
      ),
    );
  }
}
