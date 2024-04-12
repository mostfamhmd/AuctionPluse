part of 'get_all_coupons_cubit.dart';

sealed class GetAllCouponsState {}

final class GetAllCouponsInitial extends GetAllCouponsState {}

final class GetAllCouponsLoading extends GetAllCouponsState {}

final class GetAllCouponsSucccess extends GetAllCouponsState {
  final AllCouponsModel allCouponsModel;

  GetAllCouponsSucccess({required this.allCouponsModel});
}

final class GetAllCouponsFailure extends GetAllCouponsState {
  final String errorMessage;

  GetAllCouponsFailure({required this.errorMessage});
}
