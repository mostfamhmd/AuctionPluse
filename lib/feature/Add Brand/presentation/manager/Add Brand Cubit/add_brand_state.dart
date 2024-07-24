part of 'add_brand_cubit.dart';

sealed class AddBrandState {}

final class AddBrandInitial extends AddBrandState {}

final class AddBrandLoading extends AddBrandState {}

final class AddBrandSuccess extends AddBrandState {
  final AddBrandModel addBrandModel;

  AddBrandSuccess({required this.addBrandModel});
}

final class AddBrandFailure extends AddBrandState {
  final String errorMessage;

  AddBrandFailure({required this.errorMessage});
}
