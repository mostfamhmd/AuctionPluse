import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/feature/Add%20Brand/data/model/add_brand_model.dart';
import 'package:smart_auction/feature/Add%20Brand/data/services/add_brand_service.dart';

part 'add_brand_state.dart';

class AddBrandCubit extends Cubit<AddBrandState> {
  AddBrandCubit() : super(AddBrandInitial());

  addBrand({required String name, required File photo}) async {
    emit(
      AddBrandLoading(),
    );
    Either<ServerFailure, AddBrandModel> result =
        await AddBrandService().addBrandServices(name: name, photo: photo);
    result.fold(
      (serverFailure) => emit(
        AddBrandFailure(
          errorMessage: serverFailure.toString(),
        ),
      ),
      (addBrand) => emit(
        AddBrandSuccess(
          addBrandModel: addBrand,
        ),
      ),
    );
  }
}
