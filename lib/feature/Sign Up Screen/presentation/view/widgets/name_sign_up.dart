import 'package:flutter/material.dart';

import 'package:smart_auction/core/widgets/Components/custom_text_form_field.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_cubit.dart';

TextFormField nameInSignupScreen(AppCubit appCubit) {
  return customTextFormField(
    controller: appCubit.nameController,
    keyboardType: TextInputType.name,
    lableText: 'Full Name',
    prefixIcon: Icons.person_outline,
  );
}
