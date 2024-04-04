import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/widgets/Components/app_logo.dart';
import 'package:smart_auction/core/widgets/Components/app_title.dart';
import 'package:smart_auction/core/widgets/Components/elevated_button.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_cubit.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_state.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/view/widgets/email_login.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/view/widgets/forget_password_login.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/view/widgets/password_login.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/view/widgets/register_login.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/view/widgets/sign_in_to.dart';

class BodyLogin extends StatefulWidget {
  const BodyLogin({super.key});

  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit appCubit = AppCubit.get(context);
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // App Logo
                      const AppLogo(),

                      // title
                      const AppTitle(),

                      SizedBox(height: 20.h),

                      // Sign in to continue
                      const SigninToContinue(),

                      SizedBox(height: 20.h),

                      // Email
                      emailInSigninScreen(appCubit),

                      SizedBox(height: 20.h),

                      // Password
                      passwordInSigninScreen(appCubit),

                      SizedBox(height: 20.h),

                      // Sign in
                      ConditionalBuilder(
                        condition: state is! SignInLoadingState,
                        builder: (context) => SizedBox(
                          width: double.infinity,
                          child: customElevatedButton(
                            context,
                            title: 'Sign in',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                appCubit.signIn(context);
                              }
                            },
                          ),
                        ),
                        fallback: (context) => const Center(
                          child: LoadingState(),
                        ),
                      ),

                      SizedBox(height: 20.h),

                      // Forgot Password
                      const ForgotPassword(),

                      SizedBox(height: 20.h),

                      // Register
                      const Register(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
