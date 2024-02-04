import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/Model/cate_page_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.categoryPageModel});
  final CategoryPageModel categoryPageModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(categoryPageModel.cateUrlIcon),
        const Spacer(),
        Text(
          categoryPageModel.cateName,
          style: AppStyles.kInter700.copyWith(fontSize: 16.sp),
        ),
        const Spacer(
          flex: 6,
        ),
      ],
    );
  }
}