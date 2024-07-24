import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_auction/core/utils/colors.dart';

SizedBox customPinput(Size size, TextEditingController? controller) {
  return SizedBox(
    width: size.width * 0.15,
    child: TextFormField(
      controller: controller,
      textAlign: TextAlign.center,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: AppColors.kGray,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: AppColors.kGray,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: AppColors.kBlack,
          ),
        ),
        hintText: '0',
      ),
    ),
  );
}
