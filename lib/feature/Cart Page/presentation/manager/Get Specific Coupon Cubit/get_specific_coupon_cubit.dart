import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/models/Coupon%20Models/all_coupons_model.dart';
import 'package:smart_auction/core/services/coupons%20service/coupons%20service.dart';

part 'get_specific_coupon_state.dart';

class GetSpecificCouponCubit extends Cubit<GetSpecificCouponState> {
  GetSpecificCouponCubit() : super(GetSpecificCouponInitial());

  Future<void> getSpecificCoupon({
    required String couponName,
  }) async {
    emit(GetSpecificCouponLoading());
    Either<ServerFailure, AllCouponsModel> result =
        await CouponsService().getSpecificCoupons(
      couponName: couponName,
    );

    result.fold(
      (serverFailure) => emit(
        GetSpecificCouponError(
          errorMessage: serverFailure.errMessage,
        ),
      ),
      (specificCoupon) => emit(
        GetSpecificCouponSuccess(
          specificCouponModel: specificCoupon,
        ),
      ),
    );
  }
}
