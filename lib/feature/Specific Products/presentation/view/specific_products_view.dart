import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';
import 'package:smart_auction/feature/Specific%20Products/presentation/view/widgets/body_specific_products.dart';

class SpecificProducts extends StatelessWidget {
  const SpecificProducts(
      {super.key,
      required this.namePage,
      this.categoryName,
      this.subCategoryId,
      this.isBrand,
      this.brandId});
  final String namePage;
  final String? categoryName;
  final String? subCategoryId;
  final bool? isBrand;
  final String? brandId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodySpecificProducts(
        categoryName: categoryName,
        subCategoryId: subCategoryId,
        isBrand: isBrand,
        brandId: brandId,
      ),
      appBar: backAppBar(context, namePage),
    );
  }
}
