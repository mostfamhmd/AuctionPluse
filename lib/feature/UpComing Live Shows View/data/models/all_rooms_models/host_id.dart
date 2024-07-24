import 'dart:convert';

class HostId {
  String? id;
  String? email;

  HostId({this.id, this.email});

  factory HostId.fromJsonToHostID(Map<String, dynamic> data) {
    return HostId(
      id: data['_id'] as String?,
      email: data['email'] as String?,
    );
  }

  Map<String, dynamic> toHostID() {
    return {
      '_id': id,
      'email': email,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [HostId].
  factory HostId.fromJson(String data) {
    return HostId.fromJsonToHostID(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [HostId] to a JSON string.
  String toJson() => json.encode(toHostID());
}
