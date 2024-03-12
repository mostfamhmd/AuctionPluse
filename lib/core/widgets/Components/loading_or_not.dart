import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';

import '../../utils/styles.dart';

class LoadingOrNot extends StatelessWidget {
  const LoadingOrNot({super.key, required this.isLoad, required this.nameBTN});
  final ValueNotifier<bool> isLoad;
  final String nameBTN;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isLoad,
      builder: (BuildContext context, value, Widget? child) => value
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : Center(
              child: Text(
                nameBTN,
                style: AppStyles.kPoppins500
                    .copyWith(fontSize: 18.sp, color: AppColors.kBlack),
              ),
            ),
    );
  }
}
