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
  static const kUserOnBording = "false";
  static getData(String key) async {
    return await CacheHelper.getData(key);
  }

  static removeData(String key) async {
    return await CacheHelper().removeValue(key);
  }
}
//https://graduation-api-qq1p.onrender.com

//http://62.72.19.133:8000