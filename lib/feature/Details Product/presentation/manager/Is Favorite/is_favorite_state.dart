part of 'is_favorite_cubit.dart';

abstract class IsFavoriteState {}

class IsFavoriteInitial extends IsFavoriteState {}

class IsFavoriteLoading extends IsFavoriteState {}

class IsFavoriteSuccess extends IsFavoriteState {
  final AddProductWhichList addProductWhichList;
  IsFavoriteSuccess({required this.addProductWhichList});
}

class IsFavoriteFailure extends IsFavoriteState {
  final String serverFailure;
  IsFavoriteFailure({required this.serverFailure});
}
