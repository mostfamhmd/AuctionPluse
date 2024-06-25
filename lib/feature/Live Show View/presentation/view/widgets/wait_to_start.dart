import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class WaitToStart extends StatelessWidget {
  const WaitToStart({
    super.key,
    required this.statement,
  });
  final String statement;
  @override
  Widget build(BuildContext context) {
    return Text(
      statement,
      style: TextStyle(
        fontFamily: AppFonts.kInter500,
        fontSize: 20.sp,
      ),
    );
  }
}
