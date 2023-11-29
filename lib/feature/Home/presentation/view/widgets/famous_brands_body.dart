import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/Famous%20Brands/famous_brands_list.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/custom_more.dart';

class FamousBrandsBody extends StatelessWidget {
  const FamousBrandsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomMore(type: "Famous Brands", typeMore: "See More"),
        SizedBox(
          height: 90.h,
          child: const FamousBrandsList(),
        ),
      ],
    );
  }
}
