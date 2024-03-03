import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/feature/Best%20Seller/presentation/view/best_seller_page.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/BestSeller/best_seller_list.dart';
import 'package:smart_auction/core/widgets/Components/custom_more.dart';

class BestSellerBody extends StatelessWidget {
  const BestSellerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomMore(type: "Best Seller", typeMore: "See More", onTap: (){
          Navigator.push (
            context,
            MaterialPageRoute (
              builder: (BuildContext context) => const BestSellerPage(),
            ),
          );
        },),
        SizedBox(
          height: 30.h,
        ),
        SizedBox(
          height: 305.h,
          child: const BestSellerList(),
        ),
      ],
    );
  }
}
