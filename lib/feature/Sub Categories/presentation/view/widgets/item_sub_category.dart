import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/feature/Sub%20Categories/data/model/sub_category_model.dart';

class ItemSubCategory extends StatelessWidget {
  const ItemSubCategory({
    super.key,
    required this.subCategories,
  });
  final SubCategory subCategories;

  @override
  Widget build(BuildContext context) {
    return Text(
      subCategories.name!,
      style: AppStyles.kInter700.copyWith(fontSize: 16.sp),
    );
  }
}
