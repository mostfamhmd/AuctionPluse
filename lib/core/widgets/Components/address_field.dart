import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/Components/custom_text_form_field_with_out_prefix.dart';

TextFormField addressField(
    {required TextEditingController contAddress, String? hintText}) {
  return customTextFormFieldWithoutPrefix(
    controller: contAddress,
    keyboardType: TextInputType.streetAddress,
    hintText: hintText ?? 'Address',
  );
}
