import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/images.dart';
import '../../../../../core/utils/styles.dart';

class GridViewItemsBuilder extends StatelessWidget {
  const GridViewItemsBuilder({super.key});

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
                "4",
                style: AppStyles.kPoppins700.copyWith(
                  fontSize: 20.sp,
                  color: AppColors.kBlack,
                ),
              ),
              SizedBox(width: 10.w),
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Image.asset(
                  AppImages.kNetflix,
                  height: 65.h,
                  width: 65.w,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Netflix",
                        style: AppStyles.kPoppins700.copyWith(
                          fontSize: 14.sp,
                          color: AppColors.kBlack,
                        ),
                      ),
                      Text(
                        "Los Gatos, CA",
                        style: AppStyles.kPoppins400.copyWith(
                          fontSize: 13.sp,
                          color: AppColors.kBlack,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.visible,
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