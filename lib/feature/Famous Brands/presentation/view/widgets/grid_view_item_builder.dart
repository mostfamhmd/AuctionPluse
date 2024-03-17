import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/widgets/Components/image_component.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class GridViewItemsBuilder extends StatelessWidget {
  const GridViewItemsBuilder(
      {super.key,
      required this.rank,
      required this.imageURL,
      required this.name});
  final int rank;
  final String imageURL;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                rank.toString(),
                style: AppStyles.kPoppins700.copyWith(
                  fontSize: 20.sp,
                  color: AppColors.kBlack,
                ),
              ),
              SizedBox(width: 10.w),
              Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: ImageComponent(
                      urlImage: imageURL,
                      height: 65.h,
                      width: 65.w,
                      radius: 5.r)
                  /*Image.network(
                  imageURL,
                  height: 65.h,
                  width: 65.w,
                  fit: BoxFit.fill,
                ),*/
                  ),
              SizedBox(width: 10.w),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: AppStyles.kPoppins700.copyWith(
                          fontSize: 14.sp,
                          color: AppColors.kBlack,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: AppColors.kGray,
            thickness: 1.0.w,
          ),
        ],
      ),
    );
  }
}
