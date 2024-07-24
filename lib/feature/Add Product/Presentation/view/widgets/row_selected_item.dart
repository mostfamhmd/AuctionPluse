import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/styles.dart';

class RowSelected extends StatelessWidget {
  const RowSelected({
    super.key,
    required this.isSelected,
    required this.item,
  });

  final bool isSelected;
  final String item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isSelected)
          const Icon(Icons.check_box_outlined)
        else
          const Icon(Icons.check_box_outline_blank),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            item,
            style: AppStyles.kPoppins400.copyWith(
              fontSize: 14.sp,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
