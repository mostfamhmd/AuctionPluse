// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/feature/Search%20Result/presentation/view/widgets/body_search_result_page.dart';

class SearchResultPage extends StatelessWidget {
  SearchResultPage(
      {super.key, required this.productsSearch, required this.products});
  late ValueNotifier<List<ProductInfo>> productsSearch;
  final List<ProductInfo> products;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodySearchResultPage(
          productsSearch: productsSearch, products: products),
    );
  }
}
