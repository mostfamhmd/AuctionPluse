// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/core/widgets/Components/body_view_product.dart';

import '../../../feature/Details Product/presentation/view/details_product.dart';
import '../../utils/colors.dart';

class GridViewForViewProduct extends StatelessWidget {
  const GridViewForViewProduct({
    super.key,
    this.widget,
    this.products,
  });

  final Widget? widget;
  final List<ProductInfo>? products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 270.h,
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 20.h,
      ),
      itemCount: products?.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsProductPage(
                  product: products![index],
                ),
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
              ],
            ),
            child: BodyViewProduct(
              imageUrl: products![index].imageCover!,
              nameProduct: products![index].name!,
              overPrice:
                  "${products![index].price! - products![index].discountedPrice!}",
              productPrice: "${products![index].price!}",
              percentageOver:
                  "${(products![index].discountedPrice! / products![index].price! * 100).toStringAsPrecision(2)}",
              rating: products![index].ratingsAverage ?? 0.0,
              isDelete: false,
            ),
          ),
        );
      },
    );
  }
}
