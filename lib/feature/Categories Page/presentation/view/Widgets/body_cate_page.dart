import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/feature/Categories%20Page/data/Model/category_model_list.dart';
import 'category_item.dart';

class BodyCategoryPage extends StatelessWidget {
  const BodyCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: categoryPageModel.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 30.h),
                  child:CategoryItem(categoryPageModel: categoryPageModel[index],),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}


