import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/Components/custom_text_form_field.dart';
import 'package:smart_auction/core/widgets/Components/custom_title.dart';
import 'package:smart_auction/core/widgets/Components/elevated_button.dart';
import 'package:smart_auction/feature/Login%20Page/data/login_model.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_cubit.dart';

class BodyPasswordPage extends StatelessWidget {
  const BodyPasswordPage({
    super.key,
    required this.userData,
  });

  final LoginData userData;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final TextEditingController oldPassword = TextEditingController();
    final TextEditingController newPassword = TextEditingController();
    final TextEditingController newPasswordConfirm = TextEditingController();

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
              controller: oldPassword,
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
              controller: newPassword,
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
              controller: newPasswordConfirm,
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
                onPressed: () {
                  if (oldPassword.text == userData.data?.passwordConfirm) {
                    if (newPassword.text == newPasswordConfirm.text) {
                      AppCubit.get(context).updatePassword(
                        context,
                        newPassword.text,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Your password not match"),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Your old password not correct"),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
