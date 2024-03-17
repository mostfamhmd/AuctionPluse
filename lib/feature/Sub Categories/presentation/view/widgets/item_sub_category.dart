import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/core/utils/styles.dart';

class ItemSubCategory extends StatelessWidget {
  const ItemSubCategory({
    super.key,
    required this.name,
    required this.productsList,
    required this.categoryId,
    required this.categoryName,
  });
  final String name;
  final List<ProductInfo> productsList;
  final String categoryId;
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(
        name,
        style: AppStyles.kInter700.copyWith(fontSize: 16.sp),
      ),
    );
  }
}
