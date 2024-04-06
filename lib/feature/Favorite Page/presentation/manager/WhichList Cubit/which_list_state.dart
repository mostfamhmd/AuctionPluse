part of 'which_list_cubit.dart';

sealed class WhichListState {}

final class WhichListInitial extends WhichListState {}

final class WhichListLoading extends WhichListState {}

final class WhichListSuccess extends WhichListState {
  final WhichListModel whichListModel;

  WhichListSuccess({required this.whichListModel});
}

final class WhichListError extends WhichListState {
  final String error;
  WhichListError({required this.error});
}
