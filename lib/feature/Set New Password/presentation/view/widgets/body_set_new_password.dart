import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/widgets/Components/custom_text_form_field.dart';
import 'package:smart_auction/core/widgets/Components/elevated_button.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_cubit.dart';

class BodySetNewPassword extends StatefulWidget {
  const BodySetNewPassword({
    super.key,
  });

  @override
  State<BodySetNewPassword> createState() => _BodySetNewPasswordState();
}

class _BodySetNewPasswordState extends State<BodySetNewPassword> {
  TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title: set new password
            const Text(
              'Set new password',
              style: TextStyle(
                fontFamily: AppFonts.kInter700,
                fontSize: 32,
              ),
            ),

            SizedBox(height: size.height * 0.02),

            // description
            const Text(
              'Enter your new password below and check the hint while setting it.',
              style: TextStyle(
                fontFamily: AppFonts.kInter400,
                fontSize: 16,
              ),
            ),

            SizedBox(height: size.height * 0.07),
            // my email
            customTextFormField(
              controller: context.read<AppCubit>().emailController,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icons.email,
              lableText: 'Your Email',
              obscureText: false,
            ),

            SizedBox(height: size.height * 0.02),

            // new password
            customTextFormField(
              controller: context.read<AppCubit>().passwordController,
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: Icons.lock_outline,
              lableText: 'New password',
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.visibility_outlined),
              ),
              obscureText: true,
            ),

            SizedBox(height: size.height * 0.02),

            // confirm password
            customTextFormField(
              controller: confirmPassword,
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: Icons.lock_outline,
              lableText: 'Confirm password',
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.visibility_outlined),
              ),
              obscureText: true,
            ),

            SizedBox(height: size.height * 0.1),

            // submit
            Center(
              child: SizedBox(
                width: size.width * 0.5,
                child: customElevatedButton(
                  context,
                  title: 'Submit verification',
                  onPressed: () {
                    if (context
                            .read<AppCubit>()
                            .emailController
                            .text
                            .isNotEmpty &&
                        context.read<AppCubit>().passwordController.text ==
                            confirmPassword.text) {
                      context.read<AppCubit>().setNewPassword(context);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
