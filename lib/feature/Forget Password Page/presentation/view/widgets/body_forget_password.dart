import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/widgets/Components/custom_text_form_field.dart';
import 'package:smart_auction/core/widgets/Components/elevated_button.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_cubit.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_state.dart';

class BodyForgetPassword extends StatefulWidget {
  const BodyForgetPassword({
    super.key,
  });

  @override
  State<BodyForgetPassword> createState() => _BodyForgetPasswordState();
}

class _BodyForgetPasswordState extends State<BodyForgetPassword> {
  TextEditingController forgetController = TextEditingController();
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocListener<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is ForgetPasswordLoading) {
          isLoading.value = true;
        } else {
          isLoading.value = false;
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title: forgot password
              const Text(
                'Forgot Password',
                style: TextStyle(
                  fontFamily: AppFonts.kInter700,
                  fontSize: 30,
                ),
              ),

              SizedBox(height: size.height * 0.02),

              // description
              const Text(
                'Opps. It happens to the best of us. Input your email address to fix the issue.',
                style: TextStyle(
                  fontFamily: AppFonts.kInter400,
                  fontSize: 16,
                ),
              ),

              SizedBox(height: size.height * 0.07),

              // enter email
              customTextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: context.read<AppCubit>().emailController,
                prefixIcon: Icons.email_outlined,
                lableText: 'Email',
              ),

              SizedBox(height: size.height * 0.1),

              // submit
              ValueListenableBuilder(
                valueListenable: isLoading,
                builder: (BuildContext context, value, Widget? child) =>
                    value == true
                        ? const LoadingState()
                        : Center(
                            child: customElevatedButton(
                              context,
                              title: 'Submit',
                              onPressed: () {
                                if (context
                                    .read<AppCubit>()
                                    .emailController
                                    .text
                                    .isNotEmpty) {
                                  context
                                      .read<AppCubit>()
                                      .forgetPassword(context);
                                }
                              },
                            ),
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
