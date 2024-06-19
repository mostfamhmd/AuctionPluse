import 'dart:convert';

class InvitedId {
  String? id;
  String? email;

  InvitedId({this.id, this.email});

  factory InvitedId.fromJsonToInvitedID(Map<String, dynamic> data) {
    return InvitedId(
      id: data['_id'] as String?,
      email: data['email'] as String?,
    );
  }

  Map<String, dynamic> toInvitedID() {
    return {
      '_id': id,
      'email': email,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [InvitedId].
  factory InvitedId.fromJson(String data) {
    return InvitedId.fromJsonToInvitedID(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [InvitedId] to a JSON string.
  String toJson() => json.encode(toInvitedID());
}
