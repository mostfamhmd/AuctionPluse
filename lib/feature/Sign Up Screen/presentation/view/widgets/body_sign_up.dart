import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/core/widgets/Components/app_logo.dart';
import 'package:smart_auction/core/widgets/Components/app_title.dart';
import 'package:smart_auction/core/widgets/Components/elevated_button.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_cubit.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_state.dart';
import 'package:smart_auction/feature/Sign%20Up%20Screen/presentation/view/widgets/conditional_builder.dart';
import 'package:smart_auction/feature/Sign%20Up%20Screen/presentation/view/widgets/create_new_account.dart';
import 'package:smart_auction/feature/Sign%20Up%20Screen/presentation/view/widgets/email_sign_up.dart';
import 'package:smart_auction/feature/Sign%20Up%20Screen/presentation/view/widgets/name_sign_up.dart';
import 'package:smart_auction/feature/Sign%20Up%20Screen/presentation/view/widgets/password.dart';
import 'package:smart_auction/feature/Sign%20Up%20Screen/presentation/view/widgets/password_again.dart';
import 'package:smart_auction/feature/Sign%20Up%20Screen/presentation/view/widgets/sign_in.dart';
import 'package:smart_auction/core/helpers/cache_helper.dart';
import 'package:smart_auction/main.dart';

class BodySignUp extends StatefulWidget {
  const BodySignUp({
    super.key,
  });

  @override
  State<BodySignUp> createState() => _BodySignUpState();
}

class _BodySignUpState extends State<BodySignUp> {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          userId = state.signUpData.data!.sId!;
          CacheHelper().setData(AppConsts.kUserId, state.signUpData.data!.sId!);
          CacheHelper().setData(AppConsts.kUserToken, state.signUpData.token!);
          CacheHelper()
              .setData(AppConsts.kUserEmail, state.signUpData.data!.email!);
          CacheHelper()
              .setData(AppConsts.kUserName, state.signUpData.data!.name!);
          CacheHelper()
              .setData(AppConsts.kUserRole, state.signUpData.data!.role!);

          CacheHelper().setListData(
              AppConsts.kUserWhichlist, state.signUpData.data!.wishlist ?? []);
        }
      },
      builder: (context, state) {
        AppCubit appCubit = AppCubit.get(context);
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // App Logo
                  const AppLogo(),

                  // title
                  const AppTitle(),

                  // Create a new account
                  const CreateNeAccount(),

                  SizedBox(height: 20.h),

                  // Full name
                  nameInSignupScreen(appCubit),

                  SizedBox(height: 20.h),

                  // Email
                  emailInSignupScreen(appCubit),

                  SizedBox(height: 20.h),

                  // Password
                  passwordInSignupScreen(appCubit),

                  SizedBox(height: 20.h),

                  // Password Again
                  passwordAgainInSignupScreen(appCubit),

                  SizedBox(height: 20.h),

                  // By creating an avvount you have to agree with our them & condition
                  ConditionsInSignupScreen(appCubit: appCubit),

                  SizedBox(height: 20.h),

                  // Sign up
                  ConditionalBuilder(
                    condition: state is! SignUpLoadingState,
                    builder: (context) => SizedBox(
                      width: double.infinity,
                      child: customElevatedButton(
                        context,
                        backgroundColor: appCubit.isCheck
                            ? AppColors.kLightBlue
                            : AppColors.kGray,
                        title: 'Sign up',
                        onPressed: () {
                          if (appCubit.isCheck) {
                            if (formKey.currentState!.validate()) {
                              appCubit.signUp(context);
                            }
                          }
                        },
                      ),
                    ),
                    fallback: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // Sign in
                  const Signin(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
