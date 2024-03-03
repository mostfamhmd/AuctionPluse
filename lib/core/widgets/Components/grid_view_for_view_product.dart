import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../feature/Details Product/presentation/view/details_product.dart';
import '../../utils/colors.dart';
class GridViewForViewProduct extends StatelessWidget {
  const GridViewForViewProduct({
    super.key, required this.widget,
  });

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 320.h,
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 20.h,
      ),
      itemCount: 8,
      // total number of items
      itemBuilder: (context, index) {
        return InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailsProductPage(),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.kWhite,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(8, 8),
                    color: AppColors.kGray.withOpacity(0.2),
                    blurRadius: 15.r,
                    blurStyle: BlurStyle.normal,
                    spreadRadius: 2,
                  ),
                  BoxShadow(
                    offset: const Offset(-8, -8),
                    color: AppColors.kGray.withOpacity(0.2),
                    blurRadius: 15.r,
                    blurStyle: BlurStyle.normal,
                    spreadRadius: 2,
                  ),
                ]),
            child:widget,
          ),
        );
      },
    );
  }
}