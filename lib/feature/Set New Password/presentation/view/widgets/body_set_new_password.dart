import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/widgets/Components/custom_text_form_field.dart';
import 'package:smart_auction/core/widgets/Components/elevated_button.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_cubit.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_state.dart';

class BodySetNewPassword extends StatefulWidget {
  const BodySetNewPassword({
    super.key,
  });

  @override
  State<BodySetNewPassword> createState() => _BodySetNewPasswordState();
}

class _BodySetNewPasswordState extends State<BodySetNewPassword> {
  TextEditingController confirmPassword = TextEditingController();
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is SetNewPasswordLoading) {
          isLoading.value = true;
        } else {
          isLoading.value = false;
        }
      },
      builder: (context, state) {
        AppCubit passwordCubit = AppCubit.get(context);
        AppCubit confirmPasswordCubit = AppCubit.get(context);
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
                    onPressed: () => passwordCubit.changePasswordVisibility(),
                    icon: Icon(
                      passwordCubit.visibilityPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                  obscureText: passwordCubit.visibilityPassword,
                ),

                SizedBox(height: size.height * 0.02),

                // confirm password
                customTextFormField(
                  controller: confirmPassword,
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: Icons.lock_outline,
                  lableText: 'Confirm password',
                  suffixIcon: IconButton(
                    onPressed: () =>
                        confirmPasswordCubit.changeConfirmPasswordVisibility(),
                    icon: Icon(
                      confirmPasswordCubit.visibilityConfirmPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                  obscureText: confirmPasswordCubit.visibilityConfirmPassword,
                ),

                SizedBox(height: size.height * 0.1),

                // submit
                ValueListenableBuilder(
                  valueListenable: isLoading,
                  builder: (BuildContext context, value, Widget? child) =>
                      value == true
                          ? const LoadingState()
                          : Center(
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
                                        context
                                                .read<AppCubit>()
                                                .passwordController
                                                .text ==
                                            confirmPassword.text) {
                                      context
                                          .read<AppCubit>()
                                          .setNewPassword(context);
                                    }
                                  },
                                ),
                              ),
                            ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
