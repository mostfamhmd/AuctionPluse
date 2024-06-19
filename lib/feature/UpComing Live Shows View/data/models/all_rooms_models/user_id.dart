import 'dart:convert';

class UserId {
  String? id;
  String? email;

  UserId({this.id, this.email});

  factory UserId.fromJsonToUserID(Map<String, dynamic> data) {
    return UserId(
      id: data['_id'] as String?,
      email: data['email'] as String?,
    );
  }

  Map<String, dynamic> toUserID() {
    return {
      '_id': id,
      'email': email,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserId].
  factory UserId.fromJson(String data) {
    return UserId.fromJsonToUserID(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserId] to a JSON string.
  String toJson() => json.encode(toUserID());
}
