import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/feature/Sub%20Categories/presentation/view/sub_category_page.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/Model/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });
  final Category category;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubCategoryPage(
              categoryId: category.sId!,
            ),
          ),
        );
      },
      child: IntrinsicWidth(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              category.name!,
              style: AppStyles.kInter700.copyWith(fontSize: 16.sp),
            ),
          ],
        ),
      ),
    );
  }
}
