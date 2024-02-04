import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/feature/Best%20Seller/presentation/view/widgets/results_categories.dart';

import '../../../../../core/utils/icons.dart';
import '../../../../../core/utils/images.dart';
import 'items_best_seller.dart';

class BodyBestSellerPage extends StatelessWidget {
  const BodyBestSellerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 20.h),
      child: Column(
        children: [
          const ResultsAndCategories(numResults : 8),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 280.h,
                crossAxisSpacing: 25.w,
                mainAxisSpacing: 20.h,
              ),
              itemCount: 8, // total number of items
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: const Color(0xFFFFFFFF)),
                  child: ItemsBestSeller(
                    imageUrl: AppImages.kAirPods,
                    nameProduct: 'Airpods',
                    overPrice: r'$299,43',
                    productPrice: r'$534,33',
                    percentageOver: '24',
                    rating: 3.5,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}


