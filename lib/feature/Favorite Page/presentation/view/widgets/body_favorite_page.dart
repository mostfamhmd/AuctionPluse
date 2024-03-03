import 'package:flutter/material.dart';

import '../../../../../core/utils/images.dart';
import '../../../../../core/widgets/Components/body_view_product.dart';
import '../../../../../core/widgets/Components/grid_view_for_view_product.dart';

class BodyFavoritePage extends StatelessWidget {
  const BodyFavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
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
