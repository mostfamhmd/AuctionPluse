import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/fonts.dart';

class ExpiryDate extends StatelessWidget {
  const ExpiryDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Expiry date",
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
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4),
              ExpiryDateInputFormatter(),
            ],
            cursorColor: AppColors.kGray,
            decoration: InputDecoration(
              border: buildBorder(),
              focusedBorder: buildBorder(),
              enabledBorder: buildBorder(),
            ),
          ),
        ),
      ],
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

class ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write(' / ');
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}
