import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/widgets/Components/custom_text_form_field_with_out_prefix.dart';

class SelectTime extends StatelessWidget {
  const SelectTime({
    super.key,
    required this.hintText,
    this.onTap,
  });
  final String hintText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.access_time_filled_sharp,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: customTextFormFieldWithoutPrefix(
            onTap: onTap,
            readOnly: true,
            keyboardType: TextInputType.datetime,
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
