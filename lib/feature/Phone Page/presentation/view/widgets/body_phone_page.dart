import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/Components/custom_text_form_field.dart';
import 'package:smart_auction/core/widgets/Components/custom_title.dart';
import 'package:smart_auction/core/widgets/Components/elevated_button.dart';

class BodyPhonePage extends StatelessWidget {
  const BodyPhonePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // phone number
            const CustomTitle(title: 'Phone number'),

            SizedBox(height: size.height * 0.01),

            // text form field for write phone number
            customTextFormField(
              keyboardType: TextInputType.phone,
              prefixIcon: Icons.phone_android,
            ),

            SizedBox(height: size.height * 0.05),

            // save button
            SizedBox(
              width: size.width,
              child: customElevatedButton(
                context,
                title: 'Save',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
