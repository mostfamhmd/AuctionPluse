import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/feature/Specific%20Products/presentation/view/specific_products_view.dart';

class ItemSubCategory extends StatefulWidget {
  const ItemSubCategory({
    super.key,
    required this.name,
    required this.subCategoryId,
    required this.categoryName,
  });
  final String name;
  final String subCategoryId;
  final String categoryName;

  @override
  State<ItemSubCategory> createState() => _ItemSubCategoryState();
}

class _ItemSubCategoryState extends State<ItemSubCategory> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => SpecificProducts(
              namePage: widget.name,
              categoryName: widget.categoryName,
              subCategoryId: widget.subCategoryId,
            ),
          ),
        );
      },
      title: Text(
        widget.name,
        style: AppStyles.kInter700.copyWith(fontSize: 16.sp),
      ),
    );
  }
}
