part of 'delete_brand_cubit.dart';

sealed class DeleteBrandState {}

final class DeleteBrandInitial extends DeleteBrandState {}

final class DeleteBrandLoading extends DeleteBrandState {}

final class DeleteBrandSuccess extends DeleteBrandState {
  final String success;

  DeleteBrandSuccess({required this.success});
}

final class DeleteBrandError extends DeleteBrandState {
  final String error;

  DeleteBrandError({required this.error});
}
