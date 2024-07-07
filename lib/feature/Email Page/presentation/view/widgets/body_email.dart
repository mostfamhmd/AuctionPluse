import 'package:flutter/material.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/widgets/Components/custom_text_form_field.dart';
import 'package:smart_auction/core/widgets/Components/custom_title.dart';
import 'package:smart_auction/core/widgets/Components/elevated_button.dart';
import 'package:smart_auction/feature/Login%20Page/data/login_model.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_cubit.dart';

class BodyEmail extends StatelessWidget {
  const BodyEmail({
    super.key,
    required this.userData,
  });

  final LoginData userData;

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();

    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // change email
              const CustomTitle(title: 'Change email'),

              SizedBox(height: size.height * 0.01),

              // text form field for write new email
              customTextFormField(
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email_outlined,
                lableText: userData.data?.email,
                controller: email,
              ),

              SizedBox(height: size.height * 0.01),

              // send message (note)
              const Text(
                'We will send verification to your new email',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.kBlue,
                  fontFamily: AppFonts.kPoppins400,
                ),
              ),

              SizedBox(height: size.height * 0.05),

              // change email button
              SizedBox(
                width: size.width,
                child: customElevatedButton(
                  context,
                  title: 'Change email',
                  onPressed: () {
                    if (email.text.isNotEmpty) {
                      AppCubit.get(context).updateEmail(
                        context,
                        email.text.trim(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
