import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/widgets/Components/custom_text_form_field_with_out_prefix.dart';
import 'package:smart_auction/core/widgets/Components/sentances_of_streaming_now.dart';
import 'package:smart_auction/core/widgets/Components/text_chat.dart';

import 'app_bar_schedule_live.dart';

class BodyScheduleLiveView extends StatelessWidget {
  const BodyScheduleLiveView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
      ),
      child: Column(
        children: [
          AppBarScheduleLive(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          // the address
          customTextFormFieldWithoutPrefix(
            keyboardType: TextInputType.streetAddress,
            hintText: 'Address',
            suffixIcon: const Icon(
              Icons.arrow_forward_ios,
              size: 10,
            ),
          ),
          SizedBox(height: 15.h),
          // add users
          customTextFormFieldWithoutPrefix(
            keyboardType: TextInputType.name,
            hintText: 'Add users',
            suffixIcon: const Icon(
              Icons.arrow_forward_ios,
              size: 10,
            ),
          ),
          SizedBox(height: 15.h),
          // product name
          customTextFormFieldWithoutPrefix(
            keyboardType: TextInputType.text,
            hintText: 'Product name',
            suffixIcon: const Icon(
              Icons.arrow_forward_ios,
              size: 10,
            ),
          ),
          SizedBox(height: 15.h),
          // channel selection
          customTextFormFieldWithoutPrefix(
            keyboardType: TextInputType.streetAddress,
            hintText: 'Channel selection',
            suffixIcon: const Icon(
              Icons.arrow_forward_ios,
              size: 10,
            ),
          ),
          SizedBox(height: 15.h),
          // when do you want to live broadcasting?
          customTextFormFieldWithoutPrefix(
            keyboardType: TextInputType.datetime,
            hintText: 'When do you want to live broadcasting?',
            suffixIcon: const Icon(
              Icons.arrow_forward_ios,
              size: 10,
            ),
          ),
          SizedBox(height: 30.h),
          // text chat with switch for toggle
          TextChat(
            onChanged: (value) {},
          ),
          SizedBox(height: 10.h),
          const SendingMessage(),
        ],
      ),
    );
  }
}
