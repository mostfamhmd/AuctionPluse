import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/BestSeller/best_seller_item.dart';

class BestSellerList extends StatelessWidget {
  const BestSellerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return const BestSellerItem();
        },
      ),
    );
  }
}
