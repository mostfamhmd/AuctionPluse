import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/fonts.dart';

import 'switch_button.dart';

class TextChat extends StatelessWidget {
  const TextChat({
    super.key,
    this.onChanged,
  });
  final void Function(bool)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Text chat',
          style: TextStyle(
            fontFamily: AppFonts.kInter700,
            fontSize: 20.sp,
          ),
        ),
        SwitchButton(onChanged: onChanged),
      ],
    );
  }
}
