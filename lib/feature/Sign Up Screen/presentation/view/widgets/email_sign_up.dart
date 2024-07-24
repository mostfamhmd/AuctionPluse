import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/Components/custom_text_form_field.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_cubit.dart';

TextFormField emailInSignupScreen(AppCubit appCubit) {
  return customTextFormField(
    controller: appCubit.emailController,
    keyboardType: TextInputType.emailAddress,
    prefixIcon: Icons.email_outlined,
    lableText: 'Email',
  );
}
