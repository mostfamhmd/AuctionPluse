import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/widgets/Components/custom_text_form_field.dart';
import 'package:smart_auction/core/widgets/Components/elevated_button.dart';

class Auction4 extends StatelessWidget {
  const Auction4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // navigate to back
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.close, size: 40),
                ),

                SizedBox(height: 20.h),

                // direct talk name
                const Text(
                  'Direct talk name',
                  style: TextStyle(
                    fontFamily: AppFonts.kPoppins700,
                    fontSize: 16,
                  ),
                ),

                // What do you want to talk about?
                const Text(
                  'What do you want to talk about?',
                  style: TextStyle(
                    fontFamily: AppFonts.kPoppins400,
                    fontSize: 13,
                    color: AppColors.kGray,
                  ),
                ),

                SizedBox(height: 30.h),

                customTextFormField(keyboardType: TextInputType.text),

                SizedBox(height: 20.h),

                // tag product
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Tag Products +'),
                ),

                SizedBox(height: 20.h),

                // channel selection
                const Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // channel selection
                        Text(
                          'Channel selection',
                          style: TextStyle(
                            fontFamily: AppFonts.kPoppins700,
                            fontSize: 16,
                          ),
                        ),

                        // Select the channel for live broadcast
                        Text(
                          'Select the channel for live broadcast',
                          style: TextStyle(
                            fontFamily: AppFonts.kPoppins400,
                            fontSize: 14,
                            color: AppColors.kGray,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, size: 15),
                  ],
                ),

                SizedBox(height: 20.h),

                // Text chat
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Text chat',
                      style: TextStyle(
                        fontFamily: AppFonts.kInter700,
                        fontSize: 20,
                      ),
                    ),
                    Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ],
                ),

                SizedBox(height: 15.h),

                // Can the audience send messages in a live Tok broadcast?
                const Text(
                  'Can the audience send messages in a live Tok broadcast?',
                  style: TextStyle(
                    fontFamily: AppFonts.kPoppins500,
                    fontSize: 14,
                    color: AppColors.kGray,
                  ),
                ),

                SizedBox(height: 20.h),

                // start time
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.access_time_filled_sharp),
                    Expanded(
                      child: customTextFormField(
                        keyboardType: TextInputType.datetime,
                        lableText: 'Start time',
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10.h),

                // end time
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.access_time_filled_sharp),
                    Expanded(
                      child: customTextFormField(
                        keyboardType: TextInputType.datetime,
                        lableText: 'End time',
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30.h),

                // live broadcast
                Center(
                  child: SizedBox(
                    width: 200.w,
                    child: customElevatedButton(
                      context,
                      title: 'Live Broadcast',
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
