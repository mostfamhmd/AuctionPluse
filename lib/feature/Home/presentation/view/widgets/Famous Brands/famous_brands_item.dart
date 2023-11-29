import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/icons.dart';

class FamousBrandsItem extends StatelessWidget {
  const FamousBrandsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 30.w),
      child: SvgPicture.asset(AppIcons.kBrand),
    );
  }
}
