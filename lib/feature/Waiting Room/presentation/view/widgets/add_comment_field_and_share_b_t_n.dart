import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/Components/custom_text_form_field_with_out_prefix.dart';

import 'share_text_and_icon.dart';

class AddCommentFieldAndShareBTN extends StatelessWidget {
  const AddCommentFieldAndShareBTN({
    super.key,
    this.controller,
    this.onPressed,
  });
  final TextEditingController? controller;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: customTextFormFieldWithoutPrefix(
            controller: controller,
            keyboardType: TextInputType.multiline,
            hintText: 'Add a comment',
          ),
        ),
        // share
        TextButton(
          onPressed: onPressed,
          child: const ShareTextAndIcon(),
        ),
      ],
    );
  }
}
