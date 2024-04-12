import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/models/Coupon%20Models/all_coupons_model.dart';
import 'package:smart_auction/core/services/coupons%20service/coupons%20service.dart';

part 'get_all_coupons_state.dart';

class GetAllCouponsCubit extends Cubit<GetAllCouponsState> {
  GetAllCouponsCubit() : super(GetAllCouponsInitial());

  Future<void> getAllCoupons() async {
    emit(GetAllCouponsLoading());
    Either<ServerFailure, AllCouponsModel> result =
        await CouponsService().getAllCoupons();

    result.fold(
      (serverFailure) => emit(
        GetAllCouponsFailure(
          errorMessage: serverFailure.errMessage,
        ),
      ),
      (allCoupons) => emit(
        GetAllCouponsSucccess(
          allCouponsModel: allCoupons,
        ),
      ),
    );
  }
}
