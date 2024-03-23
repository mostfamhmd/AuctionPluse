import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/feature/Add%20Product/data/model/add_product_model.dart';
import 'package:smart_auction/feature/Add%20Product/data/services/add_product_services.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitial());
  Future<void> addProduct(
      {required String name,
      required String description,
      required File imageCover,
      required List<File> images,
      required String brandId,
      required String categoryId,
      required List<String> subCategoriesId,
      required String realPrice,
      required String discountedPrice,
      required String quantity,
      required List<String> colors}) async {
    emit(AddProductLoading());
    Either<ServerFailure, AddProductModel> result = await AddProductServices()
        .addCategoryService(
            name: name,
            description: description,
            imageCover: imageCover,
            images: images,
            brandId: brandId,
            categoryId: categoryId,
            subCategoriesId: subCategoriesId,
            realPrice: realPrice,
            discountedPrice: discountedPrice,
            quantity: quantity,
            colors: colors);

    result.fold(
      (serverFailure) {
        emit(
          AddProductFailure(errorMessage: serverFailure.errMessage),
        );
      },
      (addCategoryModel) {
        emit(
          AddProductSuccess(addProductModel: addCategoryModel),
        );
      },
    );
  }
}
