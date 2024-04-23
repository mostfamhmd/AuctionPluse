import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/widgets/Components/custom_text_form_field.dart';
import 'package:smart_auction/core/widgets/Components/custom_title.dart';

class Auction2 extends StatelessWidget {
  const Auction2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTitle(title: 'Upcoming live shows'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Save',
              style: TextStyle(
                fontFamily: AppFonts.kInter700,
                color: AppColors.kBlue,
              ),
            ),
          ),
        ],
      ),

      // ---------------------------------------------------------
      // ---------------------------------------------------------
      // ---------------------------------------------------------

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            // the address
            customTextFormField(
              keyboardType: TextInputType.streetAddress,
              lableText: 'Address',
            ),

            SizedBox(height: 15.h),

            // add users
            customTextFormField(
              keyboardType: TextInputType.name,
              lableText: 'Add users',
            ),

            SizedBox(height: 15.h),

            // product name
            customTextFormField(
              keyboardType: TextInputType.text,
              lableText: 'Product name',
            ),

            SizedBox(height: 15.h),

            // channel selection
            customTextFormField(
              keyboardType: TextInputType.streetAddress,
              lableText: 'Channel selection',
            ),

            SizedBox(height: 15.h),

            // when do you want to live broadcasting?
            customTextFormField(
              keyboardType: TextInputType.datetime,
              lableText: 'When do you want to live broadcasting?',
            ),

            SizedBox(height: 30.h),

            // text chat with switch for toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // text chat
                const Text(
                  'Text chat',
                  style: TextStyle(
                    fontFamily: AppFonts.kInter600,
                    fontSize: 20,
                  ),
                ),

                Switch(
                  value: false,
                  onChanged: (value) {},
                ),
              ],
            ),

            SizedBox(height: 10.h),

            const Text(
              'Can the audience send messages in a live Tok broadcast?',
              style: TextStyle(
                fontFamily: AppFonts.kPoppins400,
                fontSize: 14,
                color: AppColors.kGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
