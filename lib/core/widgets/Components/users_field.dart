import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/Components/arrow_open_dialog.dart';
import 'package:smart_auction/core/widgets/Components/custom_text_form_field_with_out_prefix.dart';

TextFormField usersField(BuildContext context,
    {required TextEditingController contUsers,
    required void Function() onTap}) {
  return customTextFormFieldWithoutPrefix(
    readOnly: true,
    controller: contUsers,
    keyboardType: TextInputType.name,
    hintText: 'Add users',
    suffixIcon: ArrowOpenDialog(
      onTap: onTap,
    ),
  );
}
