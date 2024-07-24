part of 'delete_specific_product_cubit.dart';

sealed class DeleteSpecificProductState {}

final class DeleteSpecificProductInitial extends DeleteSpecificProductState {}

final class DeleteSpecificProductLoading extends DeleteSpecificProductState {}

final class DeleteSpecificProductSuccess extends DeleteSpecificProductState {
  final String success;

  DeleteSpecificProductSuccess({required this.success});
}

final class DeleteSpecificProductFailure extends DeleteSpecificProductState {
  final String error;

  DeleteSpecificProductFailure({required this.error});
}
