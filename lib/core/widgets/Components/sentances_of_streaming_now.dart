import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';

class SendingMessage extends StatelessWidget {
  const SendingMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Can the audience send messages in a live Tok broadcast?',
      style: TextStyle(
        fontFamily: AppFonts.kPoppins500,
        fontSize: 14.sp,
        color: AppColors.kGray,
      ),
    );
  }
}

class TalkAbout extends StatelessWidget {
  const TalkAbout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'What do you want to talk about?',
      style: TextStyle(
        fontFamily: AppFonts.kPoppins400,
        fontSize: 14.sp,
        color: AppColors.kGray,
      ),
    );
  }
}

class DirectTalkName extends StatelessWidget {
  const DirectTalkName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Direct talk name',
      style: TextStyle(
        fontFamily: AppFonts.kPoppins700,
        fontSize: 16.sp,
      ),
    );
  }
}
