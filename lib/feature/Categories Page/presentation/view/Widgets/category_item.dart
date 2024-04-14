import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/widgets/Components/image_component.dart';
import 'package:smart_auction/feature/Sub%20Categories/presentation/view/sub_category_page.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/Model/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
    required this.role,
  });
  final Category category;
  final String role;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubCategoryPage(
              categoryName: category.name!,
              categoryId: category.sId!,
            ),
          ),
        );
      },
      child: IntrinsicWidth(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageComponent(
                urlImage: category.image!,
                height: 70.h,
                width: 70.w,
                radius: 5.r),
            SizedBox(
              width: 50.w,
            ),
            Text(
              category.name!,
              style: AppStyles.kInter700.copyWith(fontSize: 16.sp),
            ),
            const Spacer(),
            role == "user"
                ? IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      color: AppColors.kGray,
                      size: 20.sp,
                    ),
                  )
                : const Center(),
            role == "user"
                ? IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete,
                      color: AppColors.kRed,
                      size: 20.sp,
                    ),
                  )
                : const Center(),
          ],
        ),
      ),
    );
  }
}
