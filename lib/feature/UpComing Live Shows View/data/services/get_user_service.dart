import 'package:dio/dio.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/user_data_model/user_data_model.dart';

class GetUserService {
  Dio dioHelper = Dio();

  Stream getUser({required String userID}) async* {
    try {
      String token = await AppConsts.getData(AppConsts.kUserToken);
      Map<String, dynamic>? headers = {'Authorization': 'Bearer $token'};
      final response = await dioHelper.get(
        "${AppConsts.kBaseurl}users/$userID",
        options: Options(
          headers: headers,
        ),
      );
      if (response.statusCode == 200) {
        UserDataModel allRoomsModel = UserDataModel.fromJson(response.data);
        yield allRoomsModel;
      }
    } on DioException catch (error) {
      yield error.message;
    } catch (e) {
      yield e.toString();
    }
  }
}
