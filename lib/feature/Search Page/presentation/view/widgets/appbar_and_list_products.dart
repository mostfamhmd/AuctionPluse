// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/core/widgets/Components/search_field.dart';
import 'package:smart_auction/feature/Search%20Page/presentation/view/widgets/list_of_products.dart';
import 'package:smart_auction/feature/Search%20Result/presentation/view/search_result_page.dart';

class AppBarAndListOfProducts extends StatefulWidget {
  AppBarAndListOfProducts({
    super.key,
    required this.loading,
    required this.products,
  });
  late ValueNotifier<bool> loading;
  late List<ProductInfo> products;

  @override
  State<AppBarAndListOfProducts> createState() =>
      _AppBarAndListOfProductsState();
}

class _AppBarAndListOfProductsState extends State<AppBarAndListOfProducts> {
  ValueNotifier<List<ProductInfo>> productsSearch = ValueNotifier([]);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.w, left: 15.w, top: 40.h),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(AppIcons.kArrowBack),
              ),
              const Spacer(),
              SizedBox(
                height: 55.h,
                width: MediaQuery.of(context).size.width * 0.85,
                child: SearchField(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => SearchResultPage(
                              productsSearch: productsSearch,
                              products: widget.products,
                            )),
                      ),
                    );
                  },
                  onChanged: (value) {
                    productsSearch.value = widget.products.where((product) {
                      final productTitle = product.name!.toLowerCase();
                      final input = value.toLowerCase();
                      return productTitle.contains(input);
                    }).toList();
                  },
                  onFieldSubmitted: (value) {
                    if (value.isNotEmpty) {
                      productsSearch.value = widget.products.where((product) {
                        final productTitle = product.name!.toLowerCase();
                        final input = value.toLowerCase();
                        return productTitle.contains(input);
                      }).toList();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => SearchResultPage(
                                productsSearch: productsSearch,
                                products: widget.products,
                              )),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          ValueListenableBuilder(
            valueListenable: widget.loading,
            builder: (BuildContext context, value, Widget? child) =>
                value == false
                    ? ListOfProducts(
                        productsSearch: productsSearch,
                      )
                    : const LoadingState(),
          ),
        ],
      ),
    );
  }
}
