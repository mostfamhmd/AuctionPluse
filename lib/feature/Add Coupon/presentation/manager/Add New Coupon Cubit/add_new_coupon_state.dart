part of 'add_new_coupon_cubit.dart';

sealed class AddNewCouponState {}

final class AddNewCouponInitial extends AddNewCouponState {}

final class AddNewCouponLoading extends AddNewCouponState {}

final class AddNewCouponSuccess extends AddNewCouponState {
  final SpecificCouponModel specificCouponModel;

  AddNewCouponSuccess({required this.specificCouponModel});
}

final class AddNewCouponError extends AddNewCouponState {
  final String errorMessage;

  AddNewCouponError({required this.errorMessage});
}
