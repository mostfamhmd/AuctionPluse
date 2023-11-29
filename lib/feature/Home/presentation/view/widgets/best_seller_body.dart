import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/BestSeller/best_seller_list.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/custom_more.dart';

class BestSellerBody extends StatelessWidget {
  const BestSellerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomMore(type: "Best Seller", typeMore: "See More"),
        SizedBox(
          height: 30.h,
        ),
        SizedBox(
          height: 270.h,
          child: const BestSellerList(),
        ),
      ],
    );
  }
}
