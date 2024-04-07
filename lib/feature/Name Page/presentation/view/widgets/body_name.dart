import 'package:flutter/material.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/widgets/Components/custom_text_form_field.dart';
import 'package:smart_auction/core/widgets/Components/custom_title.dart';
import 'package:smart_auction/core/widgets/Components/elevated_button.dart';

class BodyName extends StatelessWidget {
  const BodyName({
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
            // first name
            const CustomTitle(title: 'First name'),

            SizedBox(height: size.height * 0.01),

            // text form field for write first name
            customTextFormField(
              keyboardType: TextInputType.name,
              prefixIcon: Icons.person,
            ),

            SizedBox(height: size.height * 0.02),

            // last name
            const Text(
              'Last name',
              style: TextStyle(
                fontSize: 14,
                fontFamily: AppFonts.kPoppins700,
                color: AppColors.kDarkBlue,
              ),
            ),

            SizedBox(height: size.height * 0.01),

            // text form field for write last name
            customTextFormField(
              keyboardType: TextInputType.name,
              prefixIcon: Icons.person,
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
