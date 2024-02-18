import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/styles.dart';

class NameBestSeller extends StatelessWidget {
  const NameBestSeller({super.key, required this.productName});

  final String productName;

  @override
  Widget build(BuildContext context) {
    return Text(
      productName,
      maxLines: 6,
      overflow: TextOverflow.ellipsis,
      style: AppStyles.kPoppins700.copyWith(
        fontSize: 12.sp,
      ),
    );
  }
}
