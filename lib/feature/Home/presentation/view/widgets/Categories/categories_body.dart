import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/feature/Categories%20Page/data/Model/category_model.dart';
import 'package:smart_auction/feature/Categories%20Page/presentation/view/category_page.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/Categories/categories_list.dart';
import 'package:smart_auction/core/widgets/Components/custom_more.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key, required this.categories});
  final List<Category> categories;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomMore(
          type: "Category",
          typeMore: "More Category",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const CategoryPage(),
              ),
            );
          },
        ),
        SizedBox(
          height: 30.h,
        ),
        SizedBox(
          height: 120.h,
          child: CategriesList(
            categories: categories,
          ),
        ),
      ],
    );
  }
}
