part of 'all_users_cubit.dart';

sealed class AllUsersState {}

final class AllUsersInitial extends AllUsersState {}

final class AllUsersLoading extends AllUsersState {}

final class AllUsersSuccess extends AllUsersState {
  final AllUsersModel users;

  AllUsersSuccess({required this.users});
}

final class AllUsersError extends AllUsersState {
  final String error;

  AllUsersError({required this.error});
}
