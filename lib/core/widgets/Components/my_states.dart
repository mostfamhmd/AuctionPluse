import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class FailureState extends StatelessWidget {
  const FailureState({
    super.key,
    required this.error,
  });
  final String error;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error,
        style: TextStyle(
            fontFamily: AppFonts.kPoppins700,
            fontSize: 18.sp,
            color: AppColors.kDarkBlue),
      ),
    );
  }
}

class LoadingState extends StatelessWidget {
  const LoadingState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitThreeBounce(
        color: Colors.black,
        size: 24.w,
      ),
    );
  }
}
