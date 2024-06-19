import 'dart:convert';

import 'data.dart';

class UserDataModel {
  Data? data;

  UserDataModel({this.data});

  factory UserDataModel.fromJsonToDart(Map<String, dynamic> data) {
    return UserDataModel(
      data: data['data'] == null
          ? null
          : Data.fromJsonToUserData(data['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toUserDataModel() {
    return {
      'data': data?.toDataUser(),
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserDataModel].
  factory UserDataModel.fromJson(String data) {
    return UserDataModel.fromJsonToDart(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserDataModel] to a JSON string.
  String toJson() => json.encode(toUserDataModel());
}
