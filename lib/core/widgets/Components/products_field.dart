import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/Components/arrow_open_dialog.dart';
import 'package:smart_auction/core/widgets/Components/custom_text_form_field_with_out_prefix.dart';

TextFormField productsField(
    {required TextEditingController contProducts,
    required void Function() onTap}) {
  return customTextFormFieldWithoutPrefix(
    readOnly: true,
    controller: contProducts,
    keyboardType: TextInputType.text,
    hintText: 'Product name',
    suffixIcon: ArrowOpenDialog(onTap: onTap),
  );
}
