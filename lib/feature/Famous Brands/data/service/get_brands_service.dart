import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/helpers/dio_helper.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/feature/Famous%20Brands/data/model/get_brands_model.dart';

class GetBrandsService {
  DioHelper dioHelper = DioHelper();

  Future<Either<ServerFailure, GetBrandsModel>> getBrandsService() async {
    String token = await AppConsts.getData(AppConsts.kUserToken);
    GetBrandsModel getBrandsModel = GetBrandsModel();
    try {
      Map<String, dynamic> data = await dioHelper.getRequest(
        endPoint: "brands",
        token: token,
      );
      getBrandsModel = GetBrandsModel.fromJson(data);
      return right(getBrandsModel);
    } on DioException catch (e) {
      return left(
        ServerFailure.fromDioException(dioException: e),
      );
    } catch (e) {
      return left(
        ServerFailure(
          errMessage: e.toString(),
        ),
      );
    }
  }
}
