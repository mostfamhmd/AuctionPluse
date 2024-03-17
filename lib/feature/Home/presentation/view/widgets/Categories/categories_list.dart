import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/feature/Categories%20Page/data/Model/category_model.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/Categories/category_item.dart';
import 'package:smart_auction/feature/Sub%20Categories/presentation/view/sub_category_page.dart';

class CategriesList extends StatelessWidget {
  const CategriesList({super.key, required this.categories});
  final List<Category> categories;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) => InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubCategoryPage(
                      categoryId: categories[index].sId!,
                      categoryName: categories[index].name!,
                    ),
                  ),
                );
              },
              child: CategriesItem(
                categoryName: categories[index].name!,
                categoryImage: categories[index].image!,
              ),
            )),
      ),
    );
  }
}
