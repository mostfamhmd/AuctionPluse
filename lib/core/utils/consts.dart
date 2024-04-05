import 'package:smart_auction/core/helpers/cache_helper.dart';

class AppConsts {
  static const kUserId = "userId";
  static const kUserToken = "userToken";
  static const kUserName = "userName";
  static const kUserEmail = "userEmail";
  static const kUserRole = "userRole";
  static const kUserWhichlist = "userWhichlist";
  static const kBaseurl = "https://graduation-api-qq1p.onrender.com/api/v1/";
  static const kUserDataBox = "userdata";
  static getData(String key) async {
    return await CacheHelper.getData(key);
  }
}
