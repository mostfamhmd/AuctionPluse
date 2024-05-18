import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'share_icon.dart';
import 'share_text.dart';

class ShareTextAndIcon extends StatelessWidget {
  const ShareTextAndIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const ShareText(),
        SizedBox(width: 10.w),
        const ShareIcon(),
      ],
    );
  }
}
