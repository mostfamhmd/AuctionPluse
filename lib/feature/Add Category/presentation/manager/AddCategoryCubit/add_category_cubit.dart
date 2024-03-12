import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/feature/Add%20Category/data/model/add_category_model.dart';
import 'package:smart_auction/feature/Add%20Category/data/services/add_category_services.dart';

part 'add_category_state.dart';

class AddCategoryCubit extends Cubit<AddCategoryState> {
  AddCategoryCubit() : super(AddCategoryInitial());

  Future<void> addCategoryCubit(
      {required String name, required File photo}) async {
    emit(AddCategoryLoading());
    Either<ServerFailure, AddCategoryModel> result =
        await AddCategoryServices().addCategoryService(
      name: name,
      photo: photo,
    );
    result.fold((serverFailure) {
      emit(AddCategoryFailed(error: serverFailure.errMessage));
    }, (addCategoryModel) {
      emit(
        AddCategorySuccess(addCategoryModel: addCategoryModel),
      );
    });
  }
}
