import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/images.dart';
import '../../../../../core/widgets/Components/body_view_product.dart';
import '../../../../../core/widgets/Components/grid_view_for_view_product.dart';
import '../../../../../core/widgets/Components/results_categories.dart';

class BodySearchResultPage extends StatelessWidget {
  const BodySearchResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 20.h,
            ),
            child: const ResultsAndCategories(numResults: 8),
          ),
          GridViewForViewProduct(
            widget: BodyViewProduct(
              isDelete: true,
              imageUrl: AppImages.kAirPods,
              nameProduct: 'Airpods',
              overPrice: r'$299,43',
              productPrice: r'$534,33',
              percentageOver: '24',
              rating: 3.5,
            ),
          ),
        ],
      ),
    );
  }
}
