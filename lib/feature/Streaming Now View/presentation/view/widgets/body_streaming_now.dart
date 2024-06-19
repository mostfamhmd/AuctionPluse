import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/widgets/Components/custom_text_form_field_with_out_prefix.dart';
import 'package:smart_auction/core/widgets/Components/my_small_btn.dart';
import 'package:smart_auction/core/widgets/Components/sentances_of_streaming_now.dart';

import 'select_channel.dart';
import 'select_time.dart';
import 'tag_products.dart';
import '../../../../../core/widgets/Components/text_chat.dart';

class BodyStreamingNow extends StatelessWidget {
  const BodyStreamingNow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> allowedChat = ValueNotifier(false);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 25.w,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            // direct talk name
            const DirectTalkName(),
            // What do you want to talk about?
            const TalkAbout(),
            SizedBox(height: 30.h),
            //live name
            customTextFormFieldWithoutPrefix(keyboardType: TextInputType.text),
            SizedBox(height: 20.h),
            // tag product
            const TagProducts(),
            SizedBox(height: 20.h),
            // channel selection
            SelectChannel(
              onTap: () {},
            ),
            SizedBox(height: 20.h),
            // Text chat
            ValueListenableBuilder(
              valueListenable: allowedChat,
              builder: (BuildContext context, value, Widget? child) => TextChat(
                onChanged: (value) {
                  allowedChat.value = value;
                },
                caseSwitch: value,
              ),
            ),
            SizedBox(height: 15.h),
            // Can the audience send messages in a live Tok broadcast?
            const SendingMessage(),
            SizedBox(height: 20.h),
            // start time
            SelectTime(
              hintText: 'Start time',
              onTap: () async {
                final TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (picked != null) {
                  if (kDebugMode) {
                    print({'${picked.hour}:${picked.minute}'});
                  }
                }
              },
            ),
            SizedBox(height: 30.h),
            // end time
            SelectTime(
              hintText: 'End time',
              onTap: () async {
                final TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (picked != null) {
                  if (kDebugMode) {
                    print({'${picked.hour}:${picked.minute}'});
                  }
                }
              },
            ),
            SizedBox(height: 30.h),
            // live broadcast
            Center(
              child: MySmallBTN(
                nameButton: 'Live Broadcast',
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
