import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/feature/Favorite%20Page/data/model/which_list_model.dart';
import 'package:smart_auction/feature/Favorite%20Page/data/service/which_list_service.dart';

part 'which_list_state.dart';

class WhichListCubit extends Cubit<WhichListState> {
  WhichListCubit() : super(WhichListInitial());

  Future<void> getWhichList() async {
    emit(WhichListLoading());
    Either<ServerFailure, WhichListModel> result =
        await WhichListServices().whichListServices();

    result.fold(
      (errorMessage) => emit(
        WhichListError(error: errorMessage.errMessage),
      ),
      (whichListModel) => emit(
        WhichListSuccess(whichListModel: whichListModel),
      ),
    );
  }
}
