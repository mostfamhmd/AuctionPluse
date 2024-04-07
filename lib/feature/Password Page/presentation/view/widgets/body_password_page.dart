import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/Components/custom_text_form_field.dart';
import 'package:smart_auction/core/widgets/Components/custom_title.dart';
import 'package:smart_auction/core/widgets/Components/elevated_button.dart';

class BodyPasswordPage extends StatelessWidget {
  const BodyPasswordPage({
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
            // old password
            const CustomTitle(title: 'Old password'),

            SizedBox(height: size.height * 0.01),

            // text form field for write old password
            customTextFormField(
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: Icons.lock_outline,
              obscureText: true,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.visibility),
              ),
            ),

            SizedBox(height: size.height * 0.01),

            // new password
            const CustomTitle(title: 'New password'),

            SizedBox(height: size.height * 0.01),

            // text form field for write new password
            customTextFormField(
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: Icons.lock_outline,
              obscureText: true,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.visibility),
              ),
            ),

            SizedBox(height: size.height * 0.01),

            // confirm new password
            const CustomTitle(title: 'Confirm new password'),

            SizedBox(height: size.height * 0.01),

            // text form field for write confirm new password
            customTextFormField(
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: Icons.lock_outline,
              obscureText: true,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.visibility),
              ),
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
