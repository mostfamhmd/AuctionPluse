import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/Categories/category_item.dart';

class CategriesList extends StatelessWidget {
  const CategriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return const CategriesItem();
        }),
      ),
    );
  }
}
