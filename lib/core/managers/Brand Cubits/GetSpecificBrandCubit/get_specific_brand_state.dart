part of 'get_specific_brand_cubit.dart';

sealed class GetSpecificBrandState {}

final class GetSpecificBrandInitial extends GetSpecificBrandState {}

final class GetSpecificBrandLoading extends GetSpecificBrandState {}

final class GetSpecificBrandSuccess extends GetSpecificBrandState {
  final SpecificBrandModel specificBrandModel;

  GetSpecificBrandSuccess({required this.specificBrandModel});
}

final class GetSpecificBrandError extends GetSpecificBrandState {
  final String error;

  GetSpecificBrandError({
    required this.error,
  });
}
