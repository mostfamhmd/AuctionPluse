import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';

class SelectedNameProductContainer extends StatelessWidget {
  const SelectedNameProductContainer({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.kLightBlue,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(name));
  }
}
