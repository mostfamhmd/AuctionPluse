import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/styles.dart';

class BodySearchPage extends StatelessWidget {
  const BodySearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(
          left: 15.w,
          top: 15.h,
          right: 15.w,
        ),
        child: ListTile(
          onTap: () {},
          leading: Text(
            "iPhone 15 pro ",
            style: AppStyles.kPoppins400.copyWith(
              fontSize: 15.sp,
            ),
          ),
        ),
      ),
    );
  }
}
