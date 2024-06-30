import 'package:dio/dio.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/all_rooms_models/all_rooms_models.dart';

class AllRoomsService {
  Dio dioHelper = Dio();

  Stream getRooms() async* {
    while (true) {
      try {
        String token = await AppConsts.getData(AppConsts.kUserToken);
        Map<String, dynamic>? headers = {'Authorization': 'Bearer $token'};
        final response = await dioHelper.get(
          "${AppConsts.kBaseurl}rooms/allrooms/paginated?",
          options: Options(
            headers: headers,
          ),
        );
        if (response.statusCode == 200) {
          AllRoomsModel allRoomsModel =
              AllRoomsModel.fromJsonToDart(response.data);
          yield allRoomsModel;
        }
      } on DioException catch (error) {
        throw error.message!;
      } catch (e) {
        throw e.toString();
      }
      await Future.delayed(const Duration(seconds: 60));
    }
  }
}
