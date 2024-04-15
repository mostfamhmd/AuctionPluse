import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';

class EditAndDelete extends StatelessWidget {
  const EditAndDelete({
    super.key,
    required this.onPressedEdit,
    required this.onPressedDelete,
  });

  final void Function()? onPressedEdit;
  final void Function()? onPressedDelete;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Row(
        children: [
          IconButton(
            onPressed: onPressedEdit,
            icon: Icon(
              Icons.edit,
              size: 20.sp,
              color: AppColors.kGray,
            ),
          ),
          IconButton(
            onPressed: onPressedDelete,
            icon: Icon(
              Icons.delete,
              size: 20.sp,
              color: AppColors.kRed,
            ),
          ),
        ],
      ),
    );
  }
}
