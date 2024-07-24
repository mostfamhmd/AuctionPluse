part of 'delete_coupon_cubit.dart';

sealed class DeleteCouponState {}

final class DeleteCouponInitial extends DeleteCouponState {}

final class DeleteCouponLoading extends DeleteCouponState {}

final class DeleteCouponSuccess extends DeleteCouponState {
  final String success;

  DeleteCouponSuccess({required this.success});
}

final class DeleteCouponFailure extends DeleteCouponState {
  final String error;

  DeleteCouponFailure({required this.error});
}
