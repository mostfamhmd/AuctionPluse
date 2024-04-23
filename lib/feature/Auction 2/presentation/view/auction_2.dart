import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/widgets/Components/custom_title.dart';

class Auction2 extends StatelessWidget {
  const Auction2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 16,
        ),
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
            customTextFormFieldWithoutPrefix(
              keyboardType: TextInputType.streetAddress,
              lableText: 'Address',
              suffixIcon: const Icon(
                Icons.arrow_forward_ios,
                size: 10,
              ),
            ),

            SizedBox(height: 15.h),

            // add users
            customTextFormFieldWithoutPrefix(
              keyboardType: TextInputType.name,
              lableText: 'Add users',
              suffixIcon: const Icon(
                Icons.arrow_forward_ios,
                size: 10,
              ),
            ),

            SizedBox(height: 15.h),

            // product name
            customTextFormFieldWithoutPrefix(
              keyboardType: TextInputType.text,
              lableText: 'Product name',
              suffixIcon: const Icon(
                Icons.arrow_forward_ios,
                size: 10,
              ),
            ),

            SizedBox(height: 15.h),

            // channel selection
            customTextFormFieldWithoutPrefix(
              keyboardType: TextInputType.streetAddress,
              lableText: 'Channel selection',
              suffixIcon: const Icon(
                Icons.arrow_forward_ios,
                size: 10,
              ),
            ),

            SizedBox(height: 15.h),

            // when do you want to live broadcasting?
            customTextFormFieldWithoutPrefix(
              keyboardType: TextInputType.datetime,
              lableText: 'When do you want to live broadcasting?',
              suffixIcon: const Icon(
                Icons.arrow_forward_ios,
                size: 10,
              ),
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

TextFormField customTextFormFieldWithoutPrefix({
  TextEditingController? controller,
  required TextInputType keyboardType,
  IconData? prefixIcon,
  String? lableText,
  Widget? suffixIcon,
  bool obscureText = false,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    obscureText: obscureText,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: (value) {
      if (value!.isEmpty) {
        return 'Required';
      }
      return null;
    },
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: AppColors.kGray),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: AppColors.kGray),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: AppColors.kBlack),
      ),
      suffixIcon: suffixIcon,
      labelText: lableText,
      labelStyle: const TextStyle(color: AppColors.kBlack, fontSize: 10),
      hintText: lableText,
      hintStyle: const TextStyle(color: AppColors.kGray, fontSize: 12),
    ),
  );
}
