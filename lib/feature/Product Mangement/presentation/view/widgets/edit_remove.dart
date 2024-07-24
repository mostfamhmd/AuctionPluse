import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/utils/styles.dart';

class EditRemove extends StatelessWidget {
  const EditRemove({super.key, this.onPressedEdit, this.onPressedRemove});
  final void Function()? onPressedEdit;
  final void Function()? onPressedRemove;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: onPressedEdit,
            child: Text("edit",
                style: AppStyles.kPoppins400
                    .copyWith(fontSize: 20.sp, color: AppColors.kGray)),
          ),
          IconButton(
            onPressed: onPressedRemove,
            icon: SvgPicture.asset(AppIcons.kRemove),
          ),
        ],
      ),
    );
  }
}
