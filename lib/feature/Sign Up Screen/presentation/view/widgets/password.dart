import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/Components/custom_text_form_field.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_cubit.dart';

TextFormField passwordInSignupScreen(AppCubit appCubit) {
  return customTextFormField(
    controller: appCubit.passwordController,
    keyboardType: TextInputType.visiblePassword,
    prefixIcon: Icons.lock_outline,
    lableText: 'Password',
    suffixIcon: IconButton(
      onPressed: () => appCubit.changePasswordVisibility(),
      icon: Icon(
        appCubit.visibilityPassword
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined,
      ),
    ),
    obscureText: appCubit.visibilityPassword,
  );
}
