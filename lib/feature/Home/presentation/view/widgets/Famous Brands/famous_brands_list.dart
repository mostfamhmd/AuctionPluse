import 'package:flutter/material.dart';
import 'package:smart_auction/feature/Famous%20Brands/data/model/get_brands_model.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/Famous%20Brands/famous_brands_item.dart';

class FamousBrandsList extends StatelessWidget {
  const FamousBrandsList({super.key, required this.brands});
  final List<Brands> brands;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return FamousBrandsItem(
          brandImage: brands[index].image!,
          brandName: brands[index].name!,
        );
      },
    );
  }
}
