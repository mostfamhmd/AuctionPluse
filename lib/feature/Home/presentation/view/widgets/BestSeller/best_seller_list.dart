import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/BestSeller/best_seller_item.dart';

import '../../../../../../core/utils/images.dart';
import '../../../../../Details Product/presentation/view/details_product.dart';

class BestSellerList extends StatelessWidget {
  const BestSellerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 305.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailsProductPage(),
                ),
              );
            },
            child: BestSellerItem(
              urlLinkImage: AppImages.kTUltraSmartWatch,
              index: index,
              productName:
                  "T800 Ultra Smart Watch 49mm - Wireless Charging - NFC",
              productOfferPrice: r"$299,43",
              productRealPrice: r"$534,33",
              productRating: "4.5",
              productOfferPercentage: "24%",
              length: 6,
            ),
          );
        },
      ),
    );
  }
}
