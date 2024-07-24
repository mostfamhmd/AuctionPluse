// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/feature/Address%20Page/data/models/address_model.dart';
import 'package:smart_auction/feature/Authy%20Verification%20Screen/presentation/view/auth_verification_screen.dart';
import 'package:smart_auction/feature/CheckOut%20Page/data/models/check_out_model.dart';
import 'package:smart_auction/feature/Home/presentation/view/home_view.dart';
import 'package:smart_auction/feature/Login%20Page/data/login_model.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_state.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/view/login_page.dart';
import 'package:smart_auction/feature/Orders%20Page/data/models/orders_model.dart';
import 'package:smart_auction/feature/Set%20New%20Password/presentation/view/set_new_password_page.dart';
import 'package:smart_auction/feature/Sign%20Up%20Screen/data/signup_model.dart';
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
  bool visibilityConfirmPassword = true;
  IconData suffix = Icons.visibility_outlined;
  IconData suffixConfirm = Icons.visibility_outlined;

  void changePasswordVisibility() {
    visibilityPassword = !visibilityPassword;

    suffix = visibilityPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;

    emit(ChangePasswordVisibilityState());
  }

  void changeConfirmPasswordVisibility() {
    visibilityConfirmPassword = !visibilityConfirmPassword;

    suffixConfirm = visibilityConfirmPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;

    emit(ChangeConfirmPasswordVisibilityState());
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
        emit(SignUpSuccessState(signUpData: SignUpData.fromJson(value)));
      },
    ).catchError(
      (error) {
        emit(SignUpErrorState(error));
      },
    );
  }

  // ------( sign in )------
  void signIn(BuildContext context) async {
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
        emailController.clear();
        passwordController.clear();
        emit(SignInSuccessState(loginData: LoginData.fromJson(value)));
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

  LoginData? loginDataModel;

  // ------( get user data )------
  void getUserData() async {
    emit(GetUserDataLoading());

    String token = await AppConsts.getData(AppConsts.kUserToken);

    DioHelper dioHelper = DioHelper();
    dioHelper.getRequest(endPoint: "users/getMe", token: token).then(
      (value) {
        loginDataModel = LoginData.fromJson(value);
        emit(GetUserDataSuccess());
      },
    ).catchError(
      (error) {
        emit(GetUserDataFailure(error: error));
      },
    );
  }

  void updateEmail(BuildContext context, String newEmail) async {
    emit(UpdateEmailLoading());

    String token = await AppConsts.getData(AppConsts.kUserToken);

    DioHelper dioHelper = DioHelper();
    dioHelper.putRequest(
      body: {'email': newEmail},
      endPoint: "users/updateMe",
      token: token,
    ).then(
      (value) {
        loginDataModel?.data?.email = newEmail;
        emit(UpdateEmailSuccess());
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Email updated successfully")),
        );
      },
    ).catchError(
      (error) {
        emit(UpdateEmailFailure(error: error));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to update email")),
        );
      },
    );
  }

  void updatePassword(BuildContext context, String newPassword) async {
    emit(UpdatePasswordLoading());

    String token = await AppConsts.getData(AppConsts.kUserToken);

    DioHelper dioHelper = DioHelper();
    dioHelper.putRequest(
      body: {'password': newPassword},
      endPoint: "users/changeMyPassword",
      token: token,
    ).then(
      (value) {
        loginDataModel?.data?.passwordConfirm = newPassword;
        emit(UpdatePasswordSuccess());
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Password updated successfully")),
        );
      },
    ).catchError(
      (error) {
        emit(UpdatePasswordFailure(error: error));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to update password")),
        );
      },
    );
  }

  void checkOut({
    required String cartId,
  }) async {
    emit(CheckOutLoading());

    String token = await AppConsts.getData(AppConsts.kUserToken);

    DioHelper dioHelper = DioHelper();
    dioHelper
        .getRequest(endPoint: 'orders/checkout-session/$cartId', token: token)
        .then((value) {
      CheckOutModel checkOutModel = CheckOutModel.fromJson(value);
      emit(CheckOutSuccess(checkOutModel: checkOutModel));
    }).catchError((error) {
      emit(CheckOutFailure(error: error.toString()));
    });
  }

  // create Cash Order
  void createCashOrder({required String cartId}) async {
    emit(CreateCashOrderLoading());

    String id = await AppConsts.getData(AppConsts.kUserId);
    String token = await AppConsts.getData(AppConsts.kUserToken);

    DioHelper dioHelper = DioHelper();
    dioHelper.postRequest(
      endPoint: "orders/$cartId",
      token: token,
      body: {
        'user': id,
        "_id": cartId,
      },
    ).then(
      (value) {
        emit(CreateCashOrderSuccess());
      },
    ).catchError(
      (error) {
        emit(CreateCashOrderFailure(error: error.toString()));
      },
    );
  }

  // get user orders
  OrdersModel? ordersModel;
  void getUserOrders() async {
    emit(GetUserOrdersLoading());

    String token = await AppConsts.getData(AppConsts.kUserToken);

    if (kDebugMode) {
      print('token ----------- $token');
    }

    DioHelper dioHelper = DioHelper();
    dioHelper.getRequest(endPoint: "orders", token: token).then(
      (value) {
        ordersModel = OrdersModel.fromJson(value);
        emit(GetUserOrdersSuccess());
      },
    ).catchError(
      (error) {
        emit(GetUserOrdersFailure(error: error.toString()));
      },
    );
  }

  // get user address
  AddressModel? addressModel;
  void getUserAddress() async {
    emit(GetUserAddressLoading());

    String token = await AppConsts.getData(AppConsts.kUserToken);

    DioHelper dioHelper = DioHelper();
    dioHelper.getRequest(endPoint: "adress", token: token).then(
      (value) {
        addressModel = AddressModel.fromJson(value);
        emit(GetUserAddressSuccess());
      },
    ).catchError(
      (error) {
        emit(GetUserAddressFailure(error: error.toString()));
      },
    );
  }

  // add new address
  void addNewAddress(
    BuildContext context, {
    required String address,
    required String phone,
    required String city,
    required String zipCode,
  }) async {
    emit(AddNewAddressLoading());

    String token = await AppConsts.getData(AppConsts.kUserToken);

    DioHelper dioHelper = DioHelper();
    dioHelper.postRequest(
      endPoint: "adress",
      token: token,
      body: {
        "details": address,
        "phone": phone,
        "city": city,
        "postalCode": zipCode,
      },
    ).whenComplete(() {
      mySuccessSnackBar(context, 'Address added successfully.');
      Navigator.pop(context, true);
    }).then(
      (value) {
        emit(AddNewAddressSuccess());
      },
    ).catchError(
      (error) {
        emit(AddNewAddressFailure(error: error.toString()));
      },
    );
  }

  // delete address
  void deleteAddress(
    BuildContext context, {
    required String addressId,
  }) async {
    emit(DeleteAddressLoading());

    String token = await AppConsts.getData(AppConsts.kUserToken);

    DioHelper dioHelper = DioHelper();
    dioHelper
        .deleteRequest(endPoint: "adress/$addressId", token: token)
        .whenComplete(() {
      mySuccessSnackBar(context, 'Address removed successfully.');
      Navigator.pop(context, true);
    }).then(
      (value) {
        getUserAddress(); // Refresh address list after deletion
        emit(DeleteAddressSuccess());
      },
    ).catchError(
      (error) {
        emit(DeleteAddressFailure(error: error.toString()));
      },
    );
  }

  // update address
  void updateAddress(
    BuildContext context, {
    required String addressId,
    required String phone,
    required String city,
  }) async {
    emit(UpdateAddressLoading());

    String token = await AppConsts.getData(AppConsts.kUserToken);

    DioHelper dioHelper = DioHelper();
    dioHelper.putRequest(
      endPoint: "adress/$addressId",
      token: token,
      body: {"phone": phone, "city": city},
    ).whenComplete(() {
      mySuccessSnackBar(context, 'Address updated successfully.');
      Navigator.pop(context, true);
    }).then(
      (value) {
        emit(UpdateAddressSuccess());
      },
    ).catchError(
      (error) {
        emit(UpdateAddressFailure(error: error.toString()));
      },
    );
  }

  // update product
  void updateProduct({
    required String productId,
    required String name,
    required String price,
    required String discount,
    required String quantity,
    required File imageFile,
    required List<File> listImageFile,
    required String category,
    required List<String> subCategories,
    required String description,
  }) async {
    emit(UpdateProductLoading());
    DioHelper dioHelper = DioHelper();
    String token = await AppConsts.getData(AppConsts.kUserToken);
    dynamic imageCoverMultipart = await MultipartFile.fromFile(
      imageFile.path,
      contentType: MediaType('imageCover', 'jpeg'),
    );
    List<dynamic> multiParts = [];
    for (int i = 0; i < listImageFile.length; i++) {
      dynamic image = await MultipartFile.fromFile(
        listImageFile[i].path,
        contentType: MediaType('image$i', 'jpeg'),
      );
      multiParts.add(image);
    }
    FormData formData = FormData.fromMap(
      {
        "name": name,
        "price": price,
        "quantity": quantity,
        "imageCover": imageCoverMultipart,
        "images": multiParts,
        "description": description,
        "category": category,
        "discountedPrice": discount,
        "subcategories": subCategories,
      },
    );
    await dioHelper
        .putRequest(
      endPoint: "products/$productId",
      token: token,
      body: formData,
    )
        .then(
      (value) {
        emit(UpdateProductSuccess());
      },
    ).catchError(
      (error) {
        emit(UpdateProductFailure(error: error.toString()));
      },
    );
  }

  void logout(BuildContext context) async {
    emit(SignOutLoading());

    bool? logout;
    try {
      await AppConsts.removeData(AppConsts.kUserId);
      logout = true;
    } catch (e) {
      logout = false;
    }

    if (logout) {
      emit(SignOutSuccess());
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const LoginScreen(),
        ),
        (route) => false,
      );
    } else {
      emit(SignOutFailure(error: 'error'));
    }
  }
}
