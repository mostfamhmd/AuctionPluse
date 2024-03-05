import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/fonts.dart';
import '../../../../../core/utils/icons.dart';

class CartNumber extends StatefulWidget {
  const CartNumber({
    super.key,
  });

  @override
  State<CartNumber> createState() => _CartNumberState();
}

class _CartNumberState extends State<CartNumber> {
  String cardNumber = '';
  TextEditingController cardNumberCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Card number",
            style: TextStyle(
              fontFamily: AppFonts.kInter600,
              fontSize: 16.sp,
              color: const Color(
                0xFF3A3C3F,
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15.r),
              border: Border(
                bottom: BorderSide(width: 4.w, color: AppColors.kLightBlue),
              ),
            ),
            child: TextFormField(
              style: TextStyle(
                fontFamily: AppFonts.kInter500,
                fontSize: 16.sp,
                color: const Color(0xFF424D59),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16),
                CardNumberInputFormatter(),
              ],
              cursorColor: AppColors.kGray,
              decoration: InputDecoration(
                suffixIcon: IntrinsicWidth(
                  child: Row(
                    children: [
                      SvgPicture.asset(AppIcons.kMasterCardLogo),
                      SizedBox(
                        width: 30.w,
                      ),
                      SvgPicture.asset(AppIcons.kCardLogo),
                      SizedBox(
                        width: 10.w,
                      ),
                    ],
                  ),
                ),
                border: buildBorder(),
                focusedBorder: buildBorder(),
                enabledBorder: buildBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.3),
      ),
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    String inputData = newValue.text;
    StringBuffer buffer = StringBuffer();

    for (var i = 0; i < inputData.length; i++) {
      buffer.write(inputData[i]);
      int index = i + 1;

      if (index % 4 == 0 && inputData.length != index) {
        buffer.write(" ");
      }
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(
        offset: buffer.toString().length,
      ),
    );
  }
}
