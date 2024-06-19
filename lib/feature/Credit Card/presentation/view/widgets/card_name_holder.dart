import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/fonts.dart';

class CardHolderName extends StatelessWidget {
  const CardHolderName({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cardholder name",
            style: TextStyle(
              fontFamily: AppFonts.kInter600,
              fontSize: 16.sp,
              color: const Color(0xFF3A3C3F),
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
              keyboardType: TextInputType.name,
              cursorColor: AppColors.kGray,
              decoration: InputDecoration(
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
