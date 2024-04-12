import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/services/coupons%20service/coupons%20service.dart';

part 'delete_coupon_state.dart';

class DeleteCouponCubit extends Cubit<DeleteCouponState> {
  DeleteCouponCubit() : super(DeleteCouponInitial());

  Future<void> deleteCoupon({
    required String couponId,
  }) async {
    emit(DeleteCouponLoading());
    Either<ServerFailure, String> result = await CouponsService().deleteCoupon(
      couponId: couponId,
    );

    result.fold(
      (serverFailure) => emit(
        DeleteCouponFailure(
          error: serverFailure.errMessage,
        ),
      ),
      (deletedCoupon) => emit(
        DeleteCouponSuccess(
          success: deletedCoupon,
        ),
      ),
    );
  }
}
