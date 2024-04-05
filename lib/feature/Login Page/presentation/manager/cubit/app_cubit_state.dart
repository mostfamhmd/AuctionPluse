import 'package:smart_auction/feature/Login%20Page/data/login_model.dart';
import 'package:smart_auction/feature/Sign%20Up%20Screen/data/signup_model.dart';

abstract class AppStates {}

class InitialStates extends AppStates {}

class ChangePasswordVisibilityState extends AppStates {}

class ChangeConfirmPasswordVisibilityState extends AppStates {}

class ChangeCheckConditionState extends AppStates {}

class SignUpLoadingState extends AppStates {}

class SignUpSuccessState extends AppStates {
  final SignUpData signUpData;

  SignUpSuccessState({required this.signUpData});
}

class SignUpErrorState extends AppStates {
  String error;
  SignUpErrorState(this.error);
}

class SignInLoadingState extends AppStates {}

class SignInSuccessState extends AppStates {
  final LoginData loginData;

  SignInSuccessState({required this.loginData});
}

class SignInErrorState extends AppStates {
  String error;
  SignInErrorState(this.error);
}

class ForgetPasswordLoading extends AppStates {}

class ForgetPasswordSuccess extends AppStates {}

class ForgetPasswordFailure extends AppStates {
  final String error;

  ForgetPasswordFailure({required this.error});
}

class AuthyVerificationLoading extends AppStates {}

class AuthyVerificationFailure extends AppStates {
  final String error;

  AuthyVerificationFailure({required this.error});
}

class AuthyVerificationSuccess extends AppStates {}

class SetNewPasswordLoading extends AppStates {}

class SetNewPasswordSuccess extends AppStates {}

class SetNewPasswordFailure extends AppStates {
  final String error;

  SetNewPasswordFailure({required this.error});
}
