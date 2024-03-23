import 'package:flutter/material.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/BestSeller/best_seller_item.dart';

import '../../../../../Details Product/presentation/view/details_product.dart';

class BestSellerList extends StatelessWidget {
  const BestSellerList({super.key, required this.products});
  final List<ProductInfo> products;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: products.length >= 6 ? 6 : products.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsProductPage(
                  product: products[index],
                ),
              ),
            );
          },
          child: BestSellerItem(
            urlLinkImage: "${products[index].imageCover}",
            index: index,
            productName: "${products[index].name}",
            productOfferPrice:
                "${products[index].price! - products[index].discountedPrice!}",
            productRealPrice: "${products[index].price}",
            productRating:
                "${products[index].ratingsAverage?.toStringAsFixed(1)}",
            productOfferPercentage: "${products[index].discountedPrice}",
            length: 6,
          ),
        );
      },
    );
  }
}
