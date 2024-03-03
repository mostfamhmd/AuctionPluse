import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/Famous%20Brands/famous_brands_list.dart';
import 'package:smart_auction/core/widgets/Components/custom_more.dart';

import '../../../../Famous Brands/presentation/view/famous_brand.dart';

class FamousBrandsBody extends StatelessWidget {
  const FamousBrandsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomMore(type: "Famous Brands", typeMore: "See More", onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const FamousBrandsPage(),
            ),
          );
        },),
        SizedBox(
          height: 90.h,
          child: const FamousBrandsList(),
        ),
      ],
    );
  }
}
