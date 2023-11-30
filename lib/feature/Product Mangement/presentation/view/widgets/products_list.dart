import 'package:flutter/material.dart';
import 'package:smart_auction/feature/Product%20Mangement/presentation/view/widgets/item_product.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return const ItemProduct();
        });
  }
}
