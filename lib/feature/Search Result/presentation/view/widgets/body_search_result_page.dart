import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/images.dart';
import '../../../../Best Seller/presentation/view/widgets/results_categories.dart';
import 'items_result.dart';

class BodySearchResultPage extends StatelessWidget {
  const BodySearchResultPage({super.key});

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
                  child: ItemsResult(
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