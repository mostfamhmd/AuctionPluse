// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/widgets/Components/search_field.dart';
import 'package:smart_auction/feature/Filter%20Page/presentation/view/filter_page.dart';
import 'package:smart_auction/feature/Sort%20Page/presentation/view/sort_page.dart';
import '../../../../../core/widgets/Components/grid_view_for_view_product.dart';
import '../../../../../core/widgets/Components/results_categories.dart';

class BodySearchResultPage extends StatelessWidget {
  BodySearchResultPage(
      {super.key, required this.productsSearch, required this.products});
  late ValueNotifier<List<ProductInfo>> productsSearch;
  final List<ProductInfo> products;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 10.w,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(AppIcons.kArrowBack),
                ),
                SizedBox(
                  width: 270.w,
                  height: 55.h,
                  child: SearchField(
                    textEditingController: TextEditingController(),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SortPage(),
                      ),
                    );
                  },
                  child: SvgPicture.asset(
                    AppIcons.kSortBy,
                    fit: BoxFit.none,
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FilterPage(),
                      ),
                    );
                  },
                  child: SvgPicture.asset(AppIcons.kFilter),
                ),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 20.h,
            ),
            child: ResultsAndCategories(
              numResults: productsSearch.value.length,
            ),
          ),
          GridViewForViewProduct(
            products: productsSearch.value,
          ),
        ],
      ),
    );
  }
}
