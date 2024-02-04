import 'package:flutter/material.dart';
import 'package:smart_auction/feature/Famous%20Brands/presentation/view/widgets/appBar_famous_brand.dart';
import 'package:smart_auction/feature/Famous%20Brands/presentation/view/widgets/body_famous_brands_page.dart';

class FamousBrandsPage extends StatelessWidget {
  const FamousBrandsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: famousBrandsAppBar(context, "Famous Brand"),
      body: const BodyFamousBrandsPage(),
    );
  }
}

