import 'dart:convert';

class OwnerId {
  String? id;
  String? email;

  OwnerId({this.id, this.email});

  factory OwnerId.fromJsonToOwnerID(Map<String, dynamic> data) {
    return OwnerId(
      id: data['_id'] as String?,
      email: data['email'] as String?,
    );
  }

  Map<String, dynamic> toOwnerID() {
    return {
      '_id': id,
      'email': email,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OwnerId].
  factory OwnerId.fromJson(String data) {
    return OwnerId.fromJsonToOwnerID(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [OwnerId] to a JSON string.
  String toJson() => json.encode(toOwnerID());
}
