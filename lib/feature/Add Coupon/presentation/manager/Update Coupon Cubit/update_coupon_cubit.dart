import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/models/Coupon%20Models/specific_coupon_model.dart';
import 'package:smart_auction/core/services/coupons%20service/coupons%20service.dart';

part 'update_coupon_state.dart';

class UpdateCouponCubit extends Cubit<UpdateCouponState> {
  UpdateCouponCubit() : super(UpdateCouponInitial());

  Future<void> updateSpecificCoupon({
    required String name,
    required String couponId,
    required String exipryDate,
    required num discount,
  }) async {
    emit(UpdateCouponLoading());
    Either<ServerFailure, SpecificCouponModel> result =
        await CouponsService().updateCoupon(
      name: name,
      couponId: couponId,
      discount: discount,
      exiperyDate: exipryDate,
    );

    result.fold(
      (serverFailure) => emit(
        UpdateCouponFailure(
          error: serverFailure.errMessage,
        ),
      ),
      (updatedCoupon) => emit(
        UpdateCouponSuccess(
          specificCouponModel: updatedCoupon,
        ),
      ),
    );
  }
}
