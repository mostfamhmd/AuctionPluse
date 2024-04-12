part of 'get_specific_coupon_cubit.dart';

sealed class GetSpecificCouponState {}

final class GetSpecificCouponInitial extends GetSpecificCouponState {}

final class GetSpecificCouponLoading extends GetSpecificCouponState {}

final class GetSpecificCouponSuccess extends GetSpecificCouponState {
  final AllCouponsModel specificCouponModel;

  GetSpecificCouponSuccess({required this.specificCouponModel});
}

final class GetSpecificCouponError extends GetSpecificCouponState {
  final String errorMessage;

  GetSpecificCouponError({required this.errorMessage});
}
