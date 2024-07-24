import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';

class SelectColor extends StatelessWidget {
  const SelectColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        SizedBox(
          width: 20.w,
        ),
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: 15.r,
        ),
        SizedBox(
          width: 20.w,
        ),
        CircleAvatar(
          backgroundColor: AppColors.kLightBlue,
          radius: 15.r,
        ),
      ],
    );
  }
}
