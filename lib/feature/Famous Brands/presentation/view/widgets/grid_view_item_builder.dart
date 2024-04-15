import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/widgets/Components/image_component.dart';
import 'package:smart_auction/feature/Famous%20Brands/data/model/get_brands_model.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class GridViewItemsBuilder extends StatelessWidget {
  const GridViewItemsBuilder(
      {super.key,
      required this.rank,
      required this.imageURL,
      required this.name,
      required this.brand,
      this.onPressedEdit,
      this.onPressedDelete,
      required this.role});
  final int rank;
  final String imageURL;
  final String name;
  final Brands brand;
  final void Function()? onPressedEdit;
  final void Function()? onPressedDelete;
  final String role;
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
                      urlImage: brand.image!,
                      height: 65.h,
                      width: 65.w,
                      radius: 5.r)),
              SizedBox(width: 10.w),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        brand.name!,
                        style: AppStyles.kPoppins700.copyWith(
                          fontSize: 14.sp,
                          color: AppColors.kBlack,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      role == "user"
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: onPressedEdit,
                                  child: Icon(
                                    Icons.edit,
                                    size: 20.sp,
                                    color: AppColors.kGray,
                                  ),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                InkWell(
                                  onTap: onPressedDelete,
                                  child: Icon(
                                    Icons.delete,
                                    size: 20.sp,
                                    color: AppColors.kRed,
                                  ),
                                ),
                              ],
                            )
                          : const Center(),
                      SizedBox(height: 5.h),
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
