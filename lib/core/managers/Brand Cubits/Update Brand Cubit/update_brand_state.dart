part of 'update_brand_cubit.dart';

sealed class UpdateBrandState {}

final class UpdateBrandInitial extends UpdateBrandState {}

final class UpdateBrandLoading extends UpdateBrandState {}

final class UpdateBrandSuccess extends UpdateBrandState {
  final String success;

  UpdateBrandSuccess({required this.success});
}

final class UpdateBrandError extends UpdateBrandState {
  final String error;

  UpdateBrandError({required this.error});
}
