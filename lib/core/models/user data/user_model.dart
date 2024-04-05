import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 1, adapterName: 'UserModelAdapter')
class UserModel extends HiveObject {
  @HiveField(0)
  dynamic userData;

  UserModel({
    required this.userData,
  });
}
