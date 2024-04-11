import 'package:flutter/material.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/core/widgets/AppBar/basic_app_bar.dart';
import 'package:smart_auction/core/widgets/Drawer/my_drawer.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/view/widgets/body_details_product.dart';

class DetailsProductPage extends StatelessWidget {
  const DetailsProductPage({super.key, required this.product});
  final ProductInfo product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyDetailsProductPage(product: product),
      endDrawer: const MyDrawer(),
      appBar: basicAppBar(
        context,
        product.name!,
      ),
    );
  }
}
