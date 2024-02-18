import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/feature/Famous%20Brands/presentation/view/widgets/first_three_brands.dart';

import '../../../../../core/utils/images.dart';
import 'grid_view_item_builder.dart';

class BodyFamousBrandsPage extends StatelessWidget {
  const BodyFamousBrandsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          const FirstThreeBrands(
            imagePath: AppImages.kNetflix,
            brandName: "Netflix",
            brandDescription: "Los Gatos, CA. Media and Entertainment",
            rankColor: 0xFF3ACB3A,
            rankNum: 1,
            topCard: 0,
          ),
          SizedBox(
            height: 20.h,
          ),
          const FirstThreeBrands(
            imagePath: AppImages.kNetflix,
            brandName: "Netflix",
            brandDescription: "Los Gatos, CA. Media and Entertainment",
            rankColor: 0xFF538353,
            rankNum: 2,
            topCard: 0,
          ),
          SizedBox(
            height: 20.h,
          ),
          const FirstThreeBrands(
            imagePath: AppImages.kNetflix,
            brandName: "Netflix",
            brandDescription: "Los Gatos, CA. Media and Entertainment",
            rankColor: 0xFFFFB800,
            rankNum: 3,
            topCard: 0,
          ),
          SizedBox(
            height: 20.h,
          ),
          GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 100.h,
            ),
            itemCount: 8,
            itemBuilder: (context, index) {
              return const GridViewItemsBuilder();
            },
          ),
        ],
      ),
    );
  }
}


