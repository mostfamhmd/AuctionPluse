import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/Famous%20Brands/famous_brands_item.dart';

class FamousBrandsList extends StatelessWidget {
  const FamousBrandsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return const FamousBrandsItem();
        },
      ),
    );
  }
}
