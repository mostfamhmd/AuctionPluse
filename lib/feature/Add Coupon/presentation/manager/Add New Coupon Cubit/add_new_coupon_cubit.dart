import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/services/coupons%20service/coupons%20service.dart';
import 'package:smart_auction/core/models/Coupon%20Models/specific_coupon_model.dart';

part 'add_new_coupon_state.dart';

class AddNewCouponCubit extends Cubit<AddNewCouponState> {
  AddNewCouponCubit() : super(AddNewCouponInitial());

  Future<void> addNewCoupon({
    required String name,
    required String exipryDate,
    required num discount,
  }) async {
    emit(AddNewCouponLoading());
    Either<ServerFailure, SpecificCouponModel> result =
        await CouponsService().addNewCoupon(
      name: name,
      discount: discount,
      exiperyDate: exipryDate,
    );

    result.fold(
      (serverFailure) => emit(
        AddNewCouponError(
          errorMessage: serverFailure.errMessage,
        ),
      ),
      (addedCoupon) => emit(
        AddNewCouponSuccess(
          specificCouponModel: addedCoupon,
        ),
      ),
    );
  }
}
