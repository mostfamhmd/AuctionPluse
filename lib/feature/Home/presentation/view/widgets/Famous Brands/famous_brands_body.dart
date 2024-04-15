import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/feature/Famous%20Brands/data/model/get_brands_model.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/Famous%20Brands/famous_brands_list.dart';
import 'package:smart_auction/core/widgets/Components/custom_more.dart';

import '../../../../../Famous Brands/presentation/view/famous_brand.dart';

class FamousBrandsBody extends StatelessWidget {
  const FamousBrandsBody({
    super.key,
    required this.brands,
  });
  final List<Brands> brands;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomMore(
          type: "Famous Brands",
          typeMore: "See More",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => FamousBrandsPage(
                  brands: brands,
                ),
              ),
            );
          },
        ),
        SizedBox(
          height: 160.h,
          child: FamousBrandsList(
            brands: brands,
          ),
        ),
      ],
    );
  }
}
