import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/image_component.dart';

class CategriesItem extends StatelessWidget {
  const CategriesItem(
      {super.key, required this.categoryName, required this.categoryImage});
  final String categoryName;
  final String categoryImage;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 120.h,
          width: 70.w,
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                ImageComponent(
                    urlImage: categoryImage,
                    height: 70.h,
                    width: 65.w,
                    radius: 5.w),
                /*Container(
                  height: 70.h,
                  width: 65.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(2, 2),
                        color: AppColors.kGray.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 2.r,
                      ),
                      BoxShadow(
                        offset: const Offset(-2, -2),
                        color: AppColors.kGray.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 2.r,
                      ),
                    ],
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    AppImages.kIphone13,
                    fit: BoxFit.cover,
                  ),
                ),*/
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  categoryName,
                  style: AppStyles.kPoppins500.copyWith(
                    color: AppColors.kBlack,
                    fontWeight: FontWeight.w700,
                    fontSize: 11.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
