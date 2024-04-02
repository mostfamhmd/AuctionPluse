import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/feature/Authy%20Verification%20Screen/presentation/view/auth_verification_screen.dart';
import 'package:smart_auction/feature/Home/presentation/view/home_view.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_state.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/view/login_page.dart';
import 'package:smart_auction/feature/Set%20New%20Password/presentation/view/set_new_password_page.dart';
import 'package:smart_auction/feature/Success%20Screen/presentation/view/success_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialStates());

  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String resetCode = '';

  // ------( change password visibility )------
  bool visibilityPassword = true;
  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    visibilityPassword = !visibilityPassword;

    suffix = visibilityPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;

    emit(ChangePasswordVisibilityState());
  }

  // ------( check condition )------
  bool isCheck = false;
  void changeCheckCondition() {
    isCheck = !isCheck;
    emit(ChangeCheckConditionState());
  }

  // ------( sign up )------
  void signUp(BuildContext context) {
    emit(SignUpLoadingState());
    DioHelper dioHelper = DioHelper();
    dioHelper.postRequest(
      body: {
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'password': passwordController.text,
        'passwordConfirm': confirmPasswordController.text,
      },
      endPoint: "auth/signup",
    ).then(
      (value) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const SuccessScreen(),
          ),
          (route) => false,
        );
        emit(SignUpSuccessState());
      },
    ).catchError(
      (error) {
        emit(SignUpErrorState(error));
      },
    );
  }

  // ------( sign in )------
  void signIn(BuildContext context) {
    emit(SignInLoadingState());

    DioHelper dioHelper = DioHelper();
    dioHelper.postRequest(
      body: {
        'email': emailController.text.trim(),
        'password': passwordController.text,
      },
      endPoint: "auth/login",
    ).then(
      (value) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomeView(),
          ),
          (route) => false,
        );
        emit(SignInSuccessState());
      },
    ).catchError(
      (error) {
        emit(SignInErrorState(error));
      },
    );
  }

  // ------( Forget Password )------
  void forgetPassword(BuildContext context) {
    emit(ForgetPasswordLoading());
    DioHelper dioHelper = DioHelper();
    dioHelper.postRequest(
      body: {
        'email': emailController.text.trim(),
      },
      endPoint: "auth/forgotPassword",
    ).then(
      (value) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const AuthyVerificationScreen(),
          ),
          (route) => false,
        );
        emit(ForgetPasswordSuccess());
      },
    ).catchError(
      (error) {
        emit(ForgetPasswordFailure(error: error));
      },
    );
  }

  // ------( Verification )------
  void verification(BuildContext context) {
    emit(AuthyVerificationLoading());
    DioHelper dioHelper = DioHelper();
    dioHelper.postRequest(
      body: {
        'resetCode': resetCode,
      },
      endPoint: "auth/verifyResetCode",
    ).then(
      (value) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const SetNewPassword(),
          ),
          (route) => false,
        );
        emit(AuthyVerificationSuccess());
      },
    ).catchError(
      (error) {
        emit(AuthyVerificationFailure(error: error));
      },
    );
  }

  // ------( Set New Password )------
  void setNewPassword(BuildContext context) {
    emit(SetNewPasswordLoading());
    DioHelper dioHelper = DioHelper();
    dioHelper.putRequest(
      body: {
        'newPassword': passwordController.text,
        'email': emailController.text.trim(),
      },
      endPoint: "auth/resetPassword",
    ).then(
      (value) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
          (route) => false,
        );
        emit(SetNewPasswordSuccess());
      },
    ).catchError(
      (error) {
        emit(SetNewPasswordFailure(error: error));
      },
    );
  }
}
