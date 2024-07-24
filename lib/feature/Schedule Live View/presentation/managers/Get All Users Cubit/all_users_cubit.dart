import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/data/models/all_users_model.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/data/services/get_users_service.dart';

part 'all_users_state.dart';

class AllUsersCubit extends Cubit<AllUsersState> {
  AllUsersCubit() : super(AllUsersInitial());

  Future<void> getAllUsers() async {
    Either<ServerFailure, AllUsersModel> resultUsers =
        await GetUsersService().getAllUsers();

    resultUsers.fold(
      (error) => emit(
        AllUsersError(
          error: error.errMessage,
        ),
      ),
      (resultUsers) => emit(
        AllUsersSuccess(
          users: resultUsers,
        ),
      ),
    );
  }
}
