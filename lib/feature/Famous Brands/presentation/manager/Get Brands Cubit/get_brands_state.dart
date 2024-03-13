part of 'get_brands_cubit.dart';

sealed class GetBrandsState {}

final class GetBrandsInitial extends GetBrandsState {}

final class GetBrandsLoading extends GetBrandsState {}

final class GetBrandsSuccess extends GetBrandsState {
  final GetBrandsModel getBrandsModel;

  GetBrandsSuccess({required this.getBrandsModel});
}

final class GetBrandsFailure extends GetBrandsState {
  final String errorMessage;

  GetBrandsFailure({required this.errorMessage});
}
