import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class ButtonSortBy extends StatelessWidget {
  const ButtonSortBy({super.key, required this.sortBy, required this.onTap});

  final String sortBy;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        sortBy,
        style: AppStyles.kPoppins700
            .copyWith(fontSize: 14.sp, color: AppColors.kDarkBlue),
      ),
    );
  }
}
