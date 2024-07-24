import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterTypeSearch extends StatelessWidget {
  const FilterTypeSearch(
      {super.key,
      required this.typeFilterSearch,
      required this.style,
      required this.colorBackGround,
      required this.border});

  final String typeFilterSearch;
  final TextStyle style;
  final Color colorBackGround;
  final BoxBorder border;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      height: 60.h,
      decoration: BoxDecoration(
        color: colorBackGround,
        borderRadius: BorderRadius.circular(10.r),
        border: border,
      ),
      child: IntrinsicWidth(
        child: Align(
          alignment: Alignment.center,
          child: Text(
            typeFilterSearch,
            style: style,
          ),
        ),
      ),
    );
  }
}
