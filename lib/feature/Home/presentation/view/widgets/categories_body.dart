import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/Categories/categories_list.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/custom_more.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomMore(
          type: "Category",
          typeMore: "More Category",
        ),
        SizedBox(
          height: 30.h,
        ),
        SizedBox(
          height: 120.h,
          child: const CategriesList(),
        ),
      ],
    );
  }
}
