part of 'update_coupon_cubit.dart';

sealed class UpdateCouponState {}

final class UpdateCouponInitial extends UpdateCouponState {}

final class UpdateCouponLoading extends UpdateCouponState {}

final class UpdateCouponSuccess extends UpdateCouponState {
  final SpecificCouponModel specificCouponModel;

  UpdateCouponSuccess({required this.specificCouponModel});
}

final class UpdateCouponFailure extends UpdateCouponState {
  final String error;

  UpdateCouponFailure({required this.error});
}
