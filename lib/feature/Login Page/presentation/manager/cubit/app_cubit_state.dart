import 'package:smart_auction/feature/CheckOut%20Page/data/models/check_out_model.dart';
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

class GetUserDataLoading extends AppStates {}

class GetUserDataSuccess extends AppStates {}

class GetUserDataFailure extends AppStates {
  final String error;

  GetUserDataFailure({required this.error});
}

class UpdateEmailLoading extends AppStates {}

class UpdateEmailSuccess extends AppStates {}

class UpdateEmailFailure extends AppStates {
  final String error;

  UpdateEmailFailure({required this.error});
}

class UpdatePasswordLoading extends AppStates {}

class UpdatePasswordSuccess extends AppStates {}

class UpdatePasswordFailure extends AppStates {
  final String error;

  UpdatePasswordFailure({required this.error});
}

class GetAllProductsLoading extends AppStates {}

class GetAllProductsSuccess extends AppStates {}

class GetAllProductsFailure extends AppStates {
  final String error;

  GetAllProductsFailure({required this.error});
}

class DeleteAllProductsFromCartLoading extends AppStates {}

class DeleteAllProductsFromCartSuccess extends AppStates {}

class DeleteAllProductsFromCartFailure extends AppStates {
  final String error;

  DeleteAllProductsFromCartFailure({required this.error});
}

class GetUserOrdersLoading extends AppStates {}

class GetUserOrdersSuccess extends AppStates {}

class GetUserOrdersFailure extends AppStates {
  final String error;

  GetUserOrdersFailure({required this.error});
}

class CheckOutLoading extends AppStates {}

class CheckOutSuccess extends AppStates {
  final CheckOutModel checkOutModel;

  CheckOutSuccess({required this.checkOutModel});
}

class CheckOutFailure extends AppStates {
  final String error;

  CheckOutFailure({required this.error});
}

class CreateCashOrderLoading extends AppStates {}

class CreateCashOrderSuccess extends AppStates {}

class CreateCashOrderFailure extends AppStates {
  final String error;

  CreateCashOrderFailure({required this.error});
}

class GetUserAddressLoading extends AppStates {}

class GetUserAddressSuccess extends AppStates {}

class GetUserAddressFailure extends AppStates {
  final String error;

  GetUserAddressFailure({required this.error});
}

class AddNewAddressLoading extends AppStates {}

class AddNewAddressSuccess extends AppStates {}

class AddNewAddressFailure extends AppStates {
  final String error;

  AddNewAddressFailure({required this.error});
}

class DeleteAddressLoading extends AppStates {}

class DeleteAddressSuccess extends AppStates {}

class DeleteAddressFailure extends AppStates {
  final String error;

  DeleteAddressFailure({required this.error});
}

class UpdateAddressLoading extends AppStates {}

class UpdateAddressSuccess extends AppStates {}

class UpdateAddressFailure extends AppStates {
  final String error;

  UpdateAddressFailure({required this.error});
}

class UpdateProductLoading extends AppStates {}

class UpdateProductSuccess extends AppStates {}

class UpdateProductFailure extends AppStates {
  final String error;

  UpdateProductFailure({required this.error});
}

class SignOutLoading extends AppStates {}

class SignOutSuccess extends AppStates {
  // final OrdersModel ordersModel;

  // SignOutSuccess({required this.ordersModel});
}

class SignOutFailure extends AppStates {
  final String error;

  SignOutFailure({required this.error});
}
