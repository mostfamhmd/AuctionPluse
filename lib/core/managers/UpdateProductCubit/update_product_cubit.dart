import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/services/Update%20Product%20Service/update_product_service.dart';

part 'update_product_state.dart';

class UpdateProductCubit extends Cubit<UpdateProductState> {
  UpdateProductCubit() : super(UpdateProductInitial());
  Future<void> updateProductCubit({
    required String? productId,
    String? productName,
    String? productDescription,
    String? productPrice,
    String? productDiscount,
    String? productQuantity,
    String? categoryId,
    List<String>? listSubCategoryId,
    String? brandId,
    dynamic imageFile,
    List<dynamic>? listImageFile,
    List<String>? colors,
  }) async {
    emit(UpdateProductLoading());
    Either<ServerFailure, String> result =
        await UpdateProductService().updateProductService(
      productId: productId,
      productName: productName,
      productDescription: productDescription,
      productDiscount: productDiscount,
      productPrice: productPrice,
      productQuantity: productQuantity,
      categoryId: categoryId,
      colors: colors,
      listSubCategoryId: listSubCategoryId,
      brandId: brandId,
      imageFile: imageFile,
      listImageFile: listImageFile,
    );

    result.fold(
      (failure) => emit(
        UpdateProductFailure(
          failure: failure.errMessage,
        ),
      ),
      (success) => emit(
        UpdateProductSuccess(
          success: success,
        ),
      ),
    );
  }
}
